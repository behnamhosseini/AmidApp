import 'package:flutter/material.dart';

class MyPanelPage extends StatefulWidget{
  Map user;
  MyPanelPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return MyPanelPageState();
  }

}

class MyPanelPageState extends State<MyPanelPage>{
  int currentIndex = 1;
  Map user;
  @override
  void initState() {
    super.initState();
    user=widget.user;
  }
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: currentIndex == 1 ? SendPostPage() : PanelPage(),
      bottomSheet: Container(
        color: Color.fromRGBO(239, 57, 79, 1),
        height: 60,
        width: screen.width,
        child:user['level'] == 'admin' 
        ?Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
             InkWell(
              child : Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                child: Text('ارسال پست', style:TextStyle(fontFamily: 'IranSans',color: Colors.white,fontSize: currentIndex == 1 ? 14 : 10),),
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
                child: Text('پنل کار', style:TextStyle(fontFamily: 'IranSans',color: Colors.white,fontSize: currentIndex == 0 ? 14 : 10),),
              ),    
              onTap: (){
                setState(() {
                   currentIndex = 0;                    
                });
              },
            )
          ],
        )
        :user['role'] == 'user'
         ?Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
               InkWell(
                child : Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                child: Text('پنل کاربر معمولی', style:TextStyle(fontFamily: 'IranSans',color: Colors.white,fontSize: currentIndex == 0 ? 14 : 10),),
                ),    
                onTap: (){
                  setState(() {
                    currentIndex = 0;                    
                  });
                },
              )
            ],
          )
         :Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
               InkWell(
                child : Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                child: Text('پنل کاربر فلفلی', style:TextStyle(fontFamily: 'IranSans',color: Colors.white,fontSize: currentIndex == 0 ? 14 : 10),),
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

class SendPostPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SendPostPageState();
  }

}

class SendPostPageState extends State<SendPostPage>{
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: Form(
        child: ListView(
          children: <Widget>[
            TextFormField(
              
            )
          ],
        ),
      )
    );
  }
}


class PanelPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PanelPageState();
  }

}

class PanelPageState extends State<PanelPage>{
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: ListView(
        children: <Widget>[
          Text('asd')
        ],
      )
    );
  }
}