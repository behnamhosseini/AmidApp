import 'dart:convert';
import 'package:amid_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Post{
    Future <Map> getPosts(scaffKey) async{
    try{
    final response = await http.get('https://5bdd476d.ngrok.io/api/v1/posts',headers: {'Accept':'application/json'},);    
    var responseBody = json.decode(response.body);
      if(response.statusCode == 200){
        return responseBody;
      }else{
        scaffKey.currentState.showSnackBar(
          SnackBar(content: Text('اتصال به سرور موقتا مقدور نمیباشد'),) 
        );  
       }
    }catch (e) {
       scaffKey.currentState.showSnackBar(
          SnackBar(content: Text('اتصال به سرور موقتا مقدور نمیباشد'),) 
       );
    }
    }


    Future like(post_id) async{
      SharedPreferences apiToken=await SharedPreferences.getInstance();
      String _apiToken=apiToken.get('api_token');
      final response=await http.get('https://5bdd476d.ngrok.io/api/v1/post/${post_id}/like?api_token=${_apiToken}',headers: {'Accept':'application/json'},);
       var responsBody=jsonDecode(response.body);
    }

    Future deletePost(post_id) async{
      SharedPreferences apiToken=await SharedPreferences.getInstance();
      String _apiToken=apiToken.get('api_token');
      final response=await http.delete('https:///5bdd476d.ngrok.io/api/v1/posts/${post_id}/?api_token=${_apiToken}',headers: {'Accept':'application/json'},);
       var responsBody=jsonDecode(response.body);
      //  print(response.statusCode);      
       return response.statusCode;
 
    }

    Future updatePost(post_id, body) async{
      SharedPreferences apiToken=await SharedPreferences.getInstance();
      String _apiToken=apiToken.get('api_token');
      final response=await http.put('https://5bdd476d.ngrok.io/api/v1/posts/${post_id}/?api_token=${_apiToken}', 
        body: {'body' : body},
        headers: {'Accept':'application/json'},
      );
       var responsBody=jsonDecode(response.body);
      //  return 
      //  print(responsBody);      
       return response.statusCode;
 
    }
}