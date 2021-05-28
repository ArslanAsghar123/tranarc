import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../utils/constants/size_config.dart';

Row dottedSeparation() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
          width: SizeConfig.screenWidth * 0.35,
          child: DottedLine(
            dashColor: Colors.white,
          )),
      Text(
        "Or",
        style: TextStyle(color: Colors.white),
      ),
      Container(
          width: SizeConfig.screenWidth * 0.35,
          child: DottedLine(
            dashColor: Colors.white,
          ))
    ],
  );
}
