#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import Float64
import math
from sensor_msgs.msg import JointState
import moveit_commander
import moveit_msgs.msg

def talker():
    pub = rospy.Publisher('/rrbot/joint1_position_controller/command', Float64, queue_size=10)
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        hello_str = "hello world %s" % rospy.get_time()
        position = math.pi/2
        rospy.loginfo(position)
        pub.publish(position)
        rate.sleep()

def print_joint_state(a):
    print(a)

def get_states():
    moveit_commander.roscpp_initialize()
    rospy.init_node('arm_controller_core', anonymous=True)

    robot = moveit_commander.RobotCommander()

    scene = moveit_commander.PlanningSceneInterface()

    group_name = "arm"

    move_group = moveit_commander.MoveGroupCommander(group_name)
    rospy.Subscriber('joint_states', JointState, print_joint_state)
    rospy.spin()

if __name__ == '__main__':
    try:
        get_states()
    except rospy.ROSInterruptException:
        pass