import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note/data/models/task_type.dart';
import 'package:note/utility/utility.dart';
import 'package:note/widgets/task_type_widget.dart';
import 'package:time_pickerr/time_pickerr.dart';

import '../data/constants/constants.dart';
import '../data/models/task.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  TextEditingController controllerTaskTitle = TextEditingController();
  TextEditingController controllerTaskDesc = TextEditingController();

  int _selectedType = 0;
  DateTime? _time;

  final taskBox = Hive.box<Task>('TaskBox');

  @override
  void initState() {
    super.initState();

    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
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
                  addTask(
                    title: controllerTaskTitle.text,
                    subTitle: controllerTaskDesc.text,
                    choosenTime: _time ?? DateTime.now(),
                    selectedType: getListOfTaskTypes()[_selectedType],
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  'Add task',
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

  void addTask(
      {required String title,
      required String subTitle,
      required DateTime choosenTime,
      required TaskType selectedType}) {
    Task newTask = Task(
      title: title,
      subTitle: subTitle,
      time: choosenTime,
      taskType: selectedType,
    );
    taskBox.add(newTask);
  }

  @override
  void dispose() {
    negahban1.dispose();
    negahban2.dispose();

    super.dispose();
  }
}
