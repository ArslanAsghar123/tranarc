import 'package:flutter/material.dart';
import 'package:tranarc/screens/mobile/authentication/get_started_screen/components/body.dart';
import 'package:tranarc/utils/constants/colors.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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
