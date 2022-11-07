import 'package:flutter/material.dart';
import 'package:medical/Myprovider.dart';
import 'package:provider/provider.dart';

class NumberField extends StatelessWidget {
  @required
  final double _minn;
  @required
  final double _maxx;
  @required
  final String _kind;
  NumberField(this._minn, this._maxx, this._kind);
  double inc(double x) {
    return x + 1.0 > _maxx ? x : x + 1.0;
  }

  double dec(double x) {
    return x - 1.0 < _minn ? x : x - 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(5),
            ),
            //padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onLongPress: () =>
                    Provider.of<MyProvider>(context, listen: false)
                        .increas(_kind, _maxx),
                onDoubleTap: () =>
                    Provider.of<MyProvider>(context, listen: false)
                        .increas(_kind, _maxx),
                onTap: () {
                  Provider.of<MyProvider>(context, listen: false)
                      .decrease(_kind, _minn);
                },
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                )),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30.0, 15, 30, 15),
            width: 130,
            height: 50,
            child:
                Text("${Provider.of<MyProvider>(context).inputNumber[_kind]}"),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[200], //Color(0xFFDCDFE4),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 2)),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(5),
            ),
            //padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onLongPress: () =>
                    Provider.of<MyProvider>(context, listen: false)
                        .increas(_kind, _maxx),
                onDoubleTap: () =>
                    Provider.of<MyProvider>(context, listen: false)
                        .increas(_kind, _maxx),
                onTap: () {
                  Provider.of<MyProvider>(context, listen: false)
                      .increas(_kind, _maxx);
                },
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
