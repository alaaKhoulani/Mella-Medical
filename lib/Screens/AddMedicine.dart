import 'package:flutter/material.dart';
import 'package:medical/Myprovider.dart';
import 'package:medical/Widgets/Header.dart';
import 'package:medical/Widgets/InputForm.dart';
import 'package:medical/Widgets/MyButton.dart';
import 'package:medical/Widgets/TimeItem.dart';
import 'package:medical/Widgets/TitleOfPage.dart';
import 'package:medical/data/Colors.dart';
import 'package:medical/data/modelsData.dart';
import 'package:provider/provider.dart';
// import 'package:time_picker_widget/time_picker_widget.dart';



class AddMedicine extends StatelessWidget {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController nameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Header(primaryPurble),
            TitleOfPage(title: "Add Medicine", length: 200),
            Container(
                margin: EdgeInsets.all(0),
                height: 125,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        prov.setMedicinId(2);
                      },
                      child: MedicineModel(
                        image: Image.asset("images/tablet.png"),
                        id: 2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        prov.setMedicinId(1);
                      },
                      child: MedicineModel(
                        image: Image.asset("images/pills.png"),
                        id: 1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        prov.setMedicinId(3);
                      },
                      child: MedicineModel(
                        image: Image.asset("images/syringe.png"),
                        id: 3,
                      ),
                    ),
                  ],
                )),
            
            InputForm(
              nameController,
              preficon: Icon(
                Icons.sort_by_alpha,
                color: primaryPurble,
              ),
              lable: "Medicin Name",
              isFilled: true,
              isHidden: false,
              mainColor: primaryPurble,
            ),
            InputForm(
              noteController,
              preficon: Icon(
                Icons.note_add,
                color: primaryPurble,
              ),
              lable: "Notes",
              isFilled: true,
              isHidden: false,
              mainColor: primaryPurble,
            ),
            prov.ListOfTime.length == 0
                ? Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
                    width: 170,
                    height: 60,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(color: primaryPurble),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Add Time"),
                        Spacer(),
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                              color: primaryPurble,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: TextButton(
                            onPressed: () {
                              prov.selectTime(context);
                            },
                            child: Text(
                              "Add More",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 0,
                            childAspectRatio: width / (height / 6)),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: prov.ListOfTime.length,
                        itemBuilder: (context, index) {
                          return TimeItem(index: index);
                        })
                ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                bool ok = prov.addMedicine(
                    nameController.value.text, noteController.value.text);
                if (ok) {
                  nameController.clear();
                  noteController.clear();
                  prov.SelectedMedicinID = -1;
                  print("hiiiiiiiii");
                  print(prov.ListOfMedicine[0].listTime);
                  prov.curentScreen = 1;
                }
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                width: 150,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryPurble,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(color: primaryPurble),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class MedicineModel extends StatelessWidget {
  final Image image;
  final int id;
  const MedicineModel({
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: prov.SelectedMedicinID == id
              ? primaryPurble.withOpacity(0.2)
              : null,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all(
              color: prov.SelectedMedicinID == id ? primaryPurble : back)),
      child: image,
    );
  }
}
