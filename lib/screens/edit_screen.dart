import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note/data/models/task_type.dart';
import 'package:note/utility/utility.dart';
import 'package:note/widgets/task_type_widget.dart';
import 'package:time_pickerr/time_pickerr.dart';

import '../data/constants/constants.dart';
import '../data/models/task.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key, required this.task});
  Task task;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  TextEditingController? controllerTaskTitle;
  TextEditingController? controllerTaskDesc;

  int _selectedType = 0;
  DateTime? _time;

  @override
  void initState() {
    super.initState();

    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });

    controllerTaskTitle = TextEditingController(text: widget.task.title);
    controllerTaskDesc = TextEditingController(text: widget.task.subTitle);
    _selectedType = findWhichType(widget.task.taskType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: TextField(
                  controller: controllerTaskTitle,
                  focusNode: negahban1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      fontSize: 17,
                      color: negahban1.hasFocus ? green : gray,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: gray,
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 3,
                        color: green,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: TextField(
                  controller: controllerTaskDesc,
                  focusNode: negahban2,
                  maxLines: 2,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      fontSize: 17,
                      color: negahban2.hasFocus ? green : gray,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: gray,
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 3,
                        color: green,
                      ),
                    ),
                  ),
                ),
              ),
              CustomHourPicker(
                date: widget.task.time,
                elevation: 2,
                negativeButtonText: '',
                titleStyle: TextStyle(
                  color: green,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                positiveButtonStyle: TextStyle(
                  color: green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                onPositivePressed: (context, time) {
                  _time = time;
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getListOfTaskTypes().length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedType = index;
                        });
                      },
                      child: TaskTypeWidget(
                        selectedTypeIndex: _selectedType,
                        taskType: getListOfTaskTypes()[index],
                        index: index,
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  widget.task.title = controllerTaskTitle!.text;
                  widget.task.subTitle = controllerTaskDesc!.text;
                  widget.task.time = _time ?? widget.task.time;
                  widget.task.taskType = getListOfTaskTypes()[_selectedType];
                  widget.task.save();
                  Navigator.pop(context);
                },
                child: Text(
                  'Edit task',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  minimumSize: Size(300, 48),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  int findWhichType(TaskType selectedType) {
    int findedIndex = getListOfTaskTypes().indexWhere(
      (element) {
        if (selectedType.status == element.status) {
          return true;
        }
        return false;
      },
    );
    return findedIndex;
  }

  @override
  void dispose() {
    negahban1.dispose();
    negahban2.dispose();

    super.dispose();
  }
}
