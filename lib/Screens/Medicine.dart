import 'package:flutter/material.dart';
import 'package:medical/Myprovider.dart';
import 'package:medical/Widgets/DaysCategories.dart';
import 'package:medical/Widgets/Header.dart';
import 'package:medical/Widgets/HeaderWithSearch.dart';
import 'package:medical/Widgets/MyButton.dart';
import 'package:medical/Widgets/TitleOfPage.dart';
import 'package:medical/data/Colors.dart';
import 'package:provider/provider.dart';

class Medicine extends StatelessWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Header(primaryPurble),

            //SizedBox(height: 50,),
            TitleOfPage(title: "medicine", length: 150),
            //DaysCategories(),
            prov.ListOfMedicine.length > 0 ?
            ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: prov.ListOfMedicine.length,
                itemBuilder: (context, index) {
                  return MedicineItem(index);
                }): Column(children: [
                  SizedBox(height: 50,),
                  Image.asset("images/error.png"),])
          ],
        ),
      ),
    );
  }
}

class MedicineItem extends StatelessWidget {
  final int index;
  const MedicineItem(this.index);
  getImage(int i) {
    if (i == 1)
      return "pills";
    else if (i == 2)
      return "tablet";
    else if (i == 3) return "Syringe";
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete),
      ),
      direction: DismissDirection.endToStart ,
      onDismissed: (direction) {
        prov.remove(index);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('deleted done!!')));
      },
      child: ListTile(
        leading: Container(
          //height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            border: Border.all(width: 2, color: Colors.grey),
          ),
          child: Image.asset(
            "images/${getImage(prov.ListOfMedicine[index].id)}.png",
            height: 100,
            width: 75,
          ),
        ),
        title: Text("${prov.ListOfMedicine[index].name}" , style: TextStyle(fontSize: 20),),
        subtitle: Text("${prov.ListOfMedicine[index].note}"),
        trailing: Text(
            "${prov.ListOfMedicine[index].listTime[0].hour}:${prov.ListOfMedicine[index].listTime[0].minute}",
            style: TextStyle(fontSize: 25),
            ),
      ),
    );
  }
}
