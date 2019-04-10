import 'package:amid_app/pages/media_page.dart';
import 'package:amid_app/pages/newsfeed_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: currentIndex == 0 ? NewsFeed() : MediaPage(),
      bottomSheet: Container(
        color: Color.fromRGBO(239, 57, 79, 1),
        height: 60,
        width: screen.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              child : Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                child: Text('عمیدآپ', style:TextStyle(fontFamily: 'IranSans',color: Colors.white,fontSize: currentIndex == 1 ? 14 : 10),),
              ),
              onTap: (){
                setState(() {
                   currentIndex = 1;                    
                });
              },
            ),
            InkWell(
              child : Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                child: Text('جدیدترین ها', style:TextStyle(fontFamily: 'IranSans',color: Colors.white,fontSize: currentIndex == 0 ? 14 : 10),),
              ),    
              onTap: (){
                setState(() {
                   currentIndex = 0;                    
                });
              },
            )
          ],
        ),
      )
    );
  }

}