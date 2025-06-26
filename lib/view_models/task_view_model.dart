import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];
  String currentUser = "";

  List<Task> get tasks =>
      _tasks.where((t) => t.owner == currentUser || t.sharedWith.contains(currentUser)).toList();

  void setUser(String user) {
    currentUser = user;
    notifyListeners();
  }

  void addTask(String title) {
    _tasks.add(Task(id: DateTime.now().toString(), title: title, owner: currentUser));
    notifyListeners();
  }

  void toggleTask(String id) {
    final task = _tasks.firstWhere((t) => t.id == id);
    task.isDone = !task.isDone;
    notifyListeners();
  }

  void shareTask(String id, String user) {
    final task = _tasks.firstWhere((t) => t.id == id);
    if (!task.sharedWith.contains(user)) {
      task.sharedWith.add(user);
      notifyListeners();
    }
  }

  void updateTask(String id, String newTitle) {
    final task = _tasks.firstWhere((t) => t.id == id);
    task.title = newTitle;
    notifyListeners();
  }
}
