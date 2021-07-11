import 'package:flutter/material.dart';
import 'package:tranarc/utils/constants/colors.dart';

import 'components/body.dart';


class SelectScreen extends StatefulWidget {

  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
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
