import 'package:amid_app/animations/singin_animation.dart';
import 'package:amid_app/components/Form.dart';
import 'package:amid_app/pages/home_page.dart';
import 'package:amid_app/server/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:shared_preferences/shared_preferences.dart';



class LoginBody extends StatefulWidget{
  GlobalKey<ScaffoldState> scaffoldKey;
  LoginBody({this.scaffoldKey});
  @override
  State<StatefulWidget> createState() {
    return LoginBodyState();
  }
    
}

class LoginBodyState extends State<LoginBody> with SingleTickerProviderStateMixin{
  AnimationController _loginButtonController;
  final _formKey = GlobalKey<FormState>();
  String _userName;
  String _password;


  emailOnSaved(String value) {
    _userName = value;
  }

  passwordOnSaved(String value) {
    _password = value;
  }

  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(vsync: this , duration: new Duration(milliseconds: 3000));
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
                Text(''),
                  new FormContainer(
                  formKey : _formKey,
                  emailOnSaved : emailOnSaved,
                  passwordOnSaved : passwordOnSaved
                ),
                GestureDetector(
              onTap: () async {
                if(_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  sendDataForLogin();
                }
              },
              child: new SingInAnimation(
                controller: _loginButtonController.view,
                text:Text(
                      "ورود",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'IranSans',
                          fontWeight: FontWeight.w300,
                          letterSpacing: .3
                      ),
                    ),
              ),
            )
      ],
    );
  }
    sendDataForLogin() async {
      await _loginButtonController.animateTo(0.150);
      Map response = await (new Auth()).login({"userName" : _userName  , "password" : _password },context);
      if(response['data'].containsKey('statusCode')) {
        await storeUserData(response['data']);
        await _loginButtonController.forward();
        Navigator.of(context)
        .pushReplacement(CupertinoPageRoute(
                             builder: (BuildContext context) {
                                return Directionality(child: HomePage(userData: response['data']), textDirection: TextDirection.rtl,);}));
      } else {
        await _loginButtonController.reverse();
        widget.scaffoldKey.currentState.showSnackBar(
          new SnackBar(
            content: new Text(
              response['data']['error'],
              style: new TextStyle(fontFamily: 'Vazir'),
            )
          )
        );
      }
  }

  storeUserData(Map userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('api_token', userData['api_token']);
  }

}



class RegisterBody extends StatefulWidget{
  GlobalKey<ScaffoldState> scaffoldKey;

  RegisterBody({this.scaffoldKey});
  @override
  State<StatefulWidget> createState() {
    return RegisterBodyState();
  }
    
}

class RegisterBodyState extends State<RegisterBody>with SingleTickerProviderStateMixin{
  AnimationController _loginButtonController;
  final _formKey = GlobalKey<FormState>();
  String _userName;
  String _password;
  String _name;
  
  nameOnSaved(String value) {
    _name = value;
  }

  emailOnSaved(String value) {
    _userName = value;
  }

  passwordOnSaved(String value) {
    _password = value;
  }

  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(vsync: this , duration: new Duration(milliseconds: 3000));
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
                Text(''),
                new FormContainer(
                  formKey : _formKey,
                  emailOnSaved : emailOnSaved,
                  passwordOnSaved : passwordOnSaved,
                  nameOnSaved : nameOnSaved,
                  type : 'signup'
                ),
            new GestureDetector(
              onTap: () async {
                if(_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  sendDataForSignup();
                }
              },
              child: new SingInAnimation(
                controller: _loginButtonController.view,
                text: Text(
                      "عضویت",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'IranSans',
                          fontWeight: FontWeight.w300,
                          letterSpacing: .3
                      ),
                    )
              ),
            )
      ],
    );
  }
    sendDataForSignup() async {
      await _loginButtonController.animateTo(0.150);
      Map response = await (new Auth()).signup({"name" : _name  ,"userName" : _userName  , "password" : _password },context);
      if(response['statusCode'] == 200) {
        await storeUserData(response['data']);
        await _loginButtonController.forward();
        Navigator.of(context)
        .pushReplacement(CupertinoPageRoute(
                             builder: (BuildContext context) {
                                return Directionality(child: HomePage(userData: response['data']), textDirection: TextDirection.rtl,);}));
      } else {
        await _loginButtonController.reverse();
        widget.scaffoldKey.currentState.showSnackBar(
          new SnackBar(
            content: new Text(
              response['data'],
              style: new TextStyle(fontFamily: 'Vazir'),
            )
          )
        );
      }
  }

  storeUserData(Map userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('api_token', userData['api_token']);
    await prefs.setString('user_id', userData['id']);
  }

}


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginPageState();

}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin { 
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentBody=0;
  @override
  Widget build(BuildContext context) {
    timeDilation = .4;
    var page = MediaQuery.of(context).size;
    return new Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new  LinearGradient(
              colors: <Color>[
                const Color(0xff19b395),
                const Color(0xff2980b9)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
        ),
        child: new Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            new Opacity(
              opacity: .1,
              child: new Container(
                width: page.width,
                height: page.height,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage("assets/images/icon-background.png"),
                        repeat: ImageRepeat.repeat
                    )
                ),
              ),
            ),
            _currentBody == 0 
            ? LoginBody(scaffoldKey : _scaffoldKey)
            : RegisterBody(scaffoldKey : _scaffoldKey)      

            ,_currentBody == 0 
            ?GestureDetector(
              child: Padding(
               padding: const EdgeInsets.only(bottom: 10),
               child: Text('عضویت',style: TextStyle(fontFamily: 'IranSans',color: Colors.white,),), 
               ),
               onTap:(){
                  setState(() {
                    _currentBody=1;                    
                  });
               },

            )
            :GestureDetector(child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('ورود',style: TextStyle(fontFamily: 'IranSans',color: Colors.white,),),
              ),
              onTap:(){
                  setState(() {
                    _currentBody=0;                    
                  });
               },
            )
            ],
        ),
      ) ,
    );
  }

}
