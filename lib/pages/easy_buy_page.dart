import 'package:flutter/material.dart';

class EasyBuyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EasyBuyPageState();
  }

}

class EasyBuyPageState extends State<EasyBuyPage>{
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