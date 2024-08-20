
import 'package:flutter/material.dart';

Widget buildText({ required String title , Color? color , double? fontSize , FontWeight? fontWeight}){
  return Text(title , style: TextStyle( color: color ?? Colors.black,  fontWeight:fontWeight ?? FontWeight.normal , fontSize: fontSize ?? 15),);
}