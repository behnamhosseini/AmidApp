import 'package:amid_app/pages/user_newsfeed.page.dart';
import 'package:flutter/material.dart';

class MunicipalityPanelPage extends StatefulWidget{
  Map user;
  MunicipalityPanelPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return MunicipalityPanelPageState();
  }

}

class MunicipalityPanelPageState extends State<MunicipalityPanelPage>{
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  String role;
  @override
  void initState() {
    super.initState();
    role='municipality';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffKey,
       body:UserNewsFeedPsge(user:widget.user,role:role,scaffkey: scaffKey,)
     );
    }
  }
