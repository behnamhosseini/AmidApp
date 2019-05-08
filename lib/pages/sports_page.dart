import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class SportsPage extends StatefulWidget{
  Map user;
  SportsPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return SportsPageState();
  }

}

class SportsPageState extends State<SportsPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='sports';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }

 
