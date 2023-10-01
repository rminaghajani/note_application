import 'package:note/data/models/task_type_enum.dart';

import '../data/models/task_type.dart';

List<TaskType> getListOfTaskTypes() {
  return [
    TaskType(
      status: TaskTypeStatus.bank,
      taskTypeName: 'Bank',
      taskTypeImage: 'images/banking.png',
    ),
    TaskType(
      status: TaskTypeStatus.work,
      taskTypeName: 'Work',
      taskTypeImage: 'images/hard_working.png',
    ),
    TaskType(
      status: TaskTypeStatus.meditate,
      taskTypeName: 'Meditation',
      taskTypeImage: 'images/meditate.png',
    ),
    TaskType(
      status: TaskTypeStatus.hangOut,
      taskTypeName: 'Hang out',
      taskTypeImage: 'images/social_friends.png',
    ),
    TaskType(
      status: TaskTypeStatus.workout,
      taskTypeName: 'Workout',
      taskTypeImage: 'images/workout.png',
    ),
    TaskType(
      status: TaskTypeStatus.meeting,
      taskTypeName: 'Meeting',
      taskTypeImage: 'images/work_meeting.png',
    ),
  ];
}

String isLowerThanTenClock(int num) {
  if (num < 10) {
    return '0${num}';
  } else {
    return '${num}';
  }
}
