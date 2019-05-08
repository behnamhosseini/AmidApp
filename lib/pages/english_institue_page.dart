import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class EnglishInstituePage extends StatefulWidget{
  Map user;
  EnglishInstituePage({this.user});
  @override
  State<StatefulWidget> createState() {
    return EnglishInstituePageState();
  }

}

class EnglishInstituePageState extends State<EnglishInstituePage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='englishInstitue';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }

 
