import 'package:flutter/material.dart';
import 'package:medical/Screens/Input/SignUp.dart';
import 'package:medical/Screens/test.dart';
import 'package:medical/Widgets/MyButton.dart';
import 'package:medical/data/Colors.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryTeal,
        centerTitle: true,
        title: Text(
          "Mela medical",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(
              height: 50,
            ),
            Image.asset("images/first.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  label: "Sign up",
                  color: Color(0xFFDFE1DE),
                  colorfont: Colors.black45,
                  heigh: 75,
                  width: 150,
                  onPreesed: (){
                    Navigator.pushNamed(context, "/SignUP");
                  },
                ),
                MyButton(
                  label: "Sign In",
                  color: Colors.teal,
                  colorfont: Color(0xFFDFE1DE), //Colors.white,
                  heigh: 75,
                  width: 150,
                  onPreesed: (){
                    Navigator.pushNamed(context, "/login");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
