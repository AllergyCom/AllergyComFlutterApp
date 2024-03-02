import 'package:flutter/material.dart';

class PostBus {
  late String number;
  late String description;
  late String category;
  late String status;

  PostBus({ required this.number, required this.description, required this.category, required this.status});

  PostBus.fromJson(Map<dynamic, dynamic> json) {
    number = json['number'];
    description = json['description'];
    category = json['category'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['description'] = this.description;
    data['category'] = this.category;
    data['status'] = this.status;
    return data;
  }
}
