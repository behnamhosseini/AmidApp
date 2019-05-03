import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/model/page_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


const kImageDemo =
    "https://freeiconshop.com/wp-content/uploads/edd/bulb-curvy-flat.png";


class Introduction extends StatelessWidget {
  final pages = [
    PageViewModel(
      "First title page",
      "Text of the first page",
      Center(child: Image.network(kImageDemo, height: 175.0)),
    ),
    PageViewModel(
      "Second title page",
      "Text of the second page, with a button",
      Center(child: Image.network(kImageDemo, height: 175.0)),
      footer: RaisedButton(
        onPressed: () {/* Nothing */},
        child: const Text('Button', style: TextStyle(color: Colors.white)),
        color: Colors.lightBlue,
      ),
    ),
    PageViewModel(
      "Third title page",
      "Text of the third page",
      Center(child: Image.network(kImageDemo, height: 175.0)),
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
      bodyTextStyle: TextStyle(fontSize: 22.0),
      progressColor: Colors.red,
      progressSize: Size.fromRadius(8),
    ),
  ];

  _onIntroEnd(context) async{
    SharedPreferences check = await SharedPreferences.getInstance();
    check.setInt('introductionCheck',1);
    Navigator.of(context).pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IntroductionScreen(
        pages: pages,
        onDone: () => _onIntroEnd(context),
        next: const Icon(Icons.arrow_forward),
        done: const Text('!بزن بریم', style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'IranSans')),
      ),
    );
  }
}

 
