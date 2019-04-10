import 'package:amid_app/pages/my_panel_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

class MediaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MediaState();
  }

}

class MediaState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width /4;    

    return ListView(
           scrollDirection: Axis.horizontal,
           children: <Widget>[
             //Menu/Profile
             Padding(
              padding: const EdgeInsets.fromLTRB(0,24,0,60),
              child: Card(
              color: Color.fromRGBO(239, 57, 79, 1), 
              elevation: 5,
              child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                           //Calender/Date
                           Padding(
                             padding: const EdgeInsets.symmetric(vertical: 15),
                             child: Column(
                               children: <Widget>[                           Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text('${format1(Jalali.now())}',style:TextStyle(fontSize: 14,fontFamily: 'IranSans',color: Colors.white)),
                          ),
                             Text('${Jalali.now()}',style: TextStyle(fontSize: 14,fontFamily: 'IranSans',color: Colors.white),),],
                             ),
                           ),
                           //Profile
                           Column(
                             children: <Widget>[
                              Text('ابری',style: TextStyle(fontSize: 14,fontFamily: 'IranSans',color: Colors.white)),
                              Icon(Icons.cloud_queue,size: 35,color: Colors.white),
                              Text('℃2-',style: TextStyle(fontSize: 14,fontFamily: 'IranSans',color: Colors.white)),
                             ],
                           )
                        ],
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/logo.jpg'),
                            radius: 60,
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pushNamed('/amidabad');
                        },
                      ),
                      Column(
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            'مهدی دودانگه',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "IranSans"
                            ),
                          ),
                          Text(
                            'دهیار',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "IranSans"
                            ),
                          ),
                          OutlineButton(
                            borderSide: BorderSide(
                              color: Colors.white
                            ),
                            splashColor: Colors.white,
                            disabledBorderColor: Colors.white,
                            highlightedBorderColor: Colors.white,
                            color: Colors.white,
                            child: Text(
                              'ورود به پنل',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "IranSans"
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: MyPanelPage(),
                                    );
                                  }
                                )
                              );
                            },
                          )
                        ],
                      )
                    ],
                 ),
              
              ),
            ),
             //page 1
             Padding(
               padding: const EdgeInsets.only(bottom: 62),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                 //Header
                 SizedBox(
                   width:MediaQuery.of(context).size.width-40,
                   height: (MediaQuery.of(context).size.height - 160) / 4,
                   child: Card(
                     color:  Color.fromRGBO(239, 57, 79, 1),
                   ),
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                    child:Container(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            Image.asset('assets/images/Municipality.png',
                              width: width,
                            ),
                            Text('دهیاری',style: TextStyle(fontFamily: 'IranSans'),)
                          ],
                            ),
                        ),
                      ),
                      height: (MediaQuery.of(context).size.height - 62) / 4,
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, '/municipality');
                    },
                  ), 
                 GestureDetector(
                   child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(4),
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Image.asset('assets/images/reunion.png',width: width),
                         Text('شورای محل',style: TextStyle(fontFamily: 'IranSans'),)
                       ],
                   ),
                     ),
                   ),
                   ),
                   onTap: (){
                     Navigator.pushNamed(context, '/council');
                   },
                 ), 
                 GestureDetector(
                   child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(4),
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Image.asset('assets/images/bank.png',width: width),
                         Text('پست بانک',style: TextStyle(fontFamily: 'IranSans'))
                       ],
                   ),
                     ),
                   ),
                   ),
                   onTap: (){
                     Navigator.pushNamed(context, '/postbank');
                   },
                 ), 

            ],),
          //Second row
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                 GestureDetector(
                   child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(4),
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                       children: <Widget>[
                         Image.asset('assets/images/school.png',width: width),
                         Text('مدرسه',style: TextStyle(fontFamily: 'IranSans'),)
                       ],
                   ),
                     ),
                   ),
                   ),
                   onTap: (){
                     Navigator.pushNamed(context, '/school');
                   },
                 ), 
                 GestureDetector(
                   child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(4),
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                       children: <Widget>[
                         Image.asset('assets/images/classroom.png',width: width),
                         Text('آموزشگاه زبان',style: TextStyle(fontFamily: 'IranSans'),)
                       ],
                   ),
                     ),
                   ),
                   ),
                   onTap: (){
                     Navigator.pushNamed(context, '/englishInstitue');
                   },
                 ), 
                 GestureDetector(
                   child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(4),
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                       children: <Widget>[
                         Image.asset('assets/images/library.png',width: width),
                         Text('کتابخانه',style: TextStyle(fontFamily: 'IranSans'))
                       ],
                   ),
                     ),
                   ),
                   ),
                   onTap: (){
                     Navigator.pushNamed(context, '/library');
                   },
                 ), 

            ],),
          //Third row
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[ 
                 GestureDetector(
                   child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(4),
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                       children: <Widget>[
                         Image.asset('assets/images/behdasht.png',width: width),
                         Text('بهداشت',style: TextStyle(fontFamily: 'IranSans'),)
                       ],
                   ),
                     ),
                   ),
                   ),
                   onTap: (){
                     Navigator.pushNamed(context, '/health');
                   },
                 ), 
                 GestureDetector(
                   child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(4),
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                       children: <Widget>[
                         Image.asset('assets/images/doctor.png',width: width),
                         Text('دکتر',style: TextStyle(fontFamily: 'IranSans'))
                       ],
                   ),
                     ),
                   ),
                   ),
                   onTap: (){
                     Navigator.pushNamed(context, '/doctor');
                   },
                 ), 
                 GestureDetector(
                   child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(4),
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                       children: <Widget>[
                         Image.asset('assets/images/football.png',width: width),
                         Text('ورزشی',style: TextStyle(fontFamily: 'IranSans'),)
                       ],
                   ),
                     ),
                   ),
                   ),
                   onTap: (){
                     Navigator.pushNamed(context, '/sports');
                   },
                 ),
            ],),    
                 ],
               ),
             ),
             //page 2
             Padding(
               padding: const EdgeInsets.only(bottom: 62),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                 //Header
                 SizedBox(
                   width:MediaQuery.of(context).size.width-40,
                   height: (MediaQuery.of(context).size.height - 160) / 4,
                   child: Card(
                     color:  Color.fromRGBO(239, 57, 79, 1),
                   ),
                 ),
                  //First row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    GestureDetector(
                      child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: <Widget>[
                            Image.asset('assets/images/delivery.png',width: width),
                            Text('خرید راحت',style: TextStyle(fontFamily: 'IranSans'),)
                          ],
                      ),
                        ),
                      ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/easyBuy');
                      },
                    ), 
                    GestureDetector(
                      child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: <Widget>[
                            Image.asset('assets/images/bags.png',width: width),
                            Text('هرشنبه بازار',style: TextStyle(fontFamily: 'IranSans'),)
                          ],
                      ),
                        ),
                      ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/market');
                      },
                    ), 
                    GestureDetector(
                      child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: <Widget>[
                            Image.asset('assets/images/taxi.png',width: width),
                            Text('تاکسی',style: TextStyle(fontFamily: 'IranSans'))
                          ],
                      ),
                        ),
                      ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/taxi');
                      },
                    ), 

                  ],),
                 //Second row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    GestureDetector(
                      child:Container(
                      height: (MediaQuery.of(context).size.height - 62) / 4,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: <Widget>[
                            Image.asset('assets/images/karInja.png',width: width),
                            Text('کار اینجا',style: TextStyle(fontFamily: 'IranSans'),)
                          ],
                      ),
                        ),
                      ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/jobInja');
                      },
                    ), 
                    GestureDetector(
                      child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: <Widget>[
                            Image.asset('assets/images/farm.png',width: width),
                            Text('دامپروری',style: TextStyle(fontFamily: 'IranSans'),)
                          ],
                      ),
                        ),
                      ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/animalHusbandry');
                      },
                    ), 
                    GestureDetector(
                      child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: <Widget>[
                            Image.asset('assets/images/plant.png',width: width),
                            Text('کشاورزی',style: TextStyle(fontFamily: 'IranSans'))
                          ],
                      ),
                        ),
                      ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/agriculture');
                      },
                    ), 

                  ],),
                 //Third row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    GestureDetector(
                      child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: <Widget>[
                            Image.asset('assets/images/editor.png',width: width),
                            Text('IT',style: TextStyle(fontFamily: 'IranSans'),)
                          ],
                      ),
                        ),
                      ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/it');
                      },
                    ),
                    GestureDetector(
                      child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: <Widget>[
                            Image.asset('assets/images/bill.png',width: width),
                            Text('پیشخوان',style: TextStyle(fontFamily: 'IranSans'),)
                          ],
                      ),
                        ),
                      ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/counter');
                      },
                    ),
                    GestureDetector(
                      child:Container(
                     height: (MediaQuery.of(context).size.height - 62) / 4,
                     child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: <Widget>[
                            Image.asset('assets/images/gallery.png',width: width),
                            Text('گالری تصاویر',style: TextStyle(fontFamily: 'IranSans'),)
                          ],
                      ),
                        ),
                      ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/gallery');
                      },
                    ),
                  ],),    
    
                          ],),
             ),    
           ],
    );      
  }
}




String format1(Date d) {
    final f = d.formatter;
    return '${f.wN} ${f.d} ${f.mN}';
  }