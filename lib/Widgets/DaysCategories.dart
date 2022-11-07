import 'package:flutter/material.dart';
import 'package:medical/data/Colors.dart';
import '../Myprovider.dart';
import 'package:provider/provider.dart';
import '../data/Catdata.dart';

class DaysCategories extends StatefulWidget {

  @override
  State<DaysCategories> createState() => _DaysCategoriesState();
}

class _DaysCategoriesState extends State<DaysCategories> {
  int selectedIndex = 0;
  PageController ?_pageController;
  @override
  void initState() {
    // TODO: implement initState
    _pageController=new PageController(
      initialPage: 1,
      viewportFraction: 0.25
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: PageView.builder(
          controller:_pageController,
          itemCount: CategoryName.length,
          itemBuilder: (context, index) {
          return DayItem(index: index);
        }));
  }
}

class DayItem extends StatelessWidget {
  const DayItem({
    required this.index,
  }) ;

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<MyProvider>(context, listen: false).setSelectedDay(index);
      },
      child: Container(
        width: 50,
        alignment: Alignment.center,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Provider.of<MyProvider>(context).SelectedDay == index
                ? Colors.grey.withOpacity(0.4)
                : Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child:RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  color:  Provider.of<MyProvider>(context).SelectedDay == index
                ? primaryPurble
                : Colors.black45,
                ),
                children: [
                  TextSpan(
                    text: "${Days[index][0]}\n",
                  ),
                  TextSpan(text: Days[index][1]),
                ],
              )),
        
      ),
    );
  }
}

/*
 Text(
          CategoryName[index],
          style: TextStyle(
              fontWeight:
                  Provider.of<MyProvider>(context).SelectedCategoty == index
                      ? FontWeight.bold
                      : FontWeight.normal,
              color: Provider.of<MyProvider>(context).SelectedCategoty == index
                  ? Colors.teal
                  : Colors.grey),
        ),
*/