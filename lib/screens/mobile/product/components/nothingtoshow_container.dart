
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranarc/screens/mobile/product/constants.dart';
import 'package:tranarc/screens/mobile/product/size_config.dart';

class NothingToShowContainer extends StatelessWidget {
  final String iconPath;
  final String primaryMessage;
  final String secondaryMessage;

  const NothingToShowContainer({
    Key key,
    this.iconPath = "assets/icons/empty_box.svg",
    this.primaryMessage = "Nothing to show",
    this.secondaryMessage = "",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.75,
      height: SizeConfig.screenHeight * 0.2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              color: kTextColor,
              width: getProportionateScreenWidth(75),
            ),
            SizedBox(height: 16),
            Text(
              "$primaryMessage",
              style: TextStyle(
                color: kTextColor,
                fontSize: 15,
              ),
            ),
            Text(
              "$secondaryMessage",
              style: TextStyle(
                color: kTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
