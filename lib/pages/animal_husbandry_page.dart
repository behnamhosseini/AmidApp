import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class AnimalHusbandryPage extends StatefulWidget{
  Map user;
  AnimalHusbandryPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return AnimalHusbandryPageState();
  }

}

class AnimalHusbandryPageState extends State<AnimalHusbandryPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='animalHusbandry';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }