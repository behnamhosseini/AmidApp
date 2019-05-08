import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class ItPage extends StatefulWidget{
  Map user;
  ItPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return ItPageState();
  }

}

class ItPageState extends State<ItPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='it';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }

 
