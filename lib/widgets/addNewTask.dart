import 'package:conone/models/taskModel.dart';
import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  final void Function(taskModel task) addTaskTo;

  AddNewTask({
    super.key,
    required this.addTaskTo,
  });

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final _taskController = TextEditingController();
  bool? isChecked;

  void _addTask() {
    if (_taskController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Enter Valied Data"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              )
            ],
          );
        },
      );
    } else {
      setState(() {
        widget.addTaskTo(taskModel(
          task: _taskController.text.toString().trim(),
          isChecked: false,
        ));

        _taskController.clear();
      });
    }
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _taskController,
            decoration: const InputDecoration(
                label: Text("Task"),
                hintText: "Add Task",
                fillColor: Colors.grey,
                hoverColor: Colors.black),
            maxLength: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: _addTask, child: const Text("ADD")),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
