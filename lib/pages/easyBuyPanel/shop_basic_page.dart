import 'package:amid_app/Models/DataModel.dart';
import 'package:amid_app/pages/easyBuyPanel/shop_body.dart';
import 'package:amid_app/pages/easyBuyPanel/shop_category.dart';
import 'package:amid_app/pages/easyBuyPanel/shopping_cart_page.dart';
import 'package:amid_app/server/shop.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

//Asli

class ShopBasicPage extends StatefulWidget{
  Map user;
  List items;
  Map shop;
  ShopBasicPage({this.user,this.shop});
  @override
  State<StatefulWidget> createState() {
    return ShopBasicPageState();
  }
}

class ShopBasicPageState extends State<ShopBasicPage>{
  int currentIndex = 0;
  Map shop;
  List itemesCategory;

  GlobalKey scaffKey=GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    shop = widget.shop;
    itemesCategory = widget.shop['itemCategories']['data'];
  }

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return ScopedModelDescendant<DataModel>(
      builder: (contextt, child, model) {
        return WillPopScope(
                onWillPop: () {
                  if(model.shoppingCart.isEmpty){
                    model.emptyShopName();
                    Navigator.of(context).pop();
                  }else{
                    return showDialog(
                          context: context,
                          builder: (context){
                            return Directionality(
                              child: AlertDialog(
                              title: Text('درصورت خروج سبد خرید شما خالی خواهد شد',style: TextStyle(fontSize: 14),),
                              content: Text('آیا مایل به خروج هستید؟',style: TextStyle(fontSize: 12)),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('تایید'),
                                  onPressed: () {
                                    model.emptyShopName();
                                    model.emptyShoppingCart();
                                    model.emptyShopinId();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                },),
                                FlatButton(
                                  child: Text('ادامه خرید'),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },)  
                              ],
                            ),
                              textDirection:TextDirection.rtl
                              );
                          },
                          );
                  }
                },
                child:  Scaffold(
                floatingActionButton:
                    FloatingActionButton.extended(
                        icon: Icon(Icons.shopping_cart),
                        label: Text('سبد خرید',style: TextStyle(fontFamily: 'IranSans'),),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) {
                              return Directionality(
                                textDirection: TextDirection.rtl,
                                child: ShoppingCartPage(user:widget.user),
                              );
                            }
                          ));
                        },
                    ),
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
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                width: width*0.40,
                                                child:Center(
                                                      child:Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Text('${shop['title']}',style: TextStyle(fontFamily: 'IranSans',fontSize: 22,color: Colors.white)),
                                                          Text('${shop['shopStatus']}',style: TextStyle(fontFamily: 'IranSans',fontSize: 16,color: Colors.white))
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
                                          
                                        ]
                                    )
                                )
                              ),
                          ),
                      //ShoppingCategory
                      ShopBody(shop:shop,user:widget.user,itemesCategory:itemesCategory)
                      ],
                  ),
                ),
              ),
              ); 

      },
    );  
  }
}

