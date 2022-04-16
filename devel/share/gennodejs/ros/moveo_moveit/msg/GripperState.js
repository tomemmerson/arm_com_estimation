// Auto-generated. Do not edit!

// (in-package moveo_moveit.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GripperState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.f1_top_sensor = null;
      this.f1_left_sensor = null;
      this.f1_right_sensor = null;
      this.f2_top_sensor = null;
      this.f2_left_sensor = null;
      this.f2_right_sensor = null;
    }
    else {
      if (initObj.hasOwnProperty('f1_top_sensor')) {
        this.f1_top_sensor = initObj.f1_top_sensor
      }
      else {
        this.f1_top_sensor = 0;
      }
      if (initObj.hasOwnProperty('f1_left_sensor')) {
        this.f1_left_sensor = initObj.f1_left_sensor
      }
      else {
        this.f1_left_sensor = 0;
      }
      if (initObj.hasOwnProperty('f1_right_sensor')) {
        this.f1_right_sensor = initObj.f1_right_sensor
      }
      else {
        this.f1_right_sensor = 0;
      }
      if (initObj.hasOwnProperty('f2_top_sensor')) {
        this.f2_top_sensor = initObj.f2_top_sensor
      }
      else {
        this.f2_top_sensor = 0;
      }
      if (initObj.hasOwnProperty('f2_left_sensor')) {
        this.f2_left_sensor = initObj.f2_left_sensor
      }
      else {
        this.f2_left_sensor = 0;
      }
      if (initObj.hasOwnProperty('f2_right_sensor')) {
        this.f2_right_sensor = initObj.f2_right_sensor
      }
      else {
        this.f2_right_sensor = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GripperState
    // Serialize message field [f1_top_sensor]
    bufferOffset = _serializer.int16(obj.f1_top_sensor, buffer, bufferOffset);
    // Serialize message field [f1_left_sensor]
    bufferOffset = _serializer.int16(obj.f1_left_sensor, buffer, bufferOffset);
    // Serialize message field [f1_right_sensor]
    bufferOffset = _serializer.int16(obj.f1_right_sensor, buffer, bufferOffset);
    // Serialize message field [f2_top_sensor]
    bufferOffset = _serializer.int16(obj.f2_top_sensor, buffer, bufferOffset);
    // Serialize message field [f2_left_sensor]
    bufferOffset = _serializer.int16(obj.f2_left_sensor, buffer, bufferOffset);
    // Serialize message field [f2_right_sensor]
    bufferOffset = _serializer.int16(obj.f2_right_sensor, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GripperState
    let len;
    let data = new GripperState(null);
    // Deserialize message field [f1_top_sensor]
    data.f1_top_sensor = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [f1_left_sensor]
    data.f1_left_sensor = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [f1_right_sensor]
    data.f1_right_sensor = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [f2_top_sensor]
    data.f2_top_sensor = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [f2_left_sensor]
    data.f2_left_sensor = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [f2_right_sensor]
    data.f2_right_sensor = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveo_moveit/GripperState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4717f8a483b0d906256637cd468ea74d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 f1_top_sensor
    int16 f1_left_sensor
    int16 f1_right_sensor
    int16 f2_top_sensor
    int16 f2_left_sensor
    int16 f2_right_sensor
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GripperState(null);
    if (msg.f1_top_sensor !== undefined) {
      resolved.f1_top_sensor = msg.f1_top_sensor;
    }
    else {
      resolved.f1_top_sensor = 0
    }

    if (msg.f1_left_sensor !== undefined) {
      resolved.f1_left_sensor = msg.f1_left_sensor;
    }
    else {
      resolved.f1_left_sensor = 0
    }

    if (msg.f1_right_sensor !== undefined) {
      resolved.f1_right_sensor = msg.f1_right_sensor;
    }
    else {
      resolved.f1_right_sensor = 0
    }

    if (msg.f2_top_sensor !== undefined) {
      resolved.f2_top_sensor = msg.f2_top_sensor;
    }
    else {
      resolved.f2_top_sensor = 0
    }

    if (msg.f2_left_sensor !== undefined) {
      resolved.f2_left_sensor = msg.f2_left_sensor;
    }
    else {
      resolved.f2_left_sensor = 0
    }

    if (msg.f2_right_sensor !== undefined) {
      resolved.f2_right_sensor = msg.f2_right_sensor;
    }
    else {
      resolved.f2_right_sensor = 0
    }

    return resolved;
    }
};

module.exports = GripperState;
