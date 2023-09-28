import 'package:hive/hive.dart';

part 'task_type_enum.g.dart';

@HiveType(typeId: 1)
enum TaskTypeStatus {
  @HiveField(0)
  bank,

  @HiveField(1)
  work,

  @HiveField(2)
  meditate,

  @HiveField(3)
  hangOut,

  @HiveField(4)
  workout,

  @HiveField(5)
  meeting,
}
