import 'package:flutter/material.dart';

TextButton buildTextButton({String text, Function function}) {
  return TextButton(
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.red,
        fontWeight: FontWeight.normal,
      ),
    ),
    onPressed: function,
  );
}
