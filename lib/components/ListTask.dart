import 'package:flutter/material.dart';
import 'package:todo_app/components/Task.dart';
import 'package:todo_app/components/app.dart';

class ListTask extends StatefulWidget {
  List<Todo> todos;
  final void Function(dynamic) onDelete;
  final void Function(dynamic) onMakeAsDone;
  ListTask(
      {Key? key,
      required this.todos,
      required this.onDelete,
      required this.onMakeAsDone})
      : super(key: key);

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          final item = widget.todos[index];
          return Task(
              id: item.id,
              taskName: item.taskName,
              isDone: item.isDone,
              onDelete: () => widget.onDelete(index),
              onMakeAsDone: () => widget.onMakeAsDone(index));
        },
      ),
    );
  }
}
