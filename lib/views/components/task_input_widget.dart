import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_models/task_view_model.dart';

class TaskInputWidget extends StatefulWidget {
  const TaskInputWidget({super.key});

  @override
  State<TaskInputWidget> createState() => _TaskInputWidgetState();
}

class _TaskInputWidgetState extends State<TaskInputWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration:  InputDecoration(hintText: 'Enter task',
            border: OutlineInputBorder(
              borderRadius:  BorderRadius.circular(8),
            )),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            if (_controller.text.trim().isNotEmpty) {
              Provider.of<TaskViewModel>(context, listen: false).addTask(_controller.text.trim());
              _controller.clear();
            }
          },
        )
      ],
    );
  }
}
