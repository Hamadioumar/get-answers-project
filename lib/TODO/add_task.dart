//import 'dart:html';
//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mytasks/TODO/task_data.dart';
import '../Pages/Constants.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return SafeArea(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: secondColor),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: secondColor,
                  // padding: const EdgeInsets.all(100.0),
                  // primary: Colors.white,
                  // textStyle: const TextStyle(fontSize: 20),
                ),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //color: secondColor,
                onPressed: () {
                  // something does there
                  Provider.of<DataTask>(context).addTask(newTaskTitle);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
