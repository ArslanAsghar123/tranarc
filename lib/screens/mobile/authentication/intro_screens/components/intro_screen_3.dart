import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';

class Body3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.06,
              ),
              Center(
                child: Text(
                  'Welcome to',
                  style: AppColors.kIntroTitleTextStyle,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.01,
              ),
              Text(
                "Transarc!",
                style: AppColors.kIntroSubTitleTextStyle,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.09,
              ),
              SvgPicture.asset('assets/mobile/images/intro_screen3.svg'),
            ],
          ),
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/mobile/images/vector-1.svg",
              alignment: Alignment.bottomLeft,
            ),
          ),
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/mobile/images/vector.svg",
              alignment: Alignment.bottomLeft,
            ),
          ),
        ],
      ),
    );
  }
}
