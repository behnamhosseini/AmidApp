import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CounterPageState();
  }

}

class CounterPageState extends State<CounterPage>{
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: Text('sad'),
    );
  }
}