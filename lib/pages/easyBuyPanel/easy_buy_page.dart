import 'package:amid_app/pages/easyBuyPanel/shop_category.dart';
import 'package:amid_app/server/shop.dart';
import 'package:flutter/material.dart';

class EasyBuyPage extends StatefulWidget{
  Map user;
  EasyBuyPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return EasyBuyPageState();
  }
}

class EasyBuyPageState extends State<EasyBuyPage>{
  int currentIndex = 0;
  List shops;
  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _getShops();
  }

  _getShops() async{
    Map response =await Shop().getShops(scaffKey);
     if(response['status']==200){
       setState(() {
         shops=response['data'];
         currentIndex=1;
       });
     }else{
       setState(() {
         currentIndex=0;
       });
     }
  }
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
                            icon: Icon(Icons.shopping_cart),
                            label: Text('سبد خرید',style: TextStyle(fontFamily: 'IranSans'),),
                            onPressed: () {},),
      key: scaffKey,
      backgroundColor: Color(0xffe0e0e0),
      body: Container(
            color: Color(0xffe0e0e0),
            child: Column(
              mainAxisAlignment:
              currentIndex == 0 
             ? MainAxisAlignment.spaceBetween
             : MainAxisAlignment.start, 
              children: <Widget>[
                //Image
                 SizedBox(
                   height: height/5,
                   width: width,
                   child: Card(
                     child:Container(
                           color: Color(0xff2980b9),
                            child: new Stack(
                              alignment: Alignment.centerLeft,
                              children: <Widget>[
                                new Opacity(
                                  opacity: .1,
                                  child: new Container(
                                  width:width,
                                  height: height/5,
                                    decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                            image:  AssetImage("assets/images/icon-background.png"),
                                            repeat: ImageRepeat.repeat
                                        )
                                    ),
                                  ),
                                ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: <Widget>[
                                     Container(
                                       width: width*0.55,
                                       child: Center(child: Text('خرید راحت',style: TextStyle(fontFamily: 'IranSans',fontSize: 24,color: Colors.white),)),
                                     ),
                                     Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child:CircleAvatar(child:Image.asset('assets/images/delivery.png'),radius:50,backgroundColor: Color(0xffBBDEFb),),
                                   )
                                   ],
                                 )
                              ]
                          )
                      )
                    ),
                 ),
            //ShoppingCategory
             currentIndex == 0 
             ?Center(child: Padding(
               padding: const EdgeInsets.only(bottom: 10),
               child: CircularProgressIndicator(),
             ),)
             :ShopCategory(shops:shops,user:widget.user)
            ],
        ),
      ),
    );
  }
}

