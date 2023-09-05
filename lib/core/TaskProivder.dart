import 'package:flutter/material.dart';
import 'package:todotaskapp/core/TaskModel.dart';

import 'DataBaseServices.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => [..._tasks];
  final taskservice=TaskDao();

  void addTask(String tasktex) {
    TaskModel task=TaskModel(task: tasktex);
    taskservice.insertTask(task).then((value) => print("task added")).onError((error, stackTrace) =>
        print('error : $error'));

    notifyListeners();
  }
  void getAllTask() async{

    _tasks=await taskservice.getAllTasks();

    notifyListeners();
  }
  void upadate(tasktext, int? id) async{
    TaskModel task=TaskModel(task: tasktext,id: id);

    taskservice.updateTask(task);

    _tasks=await taskservice.getAllTasks();
    notifyListeners();
  }
  void deleteTask(taskId)async {
     taskservice.deleteTask(taskId);
    notifyListeners();
  }
}
