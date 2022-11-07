import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medical/Myprovider.dart';
import 'package:medical/Screens/DoctorInfo.dart';
import 'package:medical/Screens/ShowDoctors.dart';
import 'package:medical/data/Colors.dart';
import 'package:medical/data/ScreensData.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:provider/provider.dart';

class Main_Screen extends StatefulWidget {
  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: DotNavigationBar(
          borderRadius: 0,
            marginR: EdgeInsets.fromLTRB(40, 0, 40, 20),
            margin: EdgeInsets.all(0),
            currentIndex:
                Provider.of<MyProvider>(context, listen: false).curentScreen,
            onTap: (x) {
              _selectedIndex =
                  Provider.of<MyProvider>(context, listen: false).setScreen(x);
            },
            items: [
              DotNavigationBarItem(
                  icon: Icon(Icons.add),
                  selectedColor: primaryPurble,
                  unselectedColor: Colors.grey),
              DotNavigationBarItem(
                  icon: Icon(Icons.medical_services),
                  selectedColor: primaryPurble,
                  unselectedColor: Colors.grey),
              DotNavigationBarItem(
                  icon: Icon(Icons.home_sharp),
                  selectedColor: Colors.teal,
                  unselectedColor: Colors.grey),
              DotNavigationBarItem(
                  icon: Icon(Icons.date_range),
                  selectedColor: PrimaryBlue,
                  unselectedColor: Colors.grey),
              DotNavigationBarItem(
                  icon: Icon(Icons.person),
                  selectedColor: PrimaryBlue,
                  unselectedColor: Colors.grey),
            ]),
        body: Screens[Provider.of<MyProvider>(context).curentScreen],
      ),
    );
  }
}
