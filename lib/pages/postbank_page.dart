import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class PostbankPage extends StatefulWidget{
  Map user;
  PostbankPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return PostbankPageState();
  }

}

class PostbankPageState extends State<PostbankPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='postBank';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }

 
