import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class AgriculturePage extends StatefulWidget{
  Map user;
  AgriculturePage({this.user});
  @override
  State<StatefulWidget> createState() {
    return AgriculturePageState();
  }

}

class AgriculturePageState extends State<AgriculturePage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='agriculturePage';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }