#!/usr/bin/env python

import rospy
import sys
from std_msgs.msg import Float64, UInt16, Int16
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
from datetime import datetime

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

def get_weight_info():
    num_weights = input("No weights: ")

    weights = []
    for i in range(int(num_weights)):
        weight_input = input("Weight {} mass(g), dist(mm): ".format(i))

        wip = weight_input.split(",")
        weights.append({
            "mass": float(wip[0]),
            "dist": float(wip[1])
        })

    return weights

class Dataloader():
    def __init__(self, filename):
        self.filename = filename

        f = open("./" + filename)
        self.data = json.load(f)
        self.current_test = {}

    def reload(self):
        f = open("./" + self.filename)
        self.data = json.load(f)

    def save(self):
        with open("./"+self.filename, 'w') as f:
            json.dump(self.data, f)
        self.reload()

    def new_test(self, weights):
        self.data["tests"].append({
            "weights": weights,
            "movements": {},
        })
        self.current_test = self.data["tests"][-1]

    def delete_current(self):
        self.data["tests"].pop()

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
            },
            "data": [],
        }

    def add_movement_data(self, movement_name, data):
        self.current_test["movements"][movement_name]["data"].append({
            "f1_top": data.f1_top_sensor,
            "f1_left": data.f1_left_sensor,
            "f1_right": data.f1_right_sensor,
            "f2_top": data.f2_top_sensor,
            "f2_left": data.f2_left_sensor,
            "f2_right": data.f2_right_sensor,
            "timestamp": datetime.timestamp(datetime.now()),
        })

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
        self.movement = "unnamed"
        self.sensors = rospy.Subscriber("gripper_state", GripperState, self.sensor_callback)
        self.moving_sub = rospy.Subscriber("motor_state", Int16, self.moving_callback)

        self.is_moving = False
        self.gripper_position = 0

    def moving_callback(self, data):
        if data.data == 1:
            self.is_moving = False
        else:
            self.is_moving = True

    def sensor_callback(self, data):
        if self.recording:
            self.dataloader.add_movement_data(self.movement, data)

    def move_gripper(self, pos):
        msg = UInt16()
        msg.data = pos
        self.gripper_position = pos
        self.gripper_pub.publish(msg)
        print("GRIPPER MOVED to {}".format(pos))

    def move_to(self, base, shoulder, elbow, wrist, hand, gripper, movement=False):
        move_group = self.move_group

        joint_goal = move_group.get_current_joint_values()
        initial_move_state = joint_goal[:] + [self.gripper_position]
        joint_goal[0] = base # Base movement
        joint_goal[1] = shoulder # Shoulder
        joint_goal[2] = elbow # Elbow
        joint_goal[3] = wrist #Wrist
        joint_goal[4] = hand # Wrist Up/Down

        goal_move_state = joint_goal[:] + [gripper]
        
        if movement:
            self.movement = movement
            self.recording = movement != False
            self.dataloader.create_new_movement(movement, initial_move_state, goal_move_state)

        move_group.go(joint_goal, wait=True) # Blocks until move complete
        move_group.stop()
        
        self.move_gripper(gripper)

        while self.is_moving:
            time.sleep(0.05)

        self.recording = False
        print("Robot Moved to {}".format(joint_goal))

start_ros()

loader = Dataloader("data.json")
rob = Robot(loader)

input("Press Enter to move to position")
rob.move_to(0, 0, math.pi/2, 0 , 0, 85)

while True:
    pos = input("INFO: Robot Setup! \n Actions \n0 - Continue in current position\n1 - Move to position from upright\nEnter Choice: ")
    
    if int(pos) != 0:
        rob.move_to(0, 0, math.pi/2, 0 , 0, 70)
    rob.move_gripper(70)

    print("INFO: Robot in position!")

    weights = get_weight_info()
    loader.new_test(weights)

    input("Press Enter to grip object:")
    rob.move_to(0, 0, math.pi/2, 0 , 0, 130) # Grip the object

    input("Press Enter to start:")
    # rotate wrist
    rob.move_to(0, 0, math.pi/2, -math.pi/4, 0, 130, movement="spin_right")
    rob.move_to(0, 0, math.pi/2, 0, 0, 130, movement="right_to_center")
    rob.move_to(0, 0, math.pi/2, math.pi/4 , 0, 130, movement="spin_left") 
    rob.move_to(0, 0, math.pi/2, 0 , 0, 130, movement="left_to_center")  

    # Rotate wrist up/down

    # Rotate elbow
    # rob.move_to(0, 0, math.pi/3, 0 , 0, 105, movement="elbow_up")
    # rob.move_to(0, 0, math.pi/2, 0 , 0, 105, movement="elbow_down")
    s = input("Save Results? y/n: ")

    if s.replace(" ", "") == "y":
        loader.save()
    else:
        loader.delete_current()

# stop_ros()