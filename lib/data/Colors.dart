import 'package:flutter/material.dart';

Color back = Colors.grey.shade200;
Color primaryPurble = Colors.deepPurple;
Color PrimaryTeal = Colors.teal;
Color PrimarySelectedBackground = Colors.grey.withOpacity(0.4);
Color PrimaryUnselectedbackground = Colors.grey.shade200;
Color PrimaryBlue = Color(0xff196FE1);
Color One = Colors.deepPurple;
Color Two = Colors.lightBlue;
Color Three = Colors.yellow;
Color Four = Colors.deepOrange;
List Colour = [One, Two, Three, Four];
Color getColor(int i, int mod) {
  int x = i % mod;
  if (x == mod - 1) return PrimaryTeal;
  return Colour[x];
}

TextStyle kTitle = TextStyle(
    fontSize: 25,
    //fontWeight: FontWeight.w400,
    fontFamily: "Inconsolata");
TextStyle knumber = TextStyle(
    fontSize: 25,
    //fontWeight: FontWeight.w400,
    fontFamily: "Number");

TextStyle knote = TextStyle(
  overflow: TextOverflow.clip,
  fontSize: 17,
  color: Colors.grey,
  fontFamily: 'Inconsolata',
);

showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
          label: 'Undo', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
