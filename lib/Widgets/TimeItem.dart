import 'package:flutter/material.dart';
import 'package:medical/data/Colors.dart';
import 'package:provider/provider.dart';

import '../Myprovider.dart';


class TimeItem extends StatelessWidget {
  final int index;
  const TimeItem({required this.index});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Container(
        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
        width: 150,
        height: 60,
        alignment: Alignment.center,
        padding:index < prov.ListOfTime.length - 1 ? EdgeInsets.fromLTRB(20, 0, 20, 0) :  EdgeInsets.fromLTRB(20, 0, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          border: Border.all(color: primaryPurble),
        ),
        child: index < prov.ListOfTime.length - 1
            ? Text(
                "${prov.ListOfTime[index].hour}:${prov.ListOfTime[index].minute}",
                textAlign: TextAlign.center,
                )
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(                    
                      "${prov.ListOfTime[index].hour}:${prov.ListOfTime[index].minute}"),
                  Spacer(),
                  Container(
                    height: 60,
                    width: 90,
                    decoration: BoxDecoration(
                        color: primaryPurble,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: TextButton(
                      onPressed: () {
                        prov.selectTime(context);
                      },
                      child: Text(
                        "Add More",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
    );
    ;
  }
}