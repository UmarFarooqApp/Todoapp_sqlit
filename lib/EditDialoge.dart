import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotaskapp/core/TaskProivder.dart';

class MyAlertDialog extends StatefulWidget {
  int ?id;
  MyAlertDialog({this.id});
  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Task'),
      content: TextField(
        controller: _textFieldController,
        decoration: InputDecoration(labelText: 'Task'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Save the entered text and close the dialog
            String newTask = _textFieldController.text;
            print('task id is ${widget.id}');

            Navigator.pop(context);
            final viewmodel=Provider.of<TaskProvider>(context,listen: false).upadate(newTask,widget.id);


          },
          child: Text('Save'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}

