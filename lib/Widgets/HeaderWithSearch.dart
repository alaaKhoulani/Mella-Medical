import 'package:flutter/material.dart';

class HeaderWithSearch extends StatefulWidget {
  const HeaderWithSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderWithSearch> createState() => _HeaderWithSearchState();
}

class _HeaderWithSearchState extends State<HeaderWithSearch> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 275,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.values[2],
            children: [
              RichText(
                  text: TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                children: [
                  TextSpan(
                    text: "mela",
                    style: TextStyle(fontSize: 40),
                  ),
                  TextSpan(text: "medical"),
                ],
              ))
            ],
          ),
        ),
        //----------------------------Search Input--------------------------
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                height: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          blurRadius: 50,
                          offset: Offset(0, 10)),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                            autofocus: false,
                            
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.teal,
                        )),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
