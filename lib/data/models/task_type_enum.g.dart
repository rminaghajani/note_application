// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTypeStatusAdapter extends TypeAdapter<TaskTypeStatus> {
  @override
  final int typeId = 1;

  @override
  TaskTypeStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskTypeStatus.bank;
      case 1:
        return TaskTypeStatus.work;
      case 2:
        return TaskTypeStatus.meditate;
      case 3:
        return TaskTypeStatus.hangOut;
      case 4:
        return TaskTypeStatus.workout;
      case 5:
        return TaskTypeStatus.meeting;
      default:
        return TaskTypeStatus.bank;
    }
  }

  @override
  void write(BinaryWriter writer, TaskTypeStatus obj) {
    switch (obj) {
      case TaskTypeStatus.bank:
        writer.writeByte(0);
        break;
      case TaskTypeStatus.work:
        writer.writeByte(1);
        break;
      case TaskTypeStatus.meditate:
        writer.writeByte(2);
        break;
      case TaskTypeStatus.hangOut:
        writer.writeByte(3);
        break;
      case TaskTypeStatus.workout:
        writer.writeByte(4);
        break;
      case TaskTypeStatus.meeting:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTypeStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
