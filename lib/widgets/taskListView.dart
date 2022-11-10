import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/widgets/task_list.dart';

import '../models/task-data.dart';
import '../models/taskModel.dart';

class TaskListView extends StatefulWidget {
  List<TaskModel> tasks;
  TaskListView({Key? key, required this.tasks}) : super(key: key);

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<TaskData>(context);
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.taskcount,
        itemBuilder: (ctx, i) {
          var ItemsTask = widget.tasks[i];
          return TaskList(
            taskTitle: ItemsTask.name,
            isChecked: ItemsTask.isDone,
            checkBoxCallBack: (bool? checkState) {
              data.updateTask(ItemsTask);
            },
            longpress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: InkWell(
                    onTap: () {
                      data.deleteTask(ItemsTask);
                    },
                    child: Text(
                      'Delete',
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}

// TaskList(
//
//
// ),
// TaskList(
// taskTitle: tasks[1].name,
// isChecked: tasks[1].isDone,
// ),
// TaskList(
// taskTitle: tasks[2].name,
// isChecked: tasks[2].isDone,
// ),
// TaskList(
// taskTitle: tasks[3].name,
// isChecked: tasks[3].isDone,
// ),
