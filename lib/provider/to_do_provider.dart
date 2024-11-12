import 'package:flutter/material.dart';

import '../model/task_model.dart';

class ToDoProvider with ChangeNotifier{
  final List<Task> tasks = [];
  final TextEditingController taskController = TextEditingController();

  void addTask(String title) {
    if (title.isNotEmpty) {
        tasks.add(Task(title: title));
      taskController.clear();
    }
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    // setState(() {
      tasks[index].isComplete = !tasks[index].isComplete;
    // });
    notifyListeners();
  }

}