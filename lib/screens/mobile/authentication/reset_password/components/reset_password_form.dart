import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:tranarc/components/authentication_textfield.dart';
import 'package:tranarc/components/default_button.dart';
import 'package:tranarc/screens/mobile/authentication/login/login_screen.dart';
import 'package:tranarc/screens/mobile/authentication/reset_password/reset_password_screen.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';
import 'package:tranarc/utils/push_route.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key key}) : super(key: key);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildTextFormField(
              onChanged: (val) {},
              onValidate: (val) {},
              hint: 'New password',
              svgPic: "assets/mobile/icons/key.svg",
              obsecureText: true),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          buildTextFormField(
              onChanged: (val) {},
              onValidate: (val) {},
              hint: 'Confirm New password',
              svgPic: "assets/mobile/icons/key.svg",
              obsecureText: true),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),

          button(context,
              lable: "Send password reset link",
              colour: AppColors.authenticationBtnColors,
              colourText: Colors.black,
              press: () => RouteApp.instance.pushPage(context, LogInScreen())),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
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
            height: SizeConfig.screenHeight * 0.03  ,
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
