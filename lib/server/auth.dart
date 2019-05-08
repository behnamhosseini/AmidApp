import 'dart:convert';
import 'package:amid_app/pages/home_page.dart';
import 'package:amid_app/server/ngrok.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Auth{
  
    Future <Map> login(Map body,context) async{
    final response = await http.post('https://${Ngrok().ngrok}.ngrok.io/api/v1/login' ,body : body,headers: {'Accept':'application/json'},);
    var responseBody = json.decode(response.body);
    return responseBody;
    }

    Future <Map> signup(Map body,context) async{
    final response = await http.post('https://${Ngrok().ngrok}.ngrok.io/api/v1/register' ,body : body,headers: {'Accept':'application/json'},);
    var responseBody = json.decode(response.body);
  
    return responseBody;
    
    }

    Future<Map> logout(context)async{
      SharedPreferences check=await SharedPreferences.getInstance();
      check.remove('api_token');
      Navigator.of(context).pushNamed('/home'); 
    }
}

 Future<bool> checkApiToken(String apiToken,context) async {
    final response = await http.get('https://${Ngrok().ngrok}.ngrok.io/api/user?api_token=$apiToken' , headers: { 'Accept' : 'application/json'});
    var responseBody = json.decode(response.body);
    if(response.statusCode == 200){ 
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {return Directionality(child: HomePage(userData: responseBody['data'],), textDirection: TextDirection.rtl,);}));
    } else{
      Navigator.of(context).pushNamed('/home');
    }
  }


// class User{
//   String name;
//   String userName;
//   String level;
//   String api_token;
//   String role;
//   User({this.name,this.api_token,this.level,this.role,this.userName}); 
//   factory User.fromJson(Map json){
//     return User(api_token: json['api_token'],name: json['name'],level: json['level'],role: json['role'],userName: json['userName']);
//   }

// }
