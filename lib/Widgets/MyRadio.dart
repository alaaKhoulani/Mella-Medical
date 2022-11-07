import 'package:flutter/material.dart';
import 'package:medical/Myprovider.dart';
import 'package:provider/provider.dart';

class MyRadio extends StatefulWidget {
  late final String blood;
  MyRadio(this.blood);

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: (x) {
          setState(() {
            Provider.of<MyProvider>(context,listen: false).blood = x.toString();
          });
        },
        child: Container(
           padding: EdgeInsets.fromLTRB(30.0, 15, 30, 15),
          width: 100,
          height: 50,
          child: Text("${Provider.of<MyProvider>(context,listen: false).blood}"),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey[200], //Color(0xFFDCDFE4),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.teal, width: 2)),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              //onTap: () {},
              child: Text("A+"),
              value: "A+",
            ),
            PopupMenuItem(
              //onTap: () {},
              child: Text("A-"),
              value: "A-",
            ),
            PopupMenuItem(
              //onTap: () {},
              child: Text("B+"),
              value: "B+",
            ),
            PopupMenuItem(
              //onTap: () {},
              child: Text("B"),
              value: "B-",
            ),
            PopupMenuItem(
              //onTap: () {},
              child: Text("O+"),
              value: "O+",
            ),
            PopupMenuItem(
              //onTap: () {},
              child: Text("O-"),
              value: "O-",
            ),
            PopupMenuItem(
              //onTap: () {},
              child: Text("AB+"),
              value: "AB+",
            ),
            PopupMenuItem(
              //onTap: () {},
              child: Text("AB-"),
              value: "AB-",
            ),
          ];
        });
  }
}
/*
PopupMenuItem(
                  child:RadioListTile(value: "10", groupValue: tt, onChanged: (x){
                    setState(() {
                      tt=x as int?;
                    });
                  }) ,
              ),
              PopupMenuItem(
                child: RadioListTile(
                    title: Text("A+"),
                    value: "A+",
                    activeColor: Colors.teal,
                    groupValue: s,
                    onChanged: (x) {
                      setState(() {
                        s=x.toString();
                        //widget.blood=x.toString();
                      });
                      print (x.toString());
                    }
                ),
              ),
              PopupMenuItem(
                child: RadioListTile(
                    title: Text("A-"),
                  value: "A-",
                  groupValue:s,
                  onChanged: (x) {
                    setState(() {
                      s=x.toString();
                      //widget.blood=x.toString();
                    });
                  }
                ),
              ),
              PopupMenuItem(
                child: RadioListTile(
                    value: "B+",
                    title: Text("B+"),
                    groupValue: s,
                    onChanged: (x) {
                      setState(() {
                        s=x.toString();
                        //widget.blood=x.toString();
                      });
                    }
                  ),
              ),
              PopupMenuItem(
                child: RadioListTile(
                value: "B-",
                    title: Text("B-"),
                groupValue: s,
                onChanged: (x) {
                  setState(() {
                    s=x.toString();
                    //widget.blood=x.toString();
                  });
                }),
              ),
              PopupMenuItem(
                child: RadioListTile(
                value: "O+",
                    title: Text("O+"),
                groupValue: s,
                onChanged: (x) {
                  setState(() {
                    s=x.toString();
                    //widget.blood=x.toString();
                  });
                }),
              ),
              PopupMenuItem(
                child: RadioListTile(
                value: "O-",
                    title: Text("O-"),
                groupValue: s,
                onChanged: (x) {
                  setState(() {
                    s=x.toString();
                    //widget.blood=x.toString();
                  });
                }),
              ),
              PopupMenuItem(
                child: RadioListTile(
                value: "AB+",
                    title: Text("AB+"),
                groupValue:s,
                onChanged: (x) {
                  setState(() {
                    s=x.toString();
                    //widget.blood=x.toString();
                  });
                }),
                ),
              PopupMenuItem(
                child: RadioListTile(
                value: "AB-",
                    title: Text("AB-"),
                groupValue:s ,
                onChanged: (x) {
                  setState(() {
                    s=x.toString();
                    //widget.blood=x.toString();
                  });
                }),
              ),
            ];
            },
),
*/