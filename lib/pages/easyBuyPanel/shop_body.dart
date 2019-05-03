import 'package:amid_app/pages/easyBuyPanel/item_basic_page.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ShopBody extends StatefulWidget{
  Map user;
  Map shop;
  int shopId;
  List itemesCategory;
  ShopBody({this.user,this.shop,this.itemesCategory,this.shopId});
  @override
  State<StatefulWidget> createState() {
    return ShopBodyState();
  }

}

class ShopBodyState extends State<ShopBody>{
  Map user;
  Map shop;
  int shopId;
  List itemesCategory;
  var height;
  var width;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    user=widget.user;
    itemesCategory=widget.itemesCategory;
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return SizedBox(
            width: width,
            height: height-(height)/5,
            child:ListView.builder(
            itemCount: itemesCategory.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                      elevation: 5,
                      child:Container(
                          color: Color(0xff19b395),
                          child:Stack(
                                fit: StackFit.loose,
                                children: <Widget>[
                                Opacity(
                                  opacity: .1,
                                  child: new Container(
                                    width: width,
                                    height: (height)/4.1,
                                    decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                            image: new AssetImage("assets/images/icon-background.png"),
                                            repeat: ImageRepeat.repeat
                                        )
                                    ),
                                  ),
                                ),

                                  SizedBox(
                                    width: 100,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(right: 4,left: 10),
                                          child: Column(
                                            children: <Widget>[
                                              CircleAvatar(
                                                child: CachedNetworkImage(imageUrl:itemesCategory[index]['imageUrl']),
                                                // backgroundImage:NetworkImage(itemesCategory[index]['imageUrl'])
                                                radius:50,backgroundColor: Color(0xff19b395),
                                                ),
                                              // CircleAvatar(child:Image.network(shop[index]['imageUrl'],repeat: ImageRepeat.repeat,),radius:50,backgroundColor: Color(0xffBBDEFb),),
                                              ActionChip(label: Text('${itemesCategory[index]['title']}',style: TextStyle(fontFamily: 'IranSans',fontSize: 11,color: Colors.white),overflow: TextOverflow.ellipsis,), onPressed: () {},backgroundColor:  Color(0xff2980b9),)
                                             ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right:85,top: 3),
                                    child: SizedBox(
                                           width: MediaQuery.of(context).size.width,
                                           height:(height)/4,  
                                           child: 
                                           itemesCategory[index]['itemTypes']['data'].length != 0
                                           ?ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: itemesCategory[index]['itemTypes']['data'].length,
                                                  itemBuilder: (BuildContext context, int index2) {                                                  
                                                   return Container(
                                                      width: width/3,
                                                      child: Column(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              Text('${itemesCategory[index]['itemTypes']['data'][index2]['title']}',style: TextStyle(fontFamily: 'IranSans'),overflow: TextOverflow.ellipsis,),
                                                              GestureDetector(
                                                                child: Padding(
                                                                padding: const EdgeInsets.only(top: 4),
                                                                child: CachedNetworkImage(imageUrl:itemesCategory[index]['itemTypes']['data'][index2]['imageUrl'],width: width/4,height:height/5),
                                                              ),
                                                              onTap: (){
                                                                 Navigator.of(context)
                                                                .push(
                                                                  MaterialPageRoute(builder: (BuildContext context) {
                                                                   return Directionality(child: ItemBasicPage(shop:shop,user:user,itemes:itemesCategory[index]['itemTypes']['data'][index2]['items']['data']), textDirection: TextDirection.rtl,);
                                                                  }
                                                                 )
                                                                );
                                                              },
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      
                                                    );
                                                  },
                                                 )
                                          :Text('lnnkm')
                                            ),
                                  ),
                               ],
                          ),
                    ),
                );
             },
          ),  
        );
}

}