import 'package:flutter/material.dart';
import 'package:medical/Widgets/NumberField.dart';

class MyInputCard extends StatelessWidget {
  @required
  final String _lable;
  @required
  @required Widget child;
  MyInputCard(this._lable,this.child);

  @override
  Widget build(BuildContext context) {
    var s;
  //  double value = _defaultvalue;
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Color(0xffE0F2F1),
        border: Border.all(color: Colors.grey,width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _lable.toString(),
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              this.child,
            ],
          ),
        ],
      ),
    );
  }
}
