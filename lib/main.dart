import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/screens/add_screen.dart';
import 'package:note/screens/home_screen.dart';

import 'data/models/task.dart';
import 'data/models/task_type.dart';
import 'data/models/task_type_enum.dart';

void main() async {
  // hive part and registering custom types
  await Hive.initFlutter();
  Hive.registerAdapter(TaskTypeStatusAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('TaskBox');

  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Varela',
      ),
      home: HomeScreen(),
    );
  }
}
