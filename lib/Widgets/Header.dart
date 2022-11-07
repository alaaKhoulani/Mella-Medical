import 'package:flutter/material.dart';
import 'package:medical/data/Colors.dart';

class Header extends StatelessWidget {
  final Color _color;
  const Header( this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color:_color,
          boxShadow: [
            BoxShadow(
                color: Colors.black87.withOpacity(0.3),
                blurRadius: 50,
                offset: Offset(0, 10)),
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.values[2],
        children: [
          RichText(
              text: TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            children: [
              TextSpan(
                text: "mela",
                style: TextStyle(fontSize: 40),
              ),
              TextSpan(text: "medical"),
              
            ],
          ))
        ],
      ),
    );
  }
}
