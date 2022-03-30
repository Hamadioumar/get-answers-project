import 'package:flutter/material.dart';
import 'package:mytasks/Pages/navbar.dart';
import 'package:mytasks/logIn&signUp/authG.dart';
import 'package:firebase_core/firebase_core.dart';

class BtGoogle extends StatefulWidget {
  @override
  State<BtGoogle> createState() => _BtGoogleState();
}

class _BtGoogleState extends State<BtGoogle> {
  GooglAuth auth;
  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() {
      auth = GooglAuth();
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColorLight),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    side: BorderSide(color: Colors.blueAccent)),
              ),
            ),
            onPressed: () {
              auth.loginWithGoogle().then((value) {
                if (value == null) {
                  setState(() {
                    print('Google login Error');
                  });
                } else {
                  setState(() {
                    Navigator.pushNamed(context, Navigation.id);
                    print('User $value successfully logged in with google ');
                  });
                }
              });
            },
            child: Text(
              'Register with Google',
              style: TextStyle(
                fontSize: 18.0,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
