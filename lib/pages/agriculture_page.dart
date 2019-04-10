import 'package:flutter/material.dart';

class AgriculturePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AgriculturePageState();
  }

}

class AgriculturePageState extends State<AgriculturePage>{
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