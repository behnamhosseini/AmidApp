import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class MaagerPanelPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MaagerPanelPageState();
  }

}

class MaagerPanelPageState extends State<MaagerPanelPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  Map user;
  String role;
  MaagerPanelPageState({this.user});
  @override
  void initState() {
    super.initState();
    role='manager';
     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body: UserNewsFeedPsge(user: user,role:role,scaffkey: scaffKey,)
     );
    }
  }
