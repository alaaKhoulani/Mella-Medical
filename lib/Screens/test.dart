import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String _test = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadioListTile(
        title: Text("alaa"),
          value: "alaa",
          groupValue: _test,
          onChanged: (x) {
            setState(() {
              _test = x.toString();
            });
          }),
    );
  }
}
