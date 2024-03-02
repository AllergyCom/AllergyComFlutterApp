import 'package:flutter/material.dart';

class ModelRecipe{
  late String title;
   late String url;
   late String imgUrl;
   late String des;

  ModelRecipe(this.title, this.url, this.imgUrl, this.des);
  ModelRecipe.fromJson(Map<dynamic,dynamic> json){
    title=json['title'] ?? "";
    url=json['url'] ?? "";
    imgUrl=json['img'] ?? "";
    des=json['des'] ?? "";
  }
}