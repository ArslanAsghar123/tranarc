import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tranarc/components/authentication_textfield.dart';
import 'package:tranarc/components/default_button.dart';
import 'package:tranarc/screens/mobile/authentication/login/login_screen.dart';
import 'package:tranarc/screens/mobile/authentication/reset_password/reset_password_screen.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';
import 'package:tranarc/utils/push_route.dart';

class ForgotpasswordForm extends StatefulWidget {
  const ForgotpasswordForm({Key key}) : super(key: key);

  @override
  _ForgotpasswordFormState createState() => _ForgotpasswordFormState();
}

class _ForgotpasswordFormState extends State<ForgotpasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildTextFormField(
              onChanged: (val) {},
              onValidate: (val) {},
              hint: 'Enter registered Email ID',
              svgPic: "assets/mobile/icons/user.svg",
              obsecureText: false),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          button(context,
              lable: "Send password reset link",
              colour: AppColors.authenticationBtnColors,
              colourText: Colors.black,
              press: () =>
                  RouteApp.instance.pushPage(context, ResetPasswordScreen())),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Row(
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
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          button(context,
              lable: "Back to Sign In",
              colour: AppColors.authenticationEndBtnColor,
              colourText: Colors.white,
              press: () {}),
        ],
      ),
    );
  }
}
