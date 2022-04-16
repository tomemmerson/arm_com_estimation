;; Auto-generated. Do not edit!


(when (boundp 'moveo_moveit::GripperState)
  (if (not (find-package "MOVEO_MOVEIT"))
    (make-package "MOVEO_MOVEIT"))
  (shadow 'GripperState (find-package "MOVEO_MOVEIT")))
(unless (find-package "MOVEO_MOVEIT::GRIPPERSTATE")
  (make-package "MOVEO_MOVEIT::GRIPPERSTATE"))

(in-package "ROS")
;;//! \htmlinclude GripperState.msg.html


(defclass moveo_moveit::GripperState
  :super ros::object
  :slots (_f1_top_sensor _f1_left_sensor _f1_right_sensor _f2_top_sensor _f2_left_sensor _f2_right_sensor ))

(defmethod moveo_moveit::GripperState
  (:init
   (&key
    ((:f1_top_sensor __f1_top_sensor) 0)
    ((:f1_left_sensor __f1_left_sensor) 0)
    ((:f1_right_sensor __f1_right_sensor) 0)
    ((:f2_top_sensor __f2_top_sensor) 0)
    ((:f2_left_sensor __f2_left_sensor) 0)
    ((:f2_right_sensor __f2_right_sensor) 0)
    )
   (send-super :init)
   (setq _f1_top_sensor (round __f1_top_sensor))
   (setq _f1_left_sensor (round __f1_left_sensor))
   (setq _f1_right_sensor (round __f1_right_sensor))
   (setq _f2_top_sensor (round __f2_top_sensor))
   (setq _f2_left_sensor (round __f2_left_sensor))
   (setq _f2_right_sensor (round __f2_right_sensor))
   self)
  (:f1_top_sensor
   (&optional __f1_top_sensor)
   (if __f1_top_sensor (setq _f1_top_sensor __f1_top_sensor)) _f1_top_sensor)
  (:f1_left_sensor
   (&optional __f1_left_sensor)
   (if __f1_left_sensor (setq _f1_left_sensor __f1_left_sensor)) _f1_left_sensor)
  (:f1_right_sensor
   (&optional __f1_right_sensor)
   (if __f1_right_sensor (setq _f1_right_sensor __f1_right_sensor)) _f1_right_sensor)
  (:f2_top_sensor
   (&optional __f2_top_sensor)
   (if __f2_top_sensor (setq _f2_top_sensor __f2_top_sensor)) _f2_top_sensor)
  (:f2_left_sensor
   (&optional __f2_left_sensor)
   (if __f2_left_sensor (setq _f2_left_sensor __f2_left_sensor)) _f2_left_sensor)
  (:f2_right_sensor
   (&optional __f2_right_sensor)
   (if __f2_right_sensor (setq _f2_right_sensor __f2_right_sensor)) _f2_right_sensor)
  (:serialization-length
   ()
   (+
    ;; int16 _f1_top_sensor
    2
    ;; int16 _f1_left_sensor
    2
    ;; int16 _f1_right_sensor
    2
    ;; int16 _f2_top_sensor
    2
    ;; int16 _f2_left_sensor
    2
    ;; int16 _f2_right_sensor
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _f1_top_sensor
       (write-word _f1_top_sensor s)
     ;; int16 _f1_left_sensor
       (write-word _f1_left_sensor s)
     ;; int16 _f1_right_sensor
       (write-word _f1_right_sensor s)
     ;; int16 _f2_top_sensor
       (write-word _f2_top_sensor s)
     ;; int16 _f2_left_sensor
       (write-word _f2_left_sensor s)
     ;; int16 _f2_right_sensor
       (write-word _f2_right_sensor s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _f1_top_sensor
     (setq _f1_top_sensor (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _f1_left_sensor
     (setq _f1_left_sensor (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _f1_right_sensor
     (setq _f1_right_sensor (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _f2_top_sensor
     (setq _f2_top_sensor (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _f2_left_sensor
     (setq _f2_left_sensor (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _f2_right_sensor
     (setq _f2_right_sensor (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get moveo_moveit::GripperState :md5sum-) "4717f8a483b0d906256637cd468ea74d")
(setf (get moveo_moveit::GripperState :datatype-) "moveo_moveit/GripperState")
(setf (get moveo_moveit::GripperState :definition-)
      "int16 f1_top_sensor
int16 f1_left_sensor
int16 f1_right_sensor
int16 f2_top_sensor
int16 f2_left_sensor
int16 f2_right_sensor
")



(provide :moveo_moveit/GripperState "4717f8a483b0d906256637cd468ea74d")


