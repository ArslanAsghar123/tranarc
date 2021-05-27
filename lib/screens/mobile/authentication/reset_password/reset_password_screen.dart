import 'package:flutter/material.dart';
import 'package:tranarc/screens/mobile/authentication/reset_password/components/body.dart';
import 'package:tranarc/utils/constants/colors.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppColors.kPrimaryGradientColor
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Body()
      ),
    );
  }
}
