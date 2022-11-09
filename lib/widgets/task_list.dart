import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task-data.dart';

class TaskList extends StatelessWidget {
  final String? taskTitle;
  final bool isChecked;
  final Function(bool?)? checkBoxCallBack;
  final Function()? longpress;

  TaskList({
    Key? key,
    this.taskTitle,
    this.isChecked = false,
    this.checkBoxCallBack,
    this.longpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<TaskData>(context);
    return ListTile(
      onLongPress: longpress,
      leading: Text(
        taskTitle!,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
