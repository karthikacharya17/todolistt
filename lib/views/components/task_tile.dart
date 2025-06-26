import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart'; // Add this import
import '../../../models/task.dart';
import '../../../view_models/task_view_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});
 

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context);
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: task.isDone,
        onChanged: (_) => viewModel.toggleTask(task.id),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.share),
        onPressed: () => _shareTask(task),
      ),
    );
  }

  void _shareTask(Task task) {
    final String shareMessage = 'Task: ${task.title} \nStatus: ${task.isDone ? "Done" : "Pending \n This task has been assigned to you! \n For more information Visit www.google.com"}';
    Share.share(shareMessage); // Native share popup
  }
}
