import 'package:flutter/material.dart';
import 'package:medical/Screens/Schedule.dart';
import 'package:medical/Widgets/DaysCategories.dart';
import 'package:medical/Widgets/SquireWithOpacity.dart';
import 'package:medical/data/Colors.dart';
import 'package:provider/provider.dart';

import '../Myprovider.dart';

class DoctorInfo extends StatefulWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<MyProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 450,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                      ),
                      SquireWithOpacity(100, 90, 40, 0, 10, 0),
                      SquireWithOpacity(100, 90, 80, 0, 40, 0),
                      SquireWithOpacity(100, 90, 280, 0, 275, 0),
                      Image(
                        image: AssetImage("images/${prov.selectedDoctor.id}.png"),
                        height: 350,
                      ),
                    ],
                  ),
                  Column(
                    //scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                        width: double.infinity,
                        child: Text(
                          prov.selectedDoctor.name,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              fontFamily: "Inconsolata"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        width: double.infinity,
                        child: Text(
                          prov.selectedDoctor.sr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Inconsolata",
                              color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                        width: double.infinity,
                        child: Text(
                          "about",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: "Inconsolata"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        width: double.infinity,
                        child: Text(
                           prov.selectedDoctor.description,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "Inconsolata",
                              color: Colors.grey),
                              
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            child: MaterialButton(
              onPressed: () {
                showModalBottomSheet(
                  enableDrag: true,
                  isDismissible: true,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      )
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return ScheduleScreen();
                    }
                    );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: PrimaryBlue,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Text(
                  "Book appoinment",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, letterSpacing: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
