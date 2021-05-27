import 'package:flutter/material.dart';
import 'package:tranarc/screens/mobile/authentication/intro_screens/components/body.dart';
import 'package:tranarc/utils/constants/colors.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppColors.kSecondaryGradientColor
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Body(),
      ),
    );
  }
}
