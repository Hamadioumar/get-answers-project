import '../Pages/Constants.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'add_task.dart';
import 'list_Task.dart';

class MyHomePage extends StatelessWidget {
  static const String id = 'Home_screen';
  Widget buildButtomSheet(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
          backgroundColor: secondColor,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                        child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTask(),
                    )));
          }),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                          //margin: EdgeInsets.only(top: 13.0),
                          child: SizedBox(
                        width: 300.0,
                        child: TextLiquidFill(
                          text: 'MY TASKS',
                          waveColor: Colors.white,
                          boxBackgroundColor: primaryColor,
                          textStyle: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                          boxHeight: 107.0,
                          boxWidth: 200,
                        ),
                      )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, top: 30.0),
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText('Discipline is the best tool'),
                              WavyAnimatedText(
                                  'It is not enough to do your best'),
                              WavyAnimatedText('you must know what to do,'),
                              WavyAnimatedText('and then do your best')
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(color: primaryColor),
              ),
            ),
            Flexible(
              flex: 7,
              child: ClipPath(
                clipper: clipPathClass(),
                child: ListTasks(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class clipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.height - 50,
    ));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TaskState extends StatefulWidget {
  bool isChecked;
  String taskTitle;
  Function CheckBoxCallBack;
  Function forDelete;
  TaskState(
      {this.isChecked, this.taskTitle, this.forDelete, this.CheckBoxCallBack});

  @override
  State<TaskState> createState() => _TaskStateState();
}

class _TaskStateState extends State<TaskState> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        widget.forDelete();
      },
      trailing: Checkbox(
        activeColor: Colors.blueAccent,
        value: widget.isChecked,
        onChanged: (newValue) {
          widget.CheckBoxCallBack(newValue);
        },
      ),
      title: Text(
        widget.taskTitle,
        style: TextStyle(
            decoration: widget.isChecked ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
