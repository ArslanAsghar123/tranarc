import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranarc/screens/mobile/authentication/forgot_password/components/forgot_password_form.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

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
                height: SizeConfig.screenHeight * 0.08,
              ),
              Text("Forgot Password", style: AppColors.kSubTitleTextStyle,),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              ForgotpasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
