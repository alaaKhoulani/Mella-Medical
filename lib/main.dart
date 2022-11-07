import 'package:flutter/material.dart';
import 'package:medical/Myprovider.dart';
import 'package:medical/Screens/Input/Login.dart';
import 'package:medical/Screens/Main_Screen.dart';
import 'package:medical/Screens/ShowDoctors.dart';
import 'package:medical/Screens/Input/SignUp.dart';
import 'package:provider/provider.dart';
import 'Screens/DoctorInfo.dart';
import 'Screens/Input/UserInfoInput.dart';
import 'Screens/Input/firstScreen.dart';
import 'Screens/Medicine.dart';
import 'Screens/Schedule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  //Color _color =Color(0xff27debf);
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (_) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          //iconTheme: IconThemeData(color: Colors.black),
          scaffoldBackgroundColor: Colors.grey.shade200,
          buttonTheme: ButtonThemeData(
            height: 75.0,
            minWidth: 150.0,
           // buttonColor: Color(0xff27debf),
          ),
         // primarySwatch: Colors.teal,
        ),
        routes: {
          '/': (context) => FirstScreen(),
          '/SignUP': (context) => SignUp(),
          '/userInfo': (context) => UserInfoInpute(),
          '/login': (context) => Login(),
          '/showDoctors': (context) => ShowDoctors(),
          '/main' : (context)=> Main_Screen(),
          '/DoctorInfo':(context)=>DoctorInfo(),
          'ScheduleScreen':(context)=>ScheduleScreen(),
          'Medicine' : (context)=>Medicine()
        },

        // home:  FirstScreen(),
      ),
    );
  }
}
