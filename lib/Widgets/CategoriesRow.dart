import 'package:flutter/material.dart';
import 'package:medical/data/Colors.dart';
import '../Myprovider.dart';
import 'package:provider/provider.dart';
import '../data/Catdata.dart';

class CategoriesRow extends StatefulWidget {
  const CategoriesRow();

  @override
  State<CategoriesRow> createState() => _CategoriesRowState();
}

class _CategoriesRowState extends State<CategoriesRow> {
  int selectedIndex = 0;
  PageController? _pageController;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 1, viewportFraction: 0.4);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        child: PageView.builder(
            controller: _pageController,
            itemCount: CategoryName.length,
            itemBuilder: (context, index) {
              return CatItem(index: index);
            }));
  }
}

class CatItem extends StatelessWidget {
  const CatItem({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of < MyProvider > (context);
    return GestureDetector(
      onTap: () {
        Provider.of<MyProvider>(context, listen: false).setCategory(index);
       // print(prov.AllDoctors[1]![0]);
      },
      child: Container(
        alignment: Alignment.center,
        //width: 200,
        // height: 50,
        //padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Provider.of<MyProvider>(context).SelectedCategoty == index
                ? Colors.grey.withOpacity(0.4)
                : Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(
          CategoryName[index],
          style: TextStyle(
              fontWeight:
                  Provider.of<MyProvider>(context).SelectedCategoty == index
                      ? FontWeight.bold
                      : FontWeight.normal,
              color: Provider.of<MyProvider>(context).SelectedCategoty == index
                  ? PrimaryTeal
                  : Colors.grey),
        ),
      ),
    );
  }
}
