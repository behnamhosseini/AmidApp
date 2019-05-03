import 'package:amid_app/pages/easyBuyPanel/shop_body.dart';
import 'package:amid_app/pages/easyBuyPanel/shop_category.dart';
import 'package:amid_app/server/shop.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


//Asli

class ShopBasicPage extends StatefulWidget{
  Map user;
  int shopId;
  ShopBasicPage({this.user,this.shopId});
  @override
  State<StatefulWidget> createState() {
    return ShopBasicPageState();
  }
}

class ShopBasicPageState extends State<ShopBasicPage>{
  int currentIndex = 0;
  List itemesCategory;
  Map shop;
  int shopId;

  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _getShops();
  }

  _getShops() async{
    Map response =await Shop().getItemes(scaffKey,widget.shopId);
     if(response['data']['status']==200){
       setState(() {
         itemesCategory=response['data']['itemCategories']['data'];
         shop=response['data'];
        //  print(shop['title']);
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
    shopId=widget.shopId;
    return Scaffold(
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
                                            image: new AssetImage("assets/images/icon-background.png"),
                                            repeat: ImageRepeat.repeat
                                        )
                                    ),
                                  ),
                                ),
                                 currentIndex == 1
                                 ?Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: <Widget>[
                                     Container(
                                       width: width*0.40,
                                       child:Center(
                                             child:Column(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: <Widget>[
                                                 Text('${shop['title']}',style: TextStyle(fontFamily: 'IranSans',fontSize: 22,color: Colors.white)),
                                                 Text('${shop['status']}',style: TextStyle(fontFamily: 'IranSans',fontSize: 16,color: Colors.white))
                                               ],
                                             ),
                                            )
                                      ),
                                     Padding(
                                   padding: EdgeInsets.only(left: 0),
                                  //  child:CircleAvatar(child:Image.network(shop['imageUrl']),radius:50,backgroundColor: Color(0xffBBDEFb),),
                                      child: CachedNetworkImage(
                                                      imageUrl: shop['imageUrl'],
                                                      placeholder: (context, url) => new CircularProgressIndicator(),
                                                      errorWidget: (context, url, error) => new Icon(Icons.error),
                                       )
                                       
                                   )
                                   ],
                                 )
                                 :Text('در حال بارگذاری...')
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
             :ShopBody(shop:shop,shopId:shopId=widget.shopId,user:widget.user,itemesCategory:itemesCategory)
            ],
        ),
      ),
    );
  }
}

