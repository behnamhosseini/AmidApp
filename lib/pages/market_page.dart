import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MarketPageState();
  }
}

class MarketPageState extends State<MarketPage>{
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[Color(0xfff8d809),Color(0xfffadf0c),Color(0xfff8d809)])
        ),
      ),
    );
  }
}