import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String imgPath;
  final Color txtColor;
  const Category({required this.id,required this.title,this.color = Colors.orange, this.imgPath = 'assets/images/asian.jpg',this.txtColor = Colors.black});
}