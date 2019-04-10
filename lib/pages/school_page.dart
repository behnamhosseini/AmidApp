import 'package:flutter/material.dart';

class SchoolPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SchoolPageState();
  }

}

class SchoolPageState extends State<SchoolPage>{
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