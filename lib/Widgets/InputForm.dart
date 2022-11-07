import 'package:flutter/material.dart';
import 'package:medical/data/Colors.dart';

class InputForm extends StatelessWidget {
  final String lable;
  final Icon preficon;
  final bool isFilled;
  final bool isHidden;
  final Color mainColor;
   TextEditingController controller;
  InputForm(
    this.controller,
      {
    required this.preficon,
    required this.lable,
    required this.isFilled,
    required this.isHidden,
    required this.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      //width: 300,
      margin: EdgeInsets.fromLTRB(25, 5, 25, 5),
      child: TextFormField(
        controller: controller,
        obscureText: isHidden,
        decoration: InputDecoration(
          label: Text(
            "$lable",
            style: TextStyle(
              fontFamily: 'Inconsolata',
            ),
          ),
          contentPadding: EdgeInsets.all(30.0),
          prefixIcon: preficon,
          filled: isFilled,
          fillColor: Colors.white10,
          focusColor: mainColor,
          floatingLabelStyle: TextStyle(color: mainColor),
          prefixIconColor: mainColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: mainColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: primaryPurble),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      ),
    );
  }
}
