import 'package:flutter/material.dart';

class AmidabadPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AmidabadPageState();
  }

}

class AmidabadPageState extends State<AmidabadPage>{
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          child: Container(
            alignment: Alignment.center,
            height: screen.height - 20,
            width:  screen.width - 20,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'عمیدآباد',
                        style: TextStyle(
                          fontFamily: "IranSans",
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(' samh sahbas hgas as hgadsh dsa dnhsahnx  as ngfasja  bs ngyj')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}