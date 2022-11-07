import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/Myprovider.dart';
import 'package:medical/Widgets/InputForm.dart';
import 'package:medical/Widgets/MyButton.dart';
import 'package:medical/data/Colors.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController phonController = TextEditingController();
  TextEditingController passCntroller = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          leading: BackButton(color: Colors.black),
          title: Text(
            "Sign Up",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/welcome.png",
                ),
                InputForm(
                  nameController,
                  preficon: Icon(Icons.person),
                  lable: "your name",
                  isFilled: true,
                  isHidden: false,
                  mainColor: PrimaryTeal,
                ),
                InputForm(
                  phonController,
                  preficon: Icon(Icons.phone_enabled),
                  lable: "your Phon",
                  isFilled: true,
                  isHidden: false,
                  mainColor: PrimaryTeal,
                ),
                InputForm(
                  passCntroller,
                  preficon: Icon(Icons.password),
                  lable: "password",
                  isFilled: true,
                  isHidden: true,
                  mainColor: PrimaryTeal,
                ),
                InputForm(
                  confirmController,
                  preficon: Icon(Icons.password),
                  lable: "Confirm password",
                  isFilled: true,
                  isHidden: true,
                  mainColor: PrimaryTeal,
                ),
                MyButton(
                  label: "Rejester",
                  color: Colors.teal, //Color(0xff27debf) ,
                  colorfont: Color(0xFFDFE1DE),
                  heigh: 45,
                  width: 340,
                  onPreesed: () {
                    if (prov.setUser(nameController.text, phonController.text,
                        passCntroller.text, confirmController.text)) {
                      Navigator.pushNamed(context, "/userInfo");
                    } else
                      showToast(context, "Please Enter all faild!! ");
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
