import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


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
             return ItemDetails(user:widget.user,itemes:widget.itemes,index:index);
           },
        ); 
     }
}


class ItemDetails extends StatefulWidget{
  Map user;
  List itemes;
  int index;
  ItemDetails({this.user,this.itemes,this.index});

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
                                      Chip(label: Text('${widget.itemes[widget.index]['title']} ${widget.itemes[widget.index]['brand']}',style:TextStyle(fontFamily: 'IranSans',color: Colors.white)),backgroundColor: Colors.black,)
                                      // Text('${itemes[index]['brand']}',style:TextStyle(fontFamily: 'IranSans'),)    
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
                                        disabledHint: Text('sd'),
                                        hint:Text(currentValue) ,
                                        onChanged: ((value){
                                          setState(() {
                                             currentValue=value;
                                          });
                                        }
                                       ))
                                    ],
                                  )
                                ],
                        ),
                        ),
                      ],
                      )
                    ])
            ),
    );
  }
 }
