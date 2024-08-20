import 'package:ampiy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildCircularButton(
    {required double width, required double height, void Function()? onTap}) {
  return InkWell(
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: kcWhite,
          borderRadius: BorderRadius.circular(height / 2),
          border: Border.all(width: 0.2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 1,
            ),
          ]),
      child: const Center(
        child: Icon(Icons.directions),
      ),
    ),
    onTap: () {
      if (onTap != null) {
        onTap();
      }
    },
  );
}
