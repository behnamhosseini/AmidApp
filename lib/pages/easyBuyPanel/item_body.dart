import 'package:amid_app/Models/DataModel.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:scoped_model/scoped_model.dart';

class ItemBody extends StatefulWidget{
  Map user;
  Map shop;
  int shopId;
  List itemes;
  ItemBody({this.user,this.shop,this.itemes,this.shopId});
  @override
  State<StatefulWidget> createState() {
    return ItemBodyState();
  }

}

class ItemBodyState extends State<ItemBody>{
  Map user;
  var height;
  var width;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return ListView.builder(
           itemCount:widget.itemes.length,
           itemBuilder: (BuildContext context, int index) {
             return ItemDetails(user:widget.user,itemes:widget.itemes,index:index,shop:widget.shop);
           },
        ); 
     }
}


class ItemDetails extends StatefulWidget{
  Map user;
  List itemes;
  int index;
  Map shop;
  ItemDetails({this.user,this.itemes,this.index,this.shop});

  @override
  State<StatefulWidget> createState() {
    return ItemDetailsState();
 }
}


 class ItemDetailsState extends State<ItemDetails>{
  var height;
  var width;
  String currentValue;
  List<DropdownMenuItem> units;
  @override
  void initState() {
    super.initState();
    units=[];
    widget.itemes[widget.index]['itemUnits']['data'].forEach((element){
       units.add(DropdownMenuItem(
         child:Text('${element['description']}'),
         value: element['description'],
         )
      );
   });
    currentValue=widget.itemes[widget.index]['itemUnits']['data'][0]['description'];

  }
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return ScopedModelDescendant<DataModel>(
      builder: ( context,  child,  model) {
        return Card(
            elevation: 5,
            child:Container(
                color: Color(0xff19b395),
                child:Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                      Opacity(
                        opacity: 0.05,
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
                      Row(
                        children: <Widget>[
                        Container(
                        width: width*0.66,
                        height:(height)/4.1 ,
                        // color: Colors.red,
                        child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Chip(label: Text('${widget.itemes[widget.index]['title']} ${widget.itemes[widget.index]['brand']}',style:TextStyle(fontFamily: 'IranSans',color: Colors.white)),backgroundColor: Colors.black,),
                                      // Text('${widget.itemes[widget.index]['brand']}',style:TextStyle(fontFamily: 'IranSans'),)    
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('قیمت : ',style:TextStyle(fontFamily: 'IranSans'),),
                                      Text('${widget.itemes[widget.index]['price']} تومان',style:TextStyle(fontFamily: 'IranSans',color: Colors.white),)    
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,                                    
                                    children: <Widget>[
                                      Text('واحد : ',style:TextStyle(fontFamily: 'IranSans'),),                                      
                                      DropdownButton(

                                        items:units,
                                        hint:Text(currentValue,style:TextStyle(fontFamily: 'IranSans',color: Colors.white)) ,
                                        onChanged: ((value){
                                          setState(() {
                                             currentValue=value;
                                          });
                                        }
                                       ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[   
                                      widget.itemes[widget.index]['available'] == 1
                                      ?Row(
                                        children: <Widget>[
                                          GestureDetector(
                                            child: Icon(Icons.add_circle,size: 32,),
                                            onTap: (){
                                              Map item = {
                                                'id' : widget.itemes[widget.index]['id'],
                                                'title' : widget.itemes[widget.index]['title'],
                                                'brand' : widget.itemes[widget.index]['brand'],
                                                'price' : widget.itemes[widget.index]['price'],
                                                'unit' : currentValue,
                                                'shopName' : widget.shop['title'],
                                                'amount' : 1,
                                              };
                                              model.addToShoppingCart(item);
                                            },
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: model.shoppingCartId.contains(widget.itemes[widget.index]['id'])
                                              ? Text('${model.shoppingCart[model.shoppingCartId.indexOf(widget.itemes[widget.index]['id'])]['amount']}',style: TextStyle(color: Colors.white),)
                                              :Text('0',style: TextStyle(color: Colors.white)),
                                            ),
                                          ),

                                          GestureDetector(
                                            child: Icon(Icons.remove_circle,size: 32),
                                            onTap: (){
                                                Map item = {
                                                'id' : widget.itemes[widget.index]['id'],
                                               };
                                              model.removefromShoppingCart(
                                                item
                                              );
                                            },
                                          )
                                          
                                        ],
                                      )
                                      :Text('ناموجود',style: TextStyle(color: Colors.amber))
                                    ],
                                  )

                                  
                                ],
                        ),
                        ),
                        SizedBox(
                          width: width*0.30,
                          height:(height)/4.8 ,
                          child:CachedNetworkImage(
                            imageUrl: widget.itemes[widget.index]['imageUrl'],
                            placeholder:(context ,String d){
                              return  CircularProgressIndicator();
                            },
                          )
                        )
                      ],
                      )
                      //itemImageDa
                     
                    ])
            ),
    );
  
      },
    );
  }
 }
