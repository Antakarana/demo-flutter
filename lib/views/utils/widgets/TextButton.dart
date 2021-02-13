import 'package:flutter/material.dart';

class BtnWithText extends StatelessWidget {
  final String text;
  final function;
  final Color floorColor;

  const BtnWithText({this.text, this.function, this.floorColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: (MediaQuery.of(context).size.width),
        padding: const EdgeInsets.all(8.0),
        height: 100.0,
        decoration: BoxDecoration(
          color: floorColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.red,
              fontWeight: FontWeight.normal,
            ),
          ),
          onPressed: function,
        ),
      ),
    );
  }
}
