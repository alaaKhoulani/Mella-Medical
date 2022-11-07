import 'package:flutter/material.dart';
import 'package:medical/Myprovider.dart';
import 'package:medical/Widgets/Header.dart';
import 'package:medical/Widgets/TitleOfPage.dart';
import 'package:medical/data/Colors.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  bool isAppBar() => true;
  String title = "Your Info";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(PrimaryBlue),
          TitleOfPage(title: "My Information", length: 210),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This data willbe default , if you dont entry them",style: knote.copyWith(fontSize: 15),textAlign: TextAlign.center,),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.5),
                children: [
                  InfoContainer(
                      label: "My Age:",
                      data:
                          Provider.of<MyProvider>(context).inputNumber["age"]),
                  InfoContainer(
                      label: "My Height:",
                      data: Provider.of<MyProvider>(context)
                          .inputNumber["height"]),
                  InfoContainer(
                      label: "My weight:",
                      data: Provider.of<MyProvider>(context)
                          .inputNumber["weight"]),
                  InfoContainer(
                      label: "My gender:",
                      data: Provider.of<MyProvider>(context).gender ==
                              "not detecte yet"
                          ? ""
                          : Provider.of<MyProvider>(context).gender),
                  
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  final String label;
  var data;
  InfoContainer({required this.label, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: PrimaryBlue.withOpacity(0.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${label}",
            style: kTitle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            data == null ? "0" : "$data",
            style: knumber.copyWith(color: PrimaryBlue),
          )
        ],
      ),
    );
  }
}
