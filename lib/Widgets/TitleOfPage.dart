import 'package:flutter/material.dart';

class TitleOfPage extends StatelessWidget {
  final String title;
  final double length;
  const TitleOfPage({required this.title, required this.length});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Stack(
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 30,
                  color: Colors.black
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -6,
            child: Divider(
              color: Colors.black12,
              thickness: 4,
            ),
          ),
        ],
      ),
    );
  }
}
