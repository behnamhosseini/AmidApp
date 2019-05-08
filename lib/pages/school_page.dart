import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class SchoolPage extends StatefulWidget{
  Map user;
  SchoolPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return SchoolPageState();
  }

}

class SchoolPageState extends State<SchoolPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='school';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }

 
