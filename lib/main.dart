import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranarc/screens/mobile/authentication/forgot_password/forgot_password_screen.dart';
import 'package:tranarc/screens/mobile/authentication/intro_screens/intro_screens.dart';
import 'package:tranarc/screens/mobile/authentication/login/login_screen.dart';
import 'package:tranarc/screens/mobile/authentication/reset_password/reset_password_screen.dart';
import 'package:tranarc/screens/mobile/selection_screen/select.dart';
import 'package:tranarc/theme.dart';

import 'screens/mobile/authentication/get_started_screen/create_account_screen.dart';
import 'screens/mobile/products/screens/landing_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //region Getx for state management
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      home: LandingPage(),
    );
    //endregion
  }
}
