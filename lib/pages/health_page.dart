import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class HealthPage extends StatefulWidget{
  Map user;
  HealthPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return HealthPageState();
  }

}

class HealthPageState extends State<HealthPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='health';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }

 
