import 'package:flutter/material.dart';
import 'package:medical/Myprovider.dart';
import 'package:medical/Widgets/TitleOfPage.dart';
import 'package:medical/data/Colors.dart';
import 'package:medical/data/modelsData.dart';
import 'package:provider/provider.dart';
import '../data/Catdata.dart';
import '../Widgets/HeaderWithSearch.dart';
import '../Widgets/CategoriesRow.dart';

class ShowDoctors extends StatefulWidget {
  //final bool isAppBar = false;
  bool isAppBar() => false;

  @override
  _ShowDoctorsState createState() => _ShowDoctorsState();
}

class _ShowDoctorsState extends State<ShowDoctors> {
  int c = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearch(),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                TitleOfPage(
                  title: "Doctor",
                  length: 100,
                ),
              ],
            ),
          ),
          CategoriesRow(),
          DoctorRow(),
          SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}

class DoctorRow extends StatefulWidget {
  @override
  State<DoctorRow> createState() => _DoctorRowState();
}

class _DoctorRowState extends State<DoctorRow> {
  PageController? _pageController;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = new PageController(initialPage: 1, viewportFraction: 0.5);
  }

  int len(String sr, BuildContext context) {
    int cnt = 0;
    var prov = Provider.of<MyProvider>(context);
    prov.AllDoctors['key']!.forEach((element) {
      Doctor doctor = Doctor.fromJson(element);
      if (doctor.sr == sr) {
        cnt++;
        prov.CurrentDoctors.add(doctor);
      }
    });
    return cnt;
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.only(top: 5),
      height: 300,
      child: PageView.builder(
          controller: _pageController,
          itemCount: len(CategoryName[prov.SelectedCategoty], context),
          itemBuilder: (context, index) {
            return DoctorItem(
              doctor: prov.CurrentDoctors[index],
              index: index,
            );
          }),
    );
  }
}

class DoctorItem extends StatelessWidget {
  final Doctor doctor;
  final int index;
  DoctorItem({required this.doctor, required this.index});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return GestureDetector(
      onTap: () {
        prov.selectedDoctor = doctor;
        Navigator.of(context).pushNamed('/DoctorInfo');
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  color: getColor(index, 3),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
              ),
              SizedBox(
                height: 190,
                child: Image(
                  image: AssetImage("images/${doctor.id}.png"),
                  height: 300,
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
            height: 50,
            width: 170,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white)
                ]),
            child: Text(
              doctor.name,
            ),
          ),
        ],
      ),
    );
  }
}
