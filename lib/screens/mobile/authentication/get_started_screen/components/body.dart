import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranarc/screens/mobile/authentication/get_started_screen/components/login_form.dart';
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
          vertical: getProportionateScreenHeight(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset('assets/mobile/images/get_started.svg'),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              Text(
                'Hi there!',
                style: AppColors.kTitleTextStyle,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.01,
              ),
              Text(
                "Let's Get Started",
                style: AppColors.kSubTitleTextStyle,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
