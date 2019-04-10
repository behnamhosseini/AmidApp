import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LibraryPageState();
  }

}

class LibraryPageState extends State<LibraryPage>{
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