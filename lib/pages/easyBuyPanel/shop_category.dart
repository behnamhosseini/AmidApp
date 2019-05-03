import 'package:amid_app/pages/easyBuyPanel/item_basic_page.dart';
import 'package:amid_app/pages/easyBuyPanel/shop_basic_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShopCategory extends StatefulWidget{
  Map user;
  List shops;
  ShopCategory({this.user,this.shops});
  @override
  State<StatefulWidget> createState() {
    return ShopCategoryState();
  }

}

class ShopCategoryState extends State<ShopCategory>{
  Map user;
  List shops;
  var height;
  var width;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user=widget.user;
    shops=widget.shops;
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return SizedBox(
            width: width,
            height: height-(height)/5,
            child:ListView.builder(
            itemCount: shops.length,
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
                                              CircleAvatar(child:CachedNetworkImage(
                                                                 imageUrl:shops[index]['imageUrl'],
                                                                 ),radius:50,
                                                                 backgroundColor: Color(0xff19b395),
                                                                 ),
                                              // CircleAvatar(child:Image.network(shops[index]['imageUrl'],repeat: ImageRepeat.repeat,),radius:50,backgroundColor: Color(0xffBBDEFb),),
                                              ActionChip(label: Text('${shops[index]['title']}',style: TextStyle(fontFamily: 'IranSans',fontSize: 11,color: Colors.white),), onPressed: () {},backgroundColor:  Color(0xff2980b9),)
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
                                           shops[index]['shops']['data'].length != 0
                                           ?ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: shops[index]['shops']['data'].length,
                                                  itemBuilder: (BuildContext context, int index2) {
                                                    return Container(
                                                      width: width/3,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: <Widget>[
                                                          Column(  
                                                            children: <Widget>[
                                                              Text('${shops[index]['shops']['data'][index2]['title']}',style: TextStyle(fontFamily: 'IranSans',fontSize: 12),overflow: TextOverflow.ellipsis,),
                                                              
                                                              GestureDetector(
                                                                child:Padding(
                                                                padding: const EdgeInsets.only(top: 4),
                                                                child: CachedNetworkImage(
                                                                        imageUrl: (shops[index]['imageUrl']),
                                                                        width: width/4,
                                                                       )),
                                                              onTap: (){
                                                                Navigator.of(context)
                                                                .push(
                                                                  MaterialPageRoute(builder: (BuildContext context) {
                                                                   return 
                                                                   shops[index]['shops']['data'][index2]['needsCategory'] == 1
                                                                   ?Directionality(child: ShopBasicPage(user:user,shopId:shops[index]['shops']['data'][index2]['id']), textDirection: TextDirection.rtl,)
                                                                   :Directionality(child: ItemBasicPage(user:user,shop:shops[index]['shops']['data'][index2],itemes:shops[index]['shops']['data'][index2]['items']['data'],), textDirection: TextDirection.rtl,);
                                                                  //  :Text('mkvmv');
                                                                  }
                                                                 )
                                                                );
                                                              },
                                                              )
                                                            ],
                                                          ),
                                                          Text('${shops[index]['shops']['data'][index2]['shopStatus']}',style: TextStyle(color: Colors.white,fontFamily: 'IranSans',fontSize: 11))
                                                        ],
                                                      ),
                                                      
                                                    );
                                                  },
                                                 )
                                          :Center(
                                            child:Text('فروشگاهی برای نمایش وجود ندارد',style: TextStyle(fontFamily: 'IranSans',color:Colors.white),)
                                          )
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