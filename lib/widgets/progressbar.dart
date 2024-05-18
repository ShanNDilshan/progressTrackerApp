import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar(
      {super.key,
      required this.width,
      required this.height,
      required this.progress});

  final double width;
  final double height;
  final double progress;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            width: widget.progress,
            height: widget.height,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 152, 156, 202),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '${(widget.progress / 3).toStringAsFixed(2)}%',
              style: const TextStyle(
                  color: Color.fromARGB(255, 20, 15, 15),
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
