import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note/screens/edit_screen.dart';

import '../data/constants/constants.dart';
import '../data/models/task.dart';
import '../utility/utility.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});

  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      height: 132,
      width: double.infinity,
      decoration: BoxDecoration(
        color: taskBoxColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
            widget.task.isDone = isChecked;
            widget.task.save();
          });
        },
        child: Padding(
          padding: EdgeInsets.all(12),
          child: getMainContent(),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      children: [
        Image.asset(widget.task.taskType.taskTypeImage),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.task.title),
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      checkColor: taskBoxColor,
                      activeColor: green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      value: isChecked,
                      onChanged: (isDone) {
                        isChecked = isDone!;
                        widget.task.isDone = isChecked;
                        widget.task.save();
                      },
                    ),
                  )
                ],
              ),
              Text(
                widget.task.subTitle,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              getTimeAndEditBadgs()
            ],
          ),
        ),
      ],
    );
  }

  Row getTimeAndEditBadgs() {
    return Row(
      children: [
        Container(
          width: 90,
          height: 28,
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${isLowerThanTenClock(widget.task.time.hour)}:${isLowerThanTenClock(widget.task.time.minute)}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditScreen(
                  task: widget.task,
                ),
              ),
            );
          },
          child: Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Edit',
                    style: TextStyle(color: green),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset('images/icon_edit.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
