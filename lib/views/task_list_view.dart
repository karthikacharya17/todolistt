import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/task_view_model.dart';
import 'components/task_input_widget.dart';
import 'components/task_tile.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        title: Text('${viewModel.currentUser.toUpperCase()}\' TODO LIST',style: TextStyle(fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 19, 24, 27),
        fontFamily: 'IndieFlower'))
        ),
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TaskInputWidget(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.tasks.length,
                itemBuilder: (context, index) => TaskTile(task: viewModel.tasks[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
