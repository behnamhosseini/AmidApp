import 'package:flutter/material.dart';

class SportsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SportsPageState();
  }

}

class SportsPageState extends State<SportsPage>{
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: Text('sad'),
    );
  }
}