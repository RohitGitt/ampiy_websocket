
import 'package:ampiy/gen/assets.gen.dart';
import 'package:ampiy/ui/common/components/dump_widget.dart';
import 'package:flutter/material.dart';

Widget buildNoDataWidget({String? title}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      buildText(title:  title ?? "No Data To Show" , fontSize: 15),
      Image.asset(Assets.images.noData.path , width: 200 , height: 100,)
 
    ],
  );
}