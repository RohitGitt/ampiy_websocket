import 'package:ampiy/gen/assets.gen.dart';
import 'package:ampiy/ui/common/app_colors.dart';
import 'package:ampiy/ui/common/components/dump_widget.dart';
import 'package:ampiy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget buildCoinsItem(
    {required String title,
    required String description,
    required Color boxColor,
    String? price,
    String? percentage,
    bool showUpIcon = false,  
  }) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
      color: boxColor,
      border: Border.all(width: 1.5 , color: kcLightGrey),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(Assets.images.bitcoinImg.path),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(
                  title: title,
                  fontWeight: FontWeight.bold,
                  fontSize: secondaryFontSize),
              buildText(
                  title: description,
                  fontSize: primaryFontSize,
                  fontWeight: FontWeight.bold,
                  color: kcLightGrey)
            ],
          ),
        ),
        const SizedBox().expand(),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: buildText(title: price != null ? "Rs $price" : "N/A" ,),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: 2 , color: kcLightGrey),
            borderRadius: const BorderRadius.all(Radius.circular(5))
          ),
          child: Row(
            children: [
              showUpIcon == true ? const Icon(
                Icons.arrow_upward,
                color: kcGreen,
                size: 20,
              ) : const Icon(
                Icons.arrow_downward,
                color: Colors.green,
                size: 20,
              ),
              buildText(title: percentage != null ? "$percentage%" : "N/A" , color: kcGreen , fontWeight: FontWeight.bold)
            ],
          ),
        )
      ],
    ),
  ).box.make();
}
