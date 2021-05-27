import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tranarc/components/authentication_textfield.dart';
import 'package:tranarc/components/default_button.dart';
import 'package:tranarc/screens/mobile/authentication/forgot_password/forgot_password_screen.dart';
import 'package:tranarc/screens/mobile/authentication/get_started_screen/create_account_screen.dart';
import 'package:tranarc/screens/mobile/authentication/intro_screens/intro_screens.dart';
import 'package:tranarc/screens/mobile/authentication/login/login_screen.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';
import 'package:tranarc/utils/push_route.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildTextFormField(
              onChanged: (val) {},
              onValidate: (val) {},
              hint: 'Email',
              svgPic: "assets/mobile/icons/user.svg",
              obsecureText: false),
          SizedBox(
            height: SizeConfig.screenHeight * 0.019,
          ),
          buildTextFormField(
              hint: 'password',
              svgPic: "assets/mobile/icons/key.svg",
              obsecureText: true),
          SizedBox(
            height: SizeConfig.screenHeight * 0.019,
          ),
          button(context,
              lable: "Log In",
              colour: AppColors.authenticationBtnColors,
              colourText: Colors.black,
              press: () => RouteApp.instance.pushPage(context, IntroScreen())),
          SizedBox(
            height: SizeConfig.screenHeight * 0.019,
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
            height: SizeConfig.screenHeight * 0.019,
          ),
          button(context,
              lable: "Create an Account",
              colour: AppColors.authenticationEndBtnColor,
              colourText: Colors.white,
              press: () => RouteApp.instance.pushPage(context, CreateAccountScreen())),
        ],
      ),
    );
  }
}
