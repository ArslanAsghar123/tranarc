import 'package:flutter/material.dart';
import 'package:tranarc/utils/constants/colors.dart';

import 'components/body.dart';




class ProductScreen extends StatefulWidget {

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
