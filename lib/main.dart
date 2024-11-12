import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_assignment/provider/to_do_provider.dart';
import 'package:to_do_list_assignment/screen/todolist_screen.dart';



void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ToDoProvider())],
      child: const TodoApp(),
    ));

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListScreen(),
    );
  }
}

