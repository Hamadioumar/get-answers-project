import 'package:flutter/material.dart';
import 'package:mytasks/TODO/task_data.dart';
import 'Home_page.dart';
//import 'package:mytasks/modols/task.dart';
import 'package:provider/provider.dart';

class ListTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        margin: EdgeInsets.only(top: 130.0, right: 30.0),
        child: Consumer<DataTask>(
          builder: (BuildContext context, taskdata, Widget child) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return TaskState(
                  taskTitle: taskdata.tasks[index].name,
                  isChecked: taskdata.tasks[index].isDone,
                  CheckBoxCallBack: (value) {
                    taskdata.updateTask(taskdata.tasks[index]);
                  },
                  forDelete: () {
                    taskdata.deleteTask(taskdata.tasks[index]);
                  },
                );
              },
              itemCount: taskdata.tasks.length,
            );
          },
        ),
      ),
    );
  }
}
