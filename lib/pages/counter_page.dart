import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget{
  Map user;
  CounterPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return CounterPageState();
  }

}

class CounterPageState extends State<CounterPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='counter';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }

 