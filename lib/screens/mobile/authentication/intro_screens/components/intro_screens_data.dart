import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';
class IntroContent extends StatelessWidget {
  const IntroContent({
    Key key,
    this.subtext,
    this.text,
    this.image,
    this.bottomTxt,
    this.bottomSubTxt
  }) : super(key: key);
  final String subtext, image,text,bottomTxt,bottomSubTxt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          text,
          style: AppColors.kIntroTitleTextStyle,
        ),
        Text(
          subtext,
          textAlign: TextAlign.center,
          style: AppColors.kIntroSubTitleTextStyle,
        ),
        Spacer(flex: 3),
        SvgPicture.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(270),
        ),
        Spacer(flex: 3),
        Text(
          bottomTxt,
          style: AppColors.kIntroSubTitleTextStyle,
        ),
        Spacer(),
        Text(
          bottomSubTxt,
          textAlign: TextAlign.center,
          style: AppColors.kIntroTitleTextStyle,
        ),
      ],
    );
  }
}