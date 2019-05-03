import 'dart:async';

import 'package:amid_app/helpers/help.dart';
import 'package:amid_app/server/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return SplashState();
  }
  
}

class SplashState extends State<Splash>{
  BuildContext context2;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
   int introduction = 0;
   String apiTokecnCheck;
   @override
   void initState() {
    super.initState();
      _checkConnectionInternet();
      _startTime();
    }
   
  _checkConnectionInternet()async{
      if(await checkConnectionInternet()) {
      _setIntroduction();
      _apiTokecnCheck();
      }else{
        _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          duration: new Duration(hours: 2),
          content: new GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.hideCurrentSnackBar();
            },
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text('از اتصال دستگاه به اینترنت مطمئن شوید', style: TextStyle(fontFamily: 'Vazir')),
                new Icon(Icons.wifi_lock , color: Colors.white)
              ],
            ),
          )
        )          
        );
      }
  }

  _setIntroduction()async{
    SharedPreferences check = await SharedPreferences.getInstance();
    introduction=check.getInt('introductionCheck');
    }
  _apiTokecnCheck()async{
   SharedPreferences check = await SharedPreferences.getInstance();
    apiTokecnCheck=check.getString('api_token');
    if(apiTokecnCheck == null){
       _checkIntroduction();    
    }else{
      checkApiToken(apiTokecnCheck,context2);
    }
    
  }
  _startTime(){
    var _duration=Duration(hours: 5);
    return Timer(_duration,_checkIntroduction);
  }
  _checkIntroduction(){
    introduction == 1 
    ? Navigator.of(context).pushNamed('/home')
    : Navigator.of(context).pushNamed('/introduction');
  }
  Widget build(BuildContext context) {
    setState(() {
     context2=context; 
    });
    return Scaffold(
      key: _scaffoldKey,
      body:  Stack(
        fit: StackFit.expand,
        children: <Widget>[
            Container(
              decoration:  BoxDecoration(
                gradient:   LinearGradient(
                    colors: <Color>[
                      const Color(0xff19b395),
                      const Color(0xff19b395)                                ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
              ),
                child:  Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                     Opacity(
                      opacity: .1,
                      child:  Container(
                      width:MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                        decoration:  BoxDecoration(
                            image:  DecorationImage(
                                image:  AssetImage("assets/images/icon-background.png"),
                                repeat: ImageRepeat.repeat
                            )
                        ),
                      ),
                    ),
                        Column(  
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           Container(
                            width: 125,
                            height : 125,
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/logo.jpg")
                            ),

                          ),
                        ],
                      ),
                        Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child:  Align(
                          alignment: Alignment.bottomCenter,
                          child:  CircularProgressIndicator(),
                        ),
                      )
                   ])
             )
        ],
      )

    );
  }

}




