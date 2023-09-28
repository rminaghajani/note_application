import 'package:hive/hive.dart';
import 'package:note/data/models/task_type_enum.dart';

part 'task_type.g.dart';

@HiveType(typeId: 2)
class TaskType {
  TaskType({
    required this.status,
    required this.taskTypeName,
    required this.taskTypeImage,
  });

  @HiveField(0)
  String taskTypeName;

  @HiveField(1)
  String taskTypeImage;

  @HiveField(2)
  TaskTypeStatus status;
}
