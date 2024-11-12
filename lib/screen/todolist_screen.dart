
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/to_do_provider.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('To-Do List'),
      ),
      body: SafeArea(child: Consumer<ToDoProvider>(
        builder: (context, val, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: val.taskController,
                        decoration: const InputDecoration(
                          labelText: 'New Task',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () => val.addTask(val.taskController.text),
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: val.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: val.tasks[index].isComplete,
                        onChanged: (_) => val.toggleTaskCompletion(index),
                      ),
                      title: Text(
                        val.tasks[index].title,
                        style: TextStyle(
                          fontStyle:val.tasks[index].isComplete
                              ? FontStyle.italic:FontStyle.normal,
                          decoration: val.tasks[index].isComplete
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                    );
                  },
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}