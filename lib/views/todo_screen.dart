import 'package:flutter/material.dart';
import 'package:my_app/views/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../view_models/task_view_model.dart';

class TodoScreen extends StatelessWidget {
  final String currentUser;
  final TextEditingController _controller = TextEditingController();

  TodoScreen({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final taskVM = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        title: const Text('TODO List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,color: Colors.white,),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:  InputDecoration(hintText: 'Enter TODO',
                     border: OutlineInputBorder(
                     borderRadius:  BorderRadius.circular(8),

                  )),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final text = _controller.text.trim();
                    if (text.isNotEmpty) {
                      taskVM.addTask(text, currentUser);
                      _controller.clear();
                    }
                  },
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: taskVM.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskVM.tasks[index];
                  return Card(
                    child: ListTile(
                      title: Text(task.title),
                      subtitle: Text('By: ${task.createdBy}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {
                              Share.share('Task:${task.title}\nStatus: Done \n This task has been assigned to you! \n For more information Visit www.google.com');
                            },
                          ),
                          if (currentUser == 'owner@gmail.com')
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                taskVM.deleteTask(task.id);
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}