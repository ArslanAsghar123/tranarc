import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(30),

        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset('assets/mobile/images/login.svg'),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              Text(
                'Welcome Back!',
                style: AppColors.kTitleTextStyle,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.01,
              ),
              Text("Please Log In", style: AppColors.kSubTitleTextStyle,)
            ],
          ),
        ),
      ),
    );
  }
}
