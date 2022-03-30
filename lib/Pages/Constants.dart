import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff7E53E6);
const Color secondColor = Color(0xff9B5EEE);
const Color nub3Color = Color(0xffAE78EC);
const Color nub4Color = Color(0xffBE88EC);
const kSendButtonTextStyle = TextStyle(
  color: nub3Color,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: primaryColor, width: 2.0),
  ),
);
