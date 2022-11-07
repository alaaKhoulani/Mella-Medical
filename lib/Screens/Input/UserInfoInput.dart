import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/Myprovider.dart';
import 'package:medical/Screens/test.dart';
import 'package:medical/Widgets/MyButton.dart';
import 'package:medical/Widgets/MyRadio.dart';
import 'package:medical/Widgets/NumberField.dart';
import 'package:medical/Widgets/MyInputCard.dart';
import 'package:medical/data/Colors.dart';
import 'package:provider/provider.dart';

class UserInfoInpute extends StatefulWidget {
  @override
  State<UserInfoInpute> createState() => _UserInfoInputeState();
}

class _UserInfoInputeState extends State<UserInfoInpute> {
  String gender = "";
  @override
  Widget build(BuildContext context) {
    String blood = "...";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: BackButton(color: Colors.black),
        title: Text(
          "About You",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                child: Text(
                  "Please enter your Information ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w100,
                      fontFamily: "Inconsolata",
                      fontSize: 20),
                ),
              ),
              MyInputCard("Your Age : ", NumberField(1, 120, "age")),
              MyInputCard("Your Heigh : ", NumberField(120, 220, "height")),
              MyInputCard("Your weight : ", NumberField(2, 300, "weight")),
              //Test(),
              MyInputCard("your blood group : ", MyRadio(blood)),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Color(0xffE0F2F1),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: "male",
                            groupValue: gender,
                            onChanged: (x) {
                              setState(() {
                                gender = x.toString();
                                Provider.of<MyProvider>(context, listen: false)
                                    .setGender(x.toString());
                              });
                            }),
                        Text("male"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "female",
                            groupValue: gender,
                            onChanged: (x) {
                              setState(() {
                                gender = x.toString();
                                Provider.of<MyProvider>(context, listen: false)
                                    .setGender(x.toString());
                              });
                            }),
                        Text("female"),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    label: "Done",
                    color: Colors.teal, //Color(0xff27debf) ,
                    colorfont: Color(0xFFDFE1DE),
                    heigh: 45,
                    width: 200,
                    onPreesed: (){
                      Navigator.pushNamed(context, '/main');
                    },
                  ),
                  TextButton(
                    onPressed: () {

                      Navigator.pushNamed(context, "/main");
                    },
                    child: Text("Skip",style: TextStyle(color: PrimaryTeal),),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 20),
                child: Text(
                  "If you don't know something , it's don't matter",
                  textAlign: TextAlign.center,
                  style: knote
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}