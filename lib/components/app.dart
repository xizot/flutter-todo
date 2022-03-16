import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/components/ListTask.dart';
import 'package:todo_app/components/Task.dart';
import 'package:todo_app/constants.dart';

class Todo {
  final dynamic id;
  String taskName;
  bool isDone;
  Todo({required this.id, required this.taskName, required this.isDone});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        taskName: json["taskName"],
        isDone: json["isDone"],
      );
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Todo> listTask = List<Todo>.from([
    {"id": 1, "taskName": 'this is task 1', "isDone": true},
    {"id": 2, "taskName": 'this is task 2', "isDone": false},
    {"id": 3, "taskName": 'this is task 3', "isDone": false},
  ].map((item) => Todo.fromJson(item)));
  final controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding * 1.0),
        child: Column(children: [
          TextFormField(
            controller: controller,
            cursorColor: Theme.of(context).cursorColor,
            maxLength: 20,
            decoration: InputDecoration(
              labelText: 'Enter your task...',
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ElevatedButton.icon(
              onPressed: () {
                addNewTask(controller.text);
              },
              icon: Icon(Icons.add, size: 18),
              label: Text("Add Task"),
            ),
          ),
          Container(
            child: ListTask(
                todos: listTask,
                onDelete: (index) => deleteTaskByIndex(index),
                onMakeAsDone: (index) => makeAsDone(index)),
          )
        ]),
      ),
    );
  }

  void addNewTask(taskName) {
    if (taskName.toString().isEmpty) return;
    setState(() {
      listTask.insert(
          0,
          new Todo(
              id: Random().nextInt(1000) + listTask.length,
              taskName: taskName,
              isDone: false));
    });

    controller.clear();
  }

  void deleteTaskByIndex(index) {
    setState(() {
      listTask.removeAt(index);
    });
  }

  void makeAsDone(index) {
    setState(() {
      listTask[index].isDone = !listTask[index].isDone;
    });
  }
}
