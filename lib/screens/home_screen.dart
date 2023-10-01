import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note/data/constants/constants.dart';
import 'package:note/data/models/task.dart';
import 'package:note/screens/add_screen.dart';
import 'package:note/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskBox = Hive.box<Task>('TaskBox');
  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgrcColor,
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
          backgroundColor: green,
          child: Image.asset('images/icon_add.png'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddScreen(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Center(
            child: ValueListenableBuilder(
                valueListenable: taskBox.listenable(),
                builder: (context, value, child) {
                  return NotificationListener<UserScrollNotification>(
                    onNotification: (notif) {
                      setState(() {
                        if (notif.direction == ScrollDirection.forward) {
                          isFabVisible = true;
                        } else if (notif.direction == ScrollDirection.reverse) {
                          isFabVisible = false;
                        }
                      });
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: taskBox.values.length,
                      itemBuilder: (context, index) {
                        return getTaskItem(taskBox.values.toList()[index]);
                      },
                    ),
                  );
                })),
      ),
    );
  }

  Widget getTaskItem(Task task) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        task.delete();
      },
      child: TaskWidget(
        task: task,
      ),
    );
  }
}
