import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotaskapp/ShowTaskScreen.dart';
import 'package:todotaskapp/progressScreen.dart';


import 'core/TaskProivder.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Task'),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final taskProvider = Provider.of<TaskProvider>(context, listen: false);
                taskProvider.addTask(_taskController.text);
                taskProvider.getAllTask();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowAllTasksScreen()));


              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
