import 'package:flutter/material.dart';
import 'package:medical/Screens/Input/SignUp.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final Color colorfont;
  final double width, heigh;
  final String label;
  final VoidCallback onPreesed;
  //final VoidCallback function;
  MyButton(
      {required this.label,
      required this.color,
      required this.heigh,
      required this.width,
      required this.colorfont,
      required this.onPreesed});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:()=> onPreesed.call() , //_function;
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        height: heigh,
        width: width,
        child: Center(
            child: Text(
          label,
          style: TextStyle(color: colorfont, fontSize: 20),
        )),
      ),
    );
  }
}
