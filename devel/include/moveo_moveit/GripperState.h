// Generated by gencpp from file moveo_moveit/GripperState.msg
// DO NOT EDIT!


#ifndef MOVEO_MOVEIT_MESSAGE_GRIPPERSTATE_H
#define MOVEO_MOVEIT_MESSAGE_GRIPPERSTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace moveo_moveit
{
template <class ContainerAllocator>
struct GripperState_
{
  typedef GripperState_<ContainerAllocator> Type;

  GripperState_()
    : f1_top_sensor(0)
    , f1_left_sensor(0)
    , f1_right_sensor(0)
    , f2_top_sensor(0)
    , f2_left_sensor(0)
    , f2_right_sensor(0)  {
    }
  GripperState_(const ContainerAllocator& _alloc)
    : f1_top_sensor(0)
    , f1_left_sensor(0)
    , f1_right_sensor(0)
    , f2_top_sensor(0)
    , f2_left_sensor(0)
    , f2_right_sensor(0)  {
  (void)_alloc;
    }



   typedef int16_t _f1_top_sensor_type;
  _f1_top_sensor_type f1_top_sensor;

   typedef int16_t _f1_left_sensor_type;
  _f1_left_sensor_type f1_left_sensor;

   typedef int16_t _f1_right_sensor_type;
  _f1_right_sensor_type f1_right_sensor;

   typedef int16_t _f2_top_sensor_type;
  _f2_top_sensor_type f2_top_sensor;

   typedef int16_t _f2_left_sensor_type;
  _f2_left_sensor_type f2_left_sensor;

   typedef int16_t _f2_right_sensor_type;
  _f2_right_sensor_type f2_right_sensor;





  typedef boost::shared_ptr< ::moveo_moveit::GripperState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::moveo_moveit::GripperState_<ContainerAllocator> const> ConstPtr;

}; // struct GripperState_

typedef ::moveo_moveit::GripperState_<std::allocator<void> > GripperState;

typedef boost::shared_ptr< ::moveo_moveit::GripperState > GripperStatePtr;
typedef boost::shared_ptr< ::moveo_moveit::GripperState const> GripperStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::moveo_moveit::GripperState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::moveo_moveit::GripperState_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::moveo_moveit::GripperState_<ContainerAllocator1> & lhs, const ::moveo_moveit::GripperState_<ContainerAllocator2> & rhs)
{
  return lhs.f1_top_sensor == rhs.f1_top_sensor &&
    lhs.f1_left_sensor == rhs.f1_left_sensor &&
    lhs.f1_right_sensor == rhs.f1_right_sensor &&
    lhs.f2_top_sensor == rhs.f2_top_sensor &&
    lhs.f2_left_sensor == rhs.f2_left_sensor &&
    lhs.f2_right_sensor == rhs.f2_right_sensor;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::moveo_moveit::GripperState_<ContainerAllocator1> & lhs, const ::moveo_moveit::GripperState_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace moveo_moveit

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::moveo_moveit::GripperState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::moveo_moveit::GripperState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::moveo_moveit::GripperState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::moveo_moveit::GripperState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::moveo_moveit::GripperState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::moveo_moveit::GripperState_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::moveo_moveit::GripperState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4717f8a483b0d906256637cd468ea74d";
  }

  static const char* value(const ::moveo_moveit::GripperState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4717f8a483b0d906ULL;
  static const uint64_t static_value2 = 0x256637cd468ea74dULL;
};

template<class ContainerAllocator>
struct DataType< ::moveo_moveit::GripperState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "moveo_moveit/GripperState";
  }

  static const char* value(const ::moveo_moveit::GripperState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::moveo_moveit::GripperState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16 f1_top_sensor\n"
"int16 f1_left_sensor\n"
"int16 f1_right_sensor\n"
"int16 f2_top_sensor\n"
"int16 f2_left_sensor\n"
"int16 f2_right_sensor\n"
;
  }

  static const char* value(const ::moveo_moveit::GripperState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::moveo_moveit::GripperState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.f1_top_sensor);
      stream.next(m.f1_left_sensor);
      stream.next(m.f1_right_sensor);
      stream.next(m.f2_top_sensor);
      stream.next(m.f2_left_sensor);
      stream.next(m.f2_right_sensor);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GripperState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::moveo_moveit::GripperState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::moveo_moveit::GripperState_<ContainerAllocator>& v)
  {
    s << indent << "f1_top_sensor: ";
    Printer<int16_t>::stream(s, indent + "  ", v.f1_top_sensor);
    s << indent << "f1_left_sensor: ";
    Printer<int16_t>::stream(s, indent + "  ", v.f1_left_sensor);
    s << indent << "f1_right_sensor: ";
    Printer<int16_t>::stream(s, indent + "  ", v.f1_right_sensor);
    s << indent << "f2_top_sensor: ";
    Printer<int16_t>::stream(s, indent + "  ", v.f2_top_sensor);
    s << indent << "f2_left_sensor: ";
    Printer<int16_t>::stream(s, indent + "  ", v.f2_left_sensor);
    s << indent << "f2_right_sensor: ";
    Printer<int16_t>::stream(s, indent + "  ", v.f2_right_sensor);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVEO_MOVEIT_MESSAGE_GRIPPERSTATE_H