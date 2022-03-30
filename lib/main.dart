import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mytasks/Pages/navbar.dart';
import 'package:mytasks/Pages/q&a.dart';
import 'package:mytasks/TODO/task_data.dart';
import 'package:mytasks/logIn&signUp/loginPage.dart';
import 'package:mytasks/logIn&signUp/regsrPage.dart';
import 'package:mytasks/logIn&signUp/welcomePage.dart';
import 'package:provider/provider.dart';
import 'TODO/Home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GtAnswer());
}

class GtAnswer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataTask>(
      create: (_) => DataTask(),
      builder: (context, __) => (MaterialApp(
        title: 'MyTasks',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          AnswersScreen.id: (context) => AnswersScreen(),
          MyHomePage.id: (context) => MyHomePage(),
          Navigation.id: (context) => Navigation(),
        },
      )),
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(FlashChat());
// }
//
// class FlashChat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: WelcomeScreen.id,
//       routes: {
//         WelcomeScreen.id: (context) => WelcomeScreen(),
//         LoginScreen.id: (context) => LoginScreen(),
//         RegistrationScreen.id: (context) => RegistrationScreen(),
//         ChatScreen.id: (context) => ChatScreen(),
//       },
//     );
//   }
// }
