#!/usr/bin/env python

import rospy
import sys
from std_msgs.msg import Float64, UInt16
import math
from sensor_msgs.msg import JointState
import moveit_commander
import moveit_msgs.msg
from moveo_moveit.msg import ArmJointState, GripperState
import geometry_msgs.msg
import subprocess
import signal
import time
import json

def stop_ros():
    subprocess.Popen("rosnode kill -a", shell=True)
    subprocess.Popen("killall rosmaster", shell=True)

def start_ros():
    print("Starting ROS...")

    stop_ros()

    p = subprocess.Popen("roslaunch moveo_moveit_config demo.launch", shell=True)
    subprocess.Popen("rosrun rosserial_python serial_node.py /dev/ttyACM0", shell=True)
    subprocess.Popen("rosrun moveo_moveit conv", shell=True)

    print("ROS Started")
    
    time.sleep(10)
    return p


class Dataloader():
    def __init__(self, filename):
        self.filename = filename

        f = open("./" + filename)
        self.data = json.load(f)
        self.current_test = {}

    def save(self):
        with open("./"+self.filename) as f:
            json.dump(self.data, f)

    def new_test(self, weights):
        self.data["tests"].append({
            "weights": weights,
            "movements": {},
        })
        self.current_test = self.data["tests"][-1]

    def create_new_movement(self, name, start, goal):
        self.current_test["movements"][name] = {
            "start": {
                "base": start[0],
                "shoulder": start[1],
                "elbow": start[2],
                "wrist_rotate": start[3],
                "wrist_joint": start[4],
                "gripper": start[5]
            },
            "goal": {
                "base": goal[0],
                "shoulder": goal[1],
                "elbow": goal[2],
                "wrist_rotate": goal[3],
                "wrist_joint": goal[4],
                "gripper": goal[5]
            }
        }
    def save_recording_section(data, movement_name):


class Robot():
    def __init__(self, dataloader):
        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node('arm_controller_core', anonymous=True)

        self.dataloader = dataloader

        self.robot = moveit_commander.RobotCommander()

        self.scene = moveit_commander.PlanningSceneInterface()

        group_name = "arm"

        self.move_group = moveit_commander.MoveGroupCommander(group_name)

        self.gripper_group = moveit_commander.MoveGroupCommander("gripper")

        self.display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',
                                                    moveit_msgs.msg.DisplayTrajectory,
                                                    queue_size=20)
        
        self.gripper_pub = rospy.Publisher('gripper_angle', UInt16, queue_size=4)

        self.recording = False
        self.recording_label = "unnamed"
        self.initial_move_state = self.move_group.get_current_joint_values() + [0]
        self.goal_move_state = self.move_group.get_current_joint_values() + [0]
        self.sensors = rospy.Subscriber("gripper_state", GripperState, self.sensor_callback)
        self.gripper_position = 0

    def sensor_callback(self, data):
        print(data)

        if self.recording:



    def move_gripper(self, pos):
        msg = UInt16()
        msg.data = pos
        self.gripper_position = pos
        self.gripper_pub.publish(msg)
        print("GRIPPER MOVED to {}".format(pos))

    def move_to(self, base, shoulder, elbow, wrist, hand, gripper, label="unnamed", record=False):
        move_group = self.move_group

        joint_goal = move_group.get_current_joint_values()
        self.initial_move_state = joint_goal[:] + [self.gripper_pos]
        joint_goal[0] = base # Base movement
        joint_goal[1] = shoulder # Shoulder
        joint_goal[2] = elbow # Elbow
        joint_goal[3] = wrist #Wrist
        joint_goal[4] = hand # Wrist Up/Down

        self.recording_label = label
        self.recording = record
        self.goal_move_state = joint_goal[:] + [gripper]

        move_group.go(joint_goal, wait=True) # Blocks until move complete
        move_group.stop()
        
        self.move_gripper(gripper)

        self.recording = False
        print("Robot Moved to {}".format(joint_goal))

start_ros()

rob = Robot()

while True:
    input("INFO: Robot Setup! Click to start")
    rob.move_gripper(50)

    rob.move_to(0, 0, math.pi/2, 0 , 0, 50)

    input("INFO: Robot in position! Click to start")

    rob.move_to(0, 0, math.pi/2, 0 , 0, 90) # Grip the object

    # rotate wrist
    rob.move_to(0, 0, math.pi/2, 0 , 0, 90) 
    rob.move_to(0, 0, math.pi/2, -math.pi/2 , 0, 90)
    rob.move_to(0, 0, math.pi/2, math.pi/2 , 0, 90) 
    rob.move_to(0, 0, math.pi/2, 0 , 0, 90) 

    # Rotate wrist up/down

    # Rotate base
    rob.move_to(math.pi/4, 0, math.pi/2, 0, 0, 90) 
    rob.move_to(-math.pi/4, 0, math.pi/2, 0, 0, 90)
    rob.move_to(-math.pi/4, 0, 0, 0, 0, 90)  

    input("Click to put robot back to default?")

    rob.move_to(0, 0, 0, 0 , 0, 0)
# stop_ros()