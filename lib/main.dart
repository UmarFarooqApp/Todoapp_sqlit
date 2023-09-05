import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddTaskScreen.dart';
import 'ShowTaskScreen.dart';
import 'core/TaskProivder.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Task List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: AddTaskScreen(),

      ),
    );
  }
}





