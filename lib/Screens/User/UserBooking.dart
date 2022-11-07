import 'package:flutter/material.dart';
import 'package:medical/Widgets/Header.dart';
import 'package:medical/Widgets/TitleOfPage.dart';
import 'package:medical/data/Colors.dart';

class MyBooking extends StatelessWidget {
  final String title = "My booking";
  bool isAppBar() => true;

  @override
  Widget build(BuildContext context) {
    return  Container(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(PrimaryBlue),
          TitleOfPage(title: "My Schedule", length: 210),
          Expanded(
             child: Container(
               margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
               child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 5,
                  childAspectRatio: 6
                ),
                children: [
                  BookingContainer(),
                  BookingContainer(),
                  BookingContainer(),
                  BookingContainer(),
                  BookingContainer(),
                  
                ],
             ),
             ),
           )
       
        ],
      ),
    );
  }
}

class BookingContainer extends StatelessWidget {
  const BookingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text("12:00"),
        //Spacer(),
        SizedBox(width: 30,),
        Expanded(
          child: Container(
            height: 150,
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20)
              ),
              color:PrimaryBlue.withOpacity(0.5)
            ),
            child: Row(  
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Doctor : Alaa Khoulani"),
              Spacer(),
              Container(
                decoration:BoxDecoration(
                  color: back,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20)
                  ),
                ) ,
                child: Icon(Icons.check,color:PrimaryBlue,size: 30,))
            ],
          ),
          ),
        ),
      ],
    );
  }
}
