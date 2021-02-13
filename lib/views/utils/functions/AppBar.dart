import 'package:flutter/material.dart';

AppBar getAppBar(String text) {
  return AppBar(
    backgroundColor: Colors.lightBlue[400],
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    title: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
  );
}
