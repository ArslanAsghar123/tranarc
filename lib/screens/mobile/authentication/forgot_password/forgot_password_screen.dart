import 'package:flutter/material.dart';
import 'package:tranarc/screens/mobile/authentication/forgot_password/components/body.dart';
import 'package:tranarc/utils/constants/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //region backgroud color of screen

      decoration: BoxDecoration(gradient: AppColors.kPrimaryGradientColor),

      //endregion

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Body(),
      ),
    );
  }
}
