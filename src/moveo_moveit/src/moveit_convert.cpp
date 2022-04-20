#include "ros/ros.h"
#include "sensor_msgs/JointState.h"
#include "moveo_moveit/ArmJointState.h"
#include "math.h"

moveo_moveit::ArmJointState arm_steps;
moveo_moveit::ArmJointState total;
int stepsPerRevolution[6] = {22400,17000,16500,880,3200,0};  // microsteps/revolution (using 16ths) from observation, for each motor
int joint_status = 0;
double cur_angle[6];
int joint_step[6];
double prev_angle[6] = {0,0,0,0,0,0}; 
double init_angle[6] = {0,0,0,0,0,0};
double total_steps[6] = {0,0,0,0,0,0};
int count = 0;

void cmd_cb(const sensor_msgs::JointState& cmd_arm)
{
  if (count==0){
    prev_angle[0] = cmd_arm.position[0];
    prev_angle[1] = cmd_arm.position[1];
    prev_angle[2] = cmd_arm.position[2];
    prev_angle[3] = cmd_arm.position[3];
    prev_angle[4] = cmd_arm.position[4];
    prev_angle[5] = cmd_arm.position[5];

    init_angle[0] = cmd_arm.position[0];
    init_angle[1] = cmd_arm.position[1];
    init_angle[2] = cmd_arm.position[2];
    init_angle[3] = cmd_arm.position[3];
    init_angle[4] = cmd_arm.position[4];
    init_angle[5] = cmd_arm.position[5];
  }

  arm_steps.position1 = (int)((cmd_arm.position[0]-prev_angle[0])*stepsPerRevolution[0]/(2*M_PI));
  arm_steps.position2 = (int)((cmd_arm.position[1]-prev_angle[1])*stepsPerRevolution[1]/(2*M_PI));
  arm_steps.position3 = (int)((cmd_arm.position[2]-prev_angle[2])*stepsPerRevolution[2]/(2*M_PI));
  arm_steps.position4 = (int)((cmd_arm.position[3]-prev_angle[3])*stepsPerRevolution[3]/(2*M_PI));
  arm_steps.position5 = (int)((cmd_arm.position[4]-prev_angle[4])*stepsPerRevolution[4]/(2*M_PI));
  arm_steps.position6 = (int)((cmd_arm.position[5]-prev_angle[5])*stepsPerRevolution[5]/(2*M_PI));

  if (count!=0){
    prev_angle[0] = cmd_arm.position[0];
    prev_angle[1] = cmd_arm.position[1];
    prev_angle[2] = cmd_arm.position[2];
    prev_angle[3] = cmd_arm.position[3];
    prev_angle[4] = cmd_arm.position[4];
    prev_angle[5] = cmd_arm.position[5];
  }

  total.position1 += arm_steps.position1;
  total.position2 += arm_steps.position2;
  total.position3 += arm_steps.position3;
  total.position4 += arm_steps.position4;
  total.position5 += arm_steps.position5;

  joint_status = 1;
  count=1;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "moveo_moveit");
  ros::NodeHandle nh;
  
  ros::Subscriber sub = nh.subscribe("/move_group/fake_controller_joint_states",1000,cmd_cb);
  ros::Publisher pub = nh.advertise<moveo_moveit::ArmJointState>("joint_steps",50);
  
  ros::Rate loop_rate(10);

  while (ros::ok())
  {
    pub.publish(total);
    ros::spinOnce();
    loop_rate.sleep();  
  }

  //ros::spin();
  return 0;
}