import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/extensions.dart';

class Task extends StatefulWidget {
  final dynamic id;
  String taskName;
  bool isDone;
  final VoidCallback onDelete;
  final VoidCallback onMakeAsDone;

  Task(
      {Key? key,
      required this.id,
      required this.taskName,
      required this.isDone,
      required this.onDelete,
      required this.onMakeAsDone})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.isDone ? Colors.green[100] : Colors.grey[200],
      child: Row(
        children: [
          Expanded(
              child: Text(
            widget.taskName.toCapitalized(),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                decoration: widget.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          )),
          Checkbox(
            value: widget.isDone,
            onChanged: (value) {
              widget.onMakeAsDone();
            },
            tristate: true,
            activeColor: kPrimaryColor,
          ),
          IconButton(
              onPressed: () {
                widget.onDelete();
              },
              icon: Icon(
                Icons.delete,
                color: Colors.black45,
              ))
        ],
      ),
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(0, 0, 0, kDefaultPadding / 2),
      padding: EdgeInsets.fromLTRB(
          kDefaultPadding * 1.0, 0, kDefaultPadding * 1.0, 0),
    );
  }
}
