import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'screens/mobile/products/screens/landing_page.dart';

Future<void> main() async {
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
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          accentColor: Color(0xFFFF1E00)),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Lottie.asset(
            'assets/mobile/images/splash.json',
          ),
          splashIconSize: 200,
          nextScreen: LandingPage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white),
    );
    //endregion
  }
}
