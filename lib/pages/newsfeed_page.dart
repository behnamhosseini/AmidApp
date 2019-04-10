import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

class NewsFeed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsFeedState();
  }
}

class NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(bottom: 50),
       child: ListView(
         children: <Widget>[
           instaPost,
         ],
       ),
     );

  }
}

 final instaPost = new Column(
    crossAxisAlignment : CrossAxisAlignment.stretch,
    children: <Widget>[
        Column(
          children: <Widget>[
                  new Padding(
                        padding: const EdgeInsets.fromLTRB(16.0 , 16.0, 8.0, 16.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.only(left : 8.0),
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image : new DecorationImage(
                                          image: AssetImage('assets/images/library.png'),
                                    )
                                  ),
                                ),
                                Text(
                                  "کتابخانه امیرکبیر",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            new IconButton(icon: new Icon(Icons.more_vert), onPressed: null)
                          ],
                        ),
                      ),
                      new Row(
                        children: <Widget>[
                          new Expanded(
                              child: Image.network(
                                "https://kafebook.ir/wp-content/uploads/2018/12/%D8%A8%D8%B1%D8%A7%D8%AF%D8%B1%D8%A7%D9%86-%DA%A9%D8%A7%D8%B1%D8%A7%D9%85%D8%A7%D8%B2%D9%88%D9%81-770x480.jpg",
                                fit: BoxFit.cover,
                              )
                          )
                        ],
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new IconButton(icon: new Icon(FontAwesomeIcons.heart, color: Colors.black), onPressed: null),
                                Text('22 نفر این پست را پسندیدند'),
                                // new IconButton(icon: new Icon(FontAwesomeIcons.comment , color: Colors.black), onPressed: null),
                                // new IconButton(icon: new Icon(FontAwesomeIcons.paperPlane , color: Colors.black), onPressed: null)
                              ],
                            ),
                                Text("1 روز قبل" , style:  TextStyle(color: Colors.grey),),
                              // new IconButton(icon: new Icon(FontAwesomeIcons.bookmark, color: Colors.black), onPressed: null)
                          ],
                        ),
                      ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,0,14,10),
                            child: Text('رمان برادران کارامازوف آخرین اثر نویسنده بزرگ روس، فیودور داستایفسکی است. رمانی که داستایفسکی سه سال از آخرین سال‌های عمر خود را صرف نوشتن آن کرد. این رمان نهایتا در سال ۱۸۸۰ به پایان رسید و اگر نویسنده از دنیا نمی‌رفت قصد داشت داستان آن را ادامه دهد. به اعتقاد بسیارانی این رمان بزرگ‌ترین رمان داستایفسکی است.'),
                          ),   
                ],
        ),
        Divider(),
        Column(
          children: <Widget>[
                  new Padding(
                        padding: const EdgeInsets.fromLTRB(16.0 , 16.0, 8.0, 16.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.only(left : 8.0),
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image : new DecorationImage(
                                          image: AssetImage('assets/images/school.png'),
                                    )
                                  ),
                                ),
                                Text(
                                  "مدرسه دانش",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            new IconButton(icon: new Icon(Icons.more_vert), onPressed: null)
                          ],
                        ),
                      ),
                      new Row(
                        children: <Widget>[
                          new Expanded(
                              child: Image.network(
                                "https://kafebook.ir/wp-content/uploads/2018/12/%D8%A8%D8%B1%D8%A7%D8%AF%D8%B1%D8%A7%D9%86-%DA%A9%D8%A7%D8%B1%D8%A7%D9%85%D8%A7%D8%B2%D9%88%D9%81-770x480.jpg",
                                fit: BoxFit.cover,
                              )
                          )
                        ],
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new IconButton(icon: new Icon(FontAwesomeIcons.heart, color: Colors.black), onPressed: null),
                                Text('22 نفر این پست را پسندیدند'),
                                // new IconButton(icon: new Icon(FontAwesomeIcons.comment , color: Colors.black), onPressed: null),
                                // new IconButton(icon: new Icon(FontAwesomeIcons.paperPlane , color: Colors.black), onPressed: null)
                              ],
                            ),
                                Text("1 روز قبل" , style:  TextStyle(color: Colors.grey),),
                              // new IconButton(icon: new Icon(FontAwesomeIcons.bookmark, color: Colors.black), onPressed: null)
                          ],
                        ),
                      ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,0,14,10),
                            child: Text('رمان برادران کارامازوف آخرین اثر نویسنده بزرگ روس، فیودور داستایفسکی است. رمانی که داستایفسکی سه سال از آخرین سال‌های عمر خود را صرف نوشتن آن کرد. این رمان نهایتا در سال ۱۸۸۰ به پایان رسید و اگر نویسنده از دنیا نمی‌رفت قصد داشت داستان آن را ادامه دهد. به اعتقاد بسیارانی این رمان بزرگ‌ترین رمان داستایفسکی است.'),
                          ),   
                ],
        ),
        Divider(),
    ],
  );


  