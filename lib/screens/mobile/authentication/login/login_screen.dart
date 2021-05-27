import 'package:flutter/material.dart';
import 'package:tranarc/screens/mobile/authentication/login/components/body.dart';
import 'package:tranarc/utils/constants/colors.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.kPrimaryGradientColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Body(),
      ),
    );
  }
}
