import 'package:flutter/material.dart';

class PostbankPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PostbankPageState();
  }

}

class PostbankPageState extends State<PostbankPage>{
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