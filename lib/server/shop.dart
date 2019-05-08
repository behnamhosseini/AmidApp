import 'dart:convert';
import 'package:amid_app/server/ngrok.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
import 'dart:async';


class Shop{    
    Future <Map> getShops(scaffKey) async{
    try{
      final response = await http.get('https://${Ngrok().ngrok}.ngrok.io/api/v1/shopcategories',headers: {'Accept':'application/json'},);    
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


     Future<Map> getItemes(scaffKey,shopId) async{
      //  print(shopId);
    try{
    final response = await http.get('https://${Ngrok().ngrok}.ngrok.io/api/v1/shop/${shopId}',headers: {'Accept':'application/json'},);
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
}