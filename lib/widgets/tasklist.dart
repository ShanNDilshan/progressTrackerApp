import 'package:conone/models/taskModel.dart';
import 'package:conone/pages/onetask.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  final void Function(String task, bool isChecked) addTaskData;
  // final void Function(String Task) onDeleteTask;
  const TaskList(
      {super.key, required this.taskList, required this.addTaskData});

  final List<taskModel> taskList;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  void sampleFunc(String t, bool v) {
    setState(() {
      widget.addTaskData(t, v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: widget.taskList.length,
      itemBuilder: (context, index) {
        taskModel task = widget.taskList[index];
        return Dismissible(
          key: ValueKey(task),
          child: TaskTile(
            taskt: task,
            addTdata: sampleFunc,
            
          ),
        );
      },
    ));
  }
}

class TileData {
  bool isCompleted;

  TileData({this.isCompleted = false});
}
