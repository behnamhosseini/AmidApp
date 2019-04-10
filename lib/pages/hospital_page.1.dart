import 'package:flutter/material.dart';

class HospitalPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HospitalPageState();
  }

}

class HospitalPageState extends State<HospitalPage>{
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