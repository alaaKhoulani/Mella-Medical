import 'package:flutter/material.dart';
import 'package:medical/Widgets/DaysCategories.dart';
import 'package:medical/data/Colors.dart';
import 'package:provider/provider.dart';

import '../Myprovider.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({
    Key? key,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
     var prov = Provider.of<MyProvider>(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        builder: (_, controller) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: "22/2/2022\n",
                                      //  style: TextStyle(fontSize: 40),
                                    ),
                                    TextSpan(
                                      text: "Schedule",
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //Spacer(),
                          CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            backgroundImage: AssetImage("images/${prov.selectedDoctor.id}.png"),
                            radius: 40,
                            //child: Image.asset("images/12.png",width: 200,)
                          )
                        ],
                      ),
                    ),
                    DaysCategories(),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
                      child: Text(
                        "List Of Schedule",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            fontFamily: "Inconsolata"),
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(8),
                              height: 70,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Container(
                                      width: 50,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "12:00",
                                        textAlign: TextAlign.center,
                                      )),
                                  Spacer(),
                                  Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: getColor(index,5).withOpacity(0.2),
                                    ),
                                    width: 270,
                                    child: Row(
                                      children: [
                                        Container(
                                            width: 200,
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Consulatations",
                                              textAlign: TextAlign.start,
                                            )),
                                        TextButton(
                                          onPressed: () {},
                                          style: ButtonStyle(),
                                          child: Icon(
                                            Icons.add,
                                            color: getColor(index,5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
