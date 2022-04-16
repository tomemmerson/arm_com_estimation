#if (ARDUINO >= 100)
  #include <Arduino.h>
#else
  #include <WProgram.h>
#endif
#include <ros.h>

#include <moveo_moveit/ArmJointState.h>
#include <HX711.h>
#include <moveo_moveit/GripperState.h>
#include <Servo.h> 
#include <std_msgs/Bool.h>
#include <std_msgs/String.h>
#include <math.h>
#include <std_msgs/Int16.h>
#include <std_msgs/UInt16.h>
#include <std_msgs/UInt16MultiArray.h>
#include <AccelStepper.h>
#include <MultiStepper.h>

// Joint 1
#define E1_STEP_PIN        36
#define E1_DIR_PIN         34
#define E1_ENABLE_PIN      30

// Joint 2
#define Z_STEP_PIN         46
#define Z_DIR_PIN          48
#define Z_ENABLE_PIN       62
#define Z_MIN_PIN          18
#define Z_MAX_PIN          19

// Joint 3
#define Y_STEP_PIN         60
#define Y_DIR_PIN          61
#define Y_ENABLE_PIN       56
#define Y_MIN_PIN          14
#define Y_MAX_PIN          15

// Joint 4
#define X_STEP_PIN         54
#define X_DIR_PIN          55
#define X_ENABLE_PIN       38

// Joint 5 
#define E0_STEP_PIN        26
#define E0_DIR_PIN         28
#define E0_ENABLE_PIN      24

AccelStepper joint1(1,E1_STEP_PIN, E1_DIR_PIN);
AccelStepper joint2(1,Z_STEP_PIN, Z_DIR_PIN);
AccelStepper joint3(1,Y_STEP_PIN, Y_DIR_PIN);
AccelStepper joint4(1,X_STEP_PIN, X_DIR_PIN);
AccelStepper joint5(1, E0_STEP_PIN, E0_DIR_PIN);

Servo gripper;
MultiStepper steppers;
HX711 loadcell;

int joint_step[6];
int joint_status = 0;

ros::NodeHandle nh;
std_msgs::Int16 msg;
moveo_moveit::GripperState gripState;

// Publisher for the sensor state of the gripper
ros::Publisher feed("gripper_state",&gripState);

void arm_cb(const moveo_moveit::ArmJointState& arm_steps){
  joint_status = 1;
  joint_step[0] = arm_steps.position1;
  joint_step[1] = arm_steps.position2;
  joint_step[2] = arm_steps.position3;
  joint_step[3] = arm_steps.position4;
  joint_step[4] = arm_steps.position5;
  joint_step[5] = arm_steps.position6; //gripper position <0-180>
}

void gripper_cb( const std_msgs::UInt16& cmd_msg){
  gripper.write(cmd_msg.data); // Set servo angle, should be from 0-180  
  digitalWrite(13, HIGH-digitalRead(13));  // Toggle led  
}

// Publish the state of the gripper sensors
void pubGripState() {
  gripState.f1_top_sensor = loadcell.get_units();

  feed.publish(&gripState);
}

//instantiate subscribers
ros::Subscriber<moveo_moveit::ArmJointState> arm_sub("joint_steps",arm_cb); //subscribes to joint_steps on arm
ros::Subscriber<std_msgs::UInt16> gripper_sub("gripper_angle", gripper_cb); //subscribes to gripper position
//to publish from terminal: rostopic pub gripper_angle std_msgs/UInt16 <0-180>



void setup() {
  pinMode(13,OUTPUT);
  joint_status = 1;

  nh.initNode();
  nh.subscribe(arm_sub);
  nh.subscribe(gripper_sub);
  nh.advertise(feed);

  // Configure each stepper
  joint1.setMaxSpeed(1500);
  joint2.setMaxSpeed(750);
  joint3.setMaxSpeed(2000);
  joint4.setMaxSpeed(400);
  joint5.setMaxSpeed(400);

  // Then give them to MultiStepper to manage
  steppers.addStepper(joint1);
  steppers.addStepper(joint2);
  steppers.addStepper(joint3);
  steppers.addStepper(joint4);
  steppers.addStepper(joint5);

  // Configure gripper servo
  gripper.attach(11);
  gripper.write(20);
  
  digitalWrite(13, 1); //toggle led

  long positions[5];  // Array of desired stepper positions must be long
  positions[0] = 0; // negated since the real robot rotates in the opposite direction as ROS
  positions[1] = 0; 
  positions[2] = 0; 
  positions[3] = 400; 
  positions[4] = 800; 

  steppers.moveTo(positions);
  steppers.runSpeedToPosition();


  // Configure gripper sensors
  loadcell.begin(57, 58);
  loadcell.set_scale();
  loadcell.tare();
  
  pubGripState();
  
}

void loop() {
  pubGripState();
  
  long positions[5];  // Array of desired stepper positions must be long
  positions[0] = joint_step[0]; // negated since the real robot rotates in the opposite direction as ROS
  positions[1] = joint_step[1]; 
  positions[2] = -joint_step[2]; 
  positions[3] = joint_step[3]; 
  positions[4] = -joint_step[4]; 

  // Publish back to ros to check if everything's correct

  steppers.moveTo(positions);
//  nh.spinOnce();
  steppers.run(); // Blocks until all are in position

  nh.spinOnce();
  delay(1);
  
}