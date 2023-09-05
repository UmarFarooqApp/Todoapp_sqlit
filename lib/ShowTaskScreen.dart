import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EditDialoge.dart';
import 'core/TaskProivder.dart';


class ShowAllTasksScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: Text('All Tasks'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context,viewModel,child) {
          return ListView.builder(
            itemCount: viewModel.tasks.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(child: Text((index+1).toString())),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(viewModel.tasks[index].task.toString())),
                      TextButton(onPressed: (){showDialog(context: context, builder: (context)=>MyAlertDialog(id: viewModel.tasks[index].id));
                      print('task id is ${viewModel.tasks[index].id}');
                          viewModel.getAllTask();
                      }, child: Text("Edit"))
                    ],
                  ),
                  trailing:IconButton(onPressed: () { viewModel.deleteTask(viewModel.tasks[index].id);
                  viewModel.getAllTask();
                    },icon: Icon(Icons.delete)),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
