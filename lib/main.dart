import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranarc/screens/mobile/authentication/forgot_password/forgot_password_screen.dart';
import 'package:tranarc/screens/mobile/authentication/intro_screens/intro_screens.dart';
import 'package:tranarc/screens/mobile/authentication/login/login_screen.dart';
import 'package:tranarc/screens/mobile/authentication/reset_password/reset_password_screen.dart';
import 'package:tranarc/theme.dart';

import 'screens/mobile/authentication/get_started_screen/create_account_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //region Getx for state management
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: CreateAccountScreen(),
    );
    //endregion
  }
}
