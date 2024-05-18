import 'package:conone/models/taskModel.dart';
import 'package:conone/widgets/addNewTask.dart';
import 'package:conone/widgets/progressbar.dart';
import 'package:conone/widgets/tasklist.dart';
import 'package:flutter/material.dart';

class TrackerHome extends StatefulWidget {
  TrackerHome({super.key});

  @override
  State<TrackerHome> createState() => _TrackerHomeState();
}

class _TrackerHomeState extends State<TrackerHome> {
  final List<taskModel> _taskList = [];

  List<Map> tiles = [];
  double percentage = 0;

  void taskfunc(String task, bool value) {
    for (int i = 0; i < _taskList.length; i++) {
      if (tiles[i]['name'] == task.toString().trim()) {
        tiles[i]['Ischecked'] = value;
        int tilecount = 0;
        int truecount = 0;
        for (int c = 0; c < tiles.length; c++) {
          tilecount++;
          if (tiles[c]['Ischecked'] == true) {
            truecount++;
          }
        }
        setState(() {
          percentage = (truecount / tilecount) * 300;
        });

        print('percentage is :');
        print(percentage);
        // ignore: avoid_print
        print(tiles);
      }
    }
  }

  //change tiles

  //add method

  void onAddTask(taskModel Task) {
    setState(() {
      _taskList.add(Task);
      tiles.add({'name': Task.task, 'Ischecked': false});
    });
  }

//appBar card function
  void _appCard() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddNewTask(
          addTaskTo: onAddTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "W O R K  WOW",
              style: TextStyle(color: Color.fromARGB(255, 179, 172, 151)),
            ),
            actions: [
              Container(
                color: Colors.yellow,
                child: IconButton(
                  onPressed: _appCard,
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          body: Column(children: [
            const SizedBox(height: 30),
            ProgressBar(
                width: 200, height: 25, progress: percentage.toDouble()),
            const SizedBox(
              height: 30,
            ),
            TaskList(
              taskList: _taskList,
              addTaskData: taskfunc,
            ),
          ]),
        ),
      ),
    );
  }
}
