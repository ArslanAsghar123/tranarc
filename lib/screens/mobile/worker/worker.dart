import 'package:flutter/material.dart';
import 'package:tranarc/utils/constants/colors.dart';

import 'components/body.dart';



class WorkerScreen extends StatefulWidget {

  @override
  _WorkerScreenState createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
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
