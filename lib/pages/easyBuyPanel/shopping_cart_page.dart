import 'package:amid_app/Models/DataModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
class ShoppingCartPage extends StatefulWidget {
  Map user;
  ShoppingCartPage({this.user});
  @override
  State<StatefulWidget> createState() {
    return ShoppingCartPageState();
  }

}

class ShoppingCartPageState extends State<ShoppingCartPage>{
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return  ScopedModelDescendant<DataModel>(
        builder: (context, child, model) {
         return Scaffold(
              backgroundColor: Colors.grey[100],
              body: Column(
                children: <Widget>[
                Container(
                  width: width,
                  height:  height*0.40,
                  color: Color(0xff0a8c46),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        width: width,
                        height: height*0.33,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              child: Icon(FontAwesomeIcons.arrowAltCircleRight,color: Colors.white,size: 30,),
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Text('سبد خرید',style: TextStyle(color: Colors.white),),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Icon(Icons.arrow_back,color:Color(0xff0a8c46),),
                          ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8))
                        ),
                        width: width -(width * 0.1),
                        height: height*0.2 ,
                      ),
                      Container(
                        width: width -(width * 0.1),
                        height: (height*0.2) + 40 ,
                        child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage('assets/images/avatar.png'),
                                  backgroundColor: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Text('${model.shopName}'),
                                ),
                               Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('${widget.user['name']}  ',style: TextStyle(color: Colors.black),),
                                    Icon(FontAwesomeIcons.checkCircle,size: 14,color: Colors.blue,)
                                  ],
                                ) 
                              ],
                            ),
                      )
                    ],
                  ),
                ),
              Container(
                  width: width,
                  height:  height*0.60,
                  color: Colors.grey[300],
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))
                        ),
                        width: width - (width*0.1),
                        height: (height*0.6) - (width*0.1 / 2),
                        child: ListView.builder(
                          itemCount: model.shoppingCart.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children:[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text('${model.shoppingCart[index]['title']} ${model.shoppingCart[index]['brand']}',style: TextStyle(color: Colors.black,fontSize: 12,)),
                                    Text('${model.shoppingCart[index]['amount']} ${model.shoppingCart[index]['unit']}',style: TextStyle(color: Colors.black,fontSize: 12,)),
                                  ],
                                ),
                                ListTile(
                                  // isThreeLine: true,
                                  dense:true,
                                  subtitle: Text('قیمت واحد : ${model.shoppingCart[index]['price']} تومان',style: TextStyle(color: Colors.grey,fontSize: 11,)),
                                  trailing: Text('${model.shoppingCart[index]['price'] * model.shoppingCart[index]['amount']}',style: TextStyle(color: Colors.black,fontSize: 12,)),
                                  // trailing: Text('${userData['Branch']['Supervisor']}',style: TextStyle(color: Colors.black),),
                                ),
                                Divider(
                                  color: Colors.grey[500],
                                  height: 0.0,
                                ),
                              ]
                            );
                          },
                         ),
                      )
                    ],
                  ),
                ),  
            ],
          )
          );

        },
      ); 

  }

}


// padding: EdgeInsets.only(top: 0, left: 5, right: 5),
//                           children: <Widget>[
//                             Divider(
//                               color: Colors.grey[500],
//                               height: 0.0,
//                             ),
//                             ListTile(
//                               dense:true,
//                               title: Text('سرپرستی',style: TextStyle(color: Colors.grey,fontSize: 14,)),
//                               // trailing: Text('${userData['Branch']['Supervisor']}',style: TextStyle(color: Colors.black),),
//                             ),
                            
//                           ],
