import 'package:flutter/material.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';

Widget button(
  BuildContext context, {
 @required String lable,
 @required Color colour,
      Color colourText,
     @required Function press
}) {
  return GestureDetector(
   onTap: press,
    child: Container(
      height: SizeConfig.screenHeight * 0.09,
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(35)),
      width: MediaQuery.of(context).size.width - 48,
      alignment: Alignment.center,
      child: Text(lable, style: TextStyle(fontFamily: 'Lato',
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: colourText)),
    ),
  );
}
