import 'package:conone/models/taskModel.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final void Function(String task, bool isChecked) addTdata;
  final taskModel taskt;

  const TaskTile({super.key, required this.taskt, required this.addTdata});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

void onAddTask(taskModel Task) {}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  bool? wcheck;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                widget.taskt.task.toString().toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Checkbox(
                value: isChecked,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                    widget.addTdata(
                        widget.taskt.task.toString().trim(), isChecked);

                    // ignore: avoid_print
                    print("value changed to : ");
                    // ignore: avoid_print
                    print(isChecked);
                    // ignore: avoid_print
                    print(widget.taskt.task);
                  });
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

  //

    
