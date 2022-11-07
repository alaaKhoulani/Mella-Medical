import 'package:flutter/material.dart';

class SquireWithOpacity extends StatelessWidget {
 @required final double height;
  @required final double width;
  double botton = 0, top = 0, left = 0, right = 0;
  SquireWithOpacity(
      this.height, this.width, this.top, this.botton, this.left, this.right);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ));
  }
}
