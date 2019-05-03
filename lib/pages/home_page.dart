import 'dart:io';
import 'package:amid_app/pages/media_page.dart';
import 'package:amid_app/pages/newsfeed_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomePage extends StatefulWidget{
  Map userData;
  HomePage({this.userData});
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}
class HomePageState extends State<HomePage>{
  int currentIndex = 1;
  Future<bool> _onWilllPop(){
      return showDialog(
        context: context,
        builder: (context){
          return Directionality(
            child: AlertDialog(
            title: Text('آیا مطمین هستید؟'),
            content: Text('با انتخاب بله خارج میشوید'),
            actions: <Widget>[
              FlatButton(
                child: Text('بله'),
                onPressed: () {
                  exit(0);
                },),
              FlatButton(
                child: Text('خیر'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },)  
            ],
          ),
            textDirection:TextDirection.rtl
            );
        },
        ) ?? false;
  }
  @override
  _introducton()async{
   SharedPreferences check = await SharedPreferences.getInstance(); 
   check.setInt('newFeed', 1);
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return _onWilllPop();
      },
      child:Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: currentIndex == 0 ? NewsFeed(user:widget.userData) : MediaPage(userData :widget.userData),
      bottomSheet: Container(
        height: 60,
        width: screen.width,
        child:Container(
        decoration: new BoxDecoration(
          gradient: new  LinearGradient(
              colors: <Color>[
                const Color(0xff2980b9),
                const Color(0xff2980b9)                                ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
        ),
          child: new Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              new Opacity(
                opacity: .1,
                child: new Container(
                width:MediaQuery.of(context).size.width-40,
                height: (MediaQuery.of(context).size.height - 160) / 4,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("assets/images/icon-background.png"),
                          repeat: ImageRepeat.repeat
                      )
                  ),
                ),
              ),
                  Row(
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
                          _introducton();
                        },
                      )
                    ],
                  ),

                              ])
                   )        
      )
    ),
    );
  }

}