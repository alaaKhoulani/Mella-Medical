import 'package:flutter/material.dart';
import 'package:medical/Widgets/InputForm.dart';
import 'package:medical/Widgets/MyButton.dart';
import 'package:medical/data/Colors.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          leading: BackButton(color: Colors.black),
          title: Text(
            "logIn",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "images/login.png",
                ),
                SizedBox(
                  height: 50,
                ),
                InputForm(
                  phoneController,
                  preficon: Icon(Icons.phone_enabled),
                  lable: "your Phon",
                  isFilled: true,
                  isHidden: false,
                  mainColor: PrimaryTeal,
                ),
                InputForm(
                  passController,
                  preficon: Icon(Icons.password),
                  lable: "password",
                  isFilled: true,
                  isHidden: true,
                  mainColor: PrimaryTeal,
                ),
                MyButton(
                  label: "Log In",
                  color: Colors.teal, //Color(0xff27debf) ,
                  colorfont: Color(0xFFDFE1DE),
                  heigh: 45,
                  width: 340,
                  onPreesed: () {
                    Navigator.pushNamed(context, "/main");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
