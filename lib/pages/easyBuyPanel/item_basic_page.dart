import 'package:amid_app/pages/easyBuyPanel/item_body.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


//Asli
class ItemBasicPage extends StatefulWidget{
  Map user;
  List itemes;
  Map shop;

  ItemBasicPage({this.user,this.itemes,this.shop});
  @override
  State<StatefulWidget> createState() {
    return ItemBasicPageState();
  }
}

class ItemBasicPageState extends State<ItemBasicPage>{
  int currentIndex = 0;
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffKey,
      backgroundColor: Color(0xffe0e0e0),
      body:ItemBody(user:widget.user,itemes:widget.itemes,shop: widget.shop,),
    );
  }
}

