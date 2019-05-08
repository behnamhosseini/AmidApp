import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class CouncilPage extends StatefulWidget{
  Map user;
  CouncilPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return CouncilPageState();
  }

}

class CouncilPageState extends State<CouncilPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='council';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }