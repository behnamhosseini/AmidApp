import 'package:flutter/material.dart';

class CouncilPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CouncilPageState();
  }

}

class CouncilPageState extends State<CouncilPage>{
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