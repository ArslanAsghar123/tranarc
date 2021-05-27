import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';

class CustomPreffixIcon extends StatelessWidget {
  const CustomPreffixIcon({
    Key key,
    @required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
      child: SvgPicture.asset(
        svgIcon,
        alignment: Alignment.bottomCenter,
         height: 5,
        width: 5,
        color: AppColors.textfieldIconColor,
      ),
    );
  }
}
