import 'package:flutter/material.dart';
import 'package:note/data/models/task_type.dart';

import '../data/constants/constants.dart';

class TaskTypeWidget extends StatelessWidget {
  TaskTypeWidget({
    super.key,
    required this.selectedTypeIndex,
    required this.taskType,
    required this.index,
  });

  final int selectedTypeIndex;
  final int index;
  final TaskType taskType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (selectedTypeIndex == index) ? green : Colors.white,
        border: Border.all(
            color: (selectedTypeIndex == index) ? Colors.green : Colors.grey,
            width: (selectedTypeIndex == index) ? 3 : 2),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.all(8),
      width: 140,
      child: Column(
        children: [
          Image.asset(taskType.taskTypeImage),
          Text(
            taskType.taskTypeName,
            style: TextStyle(
              fontSize: (selectedTypeIndex == index) ? 18 : 16,
              color: (selectedTypeIndex == index) ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
