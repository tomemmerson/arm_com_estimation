; Auto-generated. Do not edit!


(cl:in-package moveo_moveit-msg)


;//! \htmlinclude GripperState.msg.html

(cl:defclass <GripperState> (roslisp-msg-protocol:ros-message)
  ((f1_top_sensor
    :reader f1_top_sensor
    :initarg :f1_top_sensor
    :type cl:fixnum
    :initform 0)
   (f1_left_sensor
    :reader f1_left_sensor
    :initarg :f1_left_sensor
    :type cl:fixnum
    :initform 0)
   (f1_right_sensor
    :reader f1_right_sensor
    :initarg :f1_right_sensor
    :type cl:fixnum
    :initform 0)
   (f2_top_sensor
    :reader f2_top_sensor
    :initarg :f2_top_sensor
    :type cl:fixnum
    :initform 0)
   (f2_left_sensor
    :reader f2_left_sensor
    :initarg :f2_left_sensor
    :type cl:fixnum
    :initform 0)
   (f2_right_sensor
    :reader f2_right_sensor
    :initarg :f2_right_sensor
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GripperState (<GripperState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveo_moveit-msg:<GripperState> is deprecated: use moveo_moveit-msg:GripperState instead.")))

(cl:ensure-generic-function 'f1_top_sensor-val :lambda-list '(m))
(cl:defmethod f1_top_sensor-val ((m <GripperState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveo_moveit-msg:f1_top_sensor-val is deprecated.  Use moveo_moveit-msg:f1_top_sensor instead.")
  (f1_top_sensor m))

(cl:ensure-generic-function 'f1_left_sensor-val :lambda-list '(m))
(cl:defmethod f1_left_sensor-val ((m <GripperState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveo_moveit-msg:f1_left_sensor-val is deprecated.  Use moveo_moveit-msg:f1_left_sensor instead.")
  (f1_left_sensor m))

(cl:ensure-generic-function 'f1_right_sensor-val :lambda-list '(m))
(cl:defmethod f1_right_sensor-val ((m <GripperState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveo_moveit-msg:f1_right_sensor-val is deprecated.  Use moveo_moveit-msg:f1_right_sensor instead.")
  (f1_right_sensor m))

(cl:ensure-generic-function 'f2_top_sensor-val :lambda-list '(m))
(cl:defmethod f2_top_sensor-val ((m <GripperState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveo_moveit-msg:f2_top_sensor-val is deprecated.  Use moveo_moveit-msg:f2_top_sensor instead.")
  (f2_top_sensor m))

(cl:ensure-generic-function 'f2_left_sensor-val :lambda-list '(m))
(cl:defmethod f2_left_sensor-val ((m <GripperState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveo_moveit-msg:f2_left_sensor-val is deprecated.  Use moveo_moveit-msg:f2_left_sensor instead.")
  (f2_left_sensor m))

(cl:ensure-generic-function 'f2_right_sensor-val :lambda-list '(m))
(cl:defmethod f2_right_sensor-val ((m <GripperState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveo_moveit-msg:f2_right_sensor-val is deprecated.  Use moveo_moveit-msg:f2_right_sensor instead.")
  (f2_right_sensor m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperState>) ostream)
  "Serializes a message object of type '<GripperState>"
  (cl:let* ((signed (cl:slot-value msg 'f1_top_sensor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'f1_left_sensor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'f1_right_sensor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'f2_top_sensor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'f2_left_sensor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'f2_right_sensor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperState>) istream)
  "Deserializes a message object of type '<GripperState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'f1_top_sensor) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'f1_left_sensor) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'f1_right_sensor) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'f2_top_sensor) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'f2_left_sensor) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'f2_right_sensor) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperState>)))
  "Returns string type for a message object of type '<GripperState>"
  "moveo_moveit/GripperState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperState)))
  "Returns string type for a message object of type 'GripperState"
  "moveo_moveit/GripperState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperState>)))
  "Returns md5sum for a message object of type '<GripperState>"
  "4717f8a483b0d906256637cd468ea74d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperState)))
  "Returns md5sum for a message object of type 'GripperState"
  "4717f8a483b0d906256637cd468ea74d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperState>)))
  "Returns full string definition for message of type '<GripperState>"
  (cl:format cl:nil "int16 f1_top_sensor~%int16 f1_left_sensor~%int16 f1_right_sensor~%int16 f2_top_sensor~%int16 f2_left_sensor~%int16 f2_right_sensor~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperState)))
  "Returns full string definition for message of type 'GripperState"
  (cl:format cl:nil "int16 f1_top_sensor~%int16 f1_left_sensor~%int16 f1_right_sensor~%int16 f2_top_sensor~%int16 f2_left_sensor~%int16 f2_right_sensor~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperState>))
  (cl:+ 0
     2
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperState>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperState
    (cl:cons ':f1_top_sensor (f1_top_sensor msg))
    (cl:cons ':f1_left_sensor (f1_left_sensor msg))
    (cl:cons ':f1_right_sensor (f1_right_sensor msg))
    (cl:cons ':f2_top_sensor (f2_top_sensor msg))
    (cl:cons ':f2_left_sensor (f2_left_sensor msg))
    (cl:cons ':f2_right_sensor (f2_right_sensor msg))
))
