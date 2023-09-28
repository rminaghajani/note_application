// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTypeAdapter extends TypeAdapter<TaskType> {
  @override
  final int typeId = 2;

  @override
  TaskType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskType(
      status: fields[2] as TaskTypeStatus,
      taskTypeName: fields[0] as String,
      taskTypeImage: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskType obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.taskTypeName)
      ..writeByte(1)
      ..write(obj.taskTypeImage)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
