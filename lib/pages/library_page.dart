import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget{
  Map user;
  LibraryPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return LibraryPageState();
  }

}

class LibraryPageState extends State<LibraryPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='library';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }

 
