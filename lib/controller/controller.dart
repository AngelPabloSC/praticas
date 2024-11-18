import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/prueba.dart';

class Controller{

  Future<Prueba?> getPosts(int offset,int limit)async{
   try{
     var res = await  http.get(Uri.parse("https://api.slingacademy.com/v1/sample-data/photos?offset=$offset&limit=$limit"));

     var data = jsonDecode(res.body);
     var model = pruebaFromJson(res.body);
     //var list = data['photos'];//
     // var list = (jsonDecode(res.body) as List<dynamic>).cast();
     //print(list);
     return model;
   }catch(err){
     print(err);
   }
   return null;
  }

}