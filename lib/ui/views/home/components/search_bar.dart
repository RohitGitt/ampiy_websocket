
import 'package:ampiy/ui/common/app_colors.dart';
import 'package:ampiy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

Widget buildSearchBar({ TextEditingController? controller , FocusNode? focusNode , double? height ,  String? hintText ,void Function(String)? onChanged , Widget? suffixIcon , void Function()? onSearchTab}){
  return Container(
    height:height?? 40,
    child: TextField(
      
      controller: controller,
      focusNode: focusNode,
      maxLines: 1,
      onChanged: onChanged,
      keyboardType:TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText ?? "Search",
        contentPadding: const EdgeInsets.only(left: 20),
        hintStyle: const TextStyle(fontWeight: FontWeight.bold , color: kcLightGrey , fontSize: secondaryFontSize),
        suffixIcon: suffixIcon ?? IconButton(onPressed: (){ if(onSearchTab != null){ onSearchTab();}}, icon: const Icon(Icons.search)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.blue , width: 2)
        )
      ),
    
    ),
  );
}