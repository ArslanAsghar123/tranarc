import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranarc/utils/constants/colors.dart';

class WidgetProperties {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static void goToNextPage(BuildContext buildContext, Widget widget) {
    //Navigator.push(buildContext, RoutePage(builder: (buildContext) => widget));
    Navigator.push(
      buildContext,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => FadeTransition(opacity: a1, child: widget),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 300),
      ),
    );
  }

  static void goToNextPageWithReplacement(
      BuildContext buildContext, Widget widget) {
    Navigator.pushReplacement(
      buildContext,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => FadeTransition(opacity: a1, child: widget),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 1500),
      ),
    );
  }

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
  static enablePlatformOverrideForDesktop() {
    if (!kIsWeb &&
        (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
      debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
    }
  }

  static var textStyleInputFiled = TextStyle(
      height: 1,
      color: AppColors.activeIndex,
      fontWeight: FontWeight.w300,
      fontSize: 14.0);

  static Widget getDivider({Color color}) {
    return Divider(
      height: 1,
      color: color,
      thickness: 0.2,
    );
  }

  // static showLoader() {
  //   //Get.dialog(Loader(),useRootNavigator: true,barrierDismissible: false,barrierColor: Colors.grey.withOpacity(0.2));
  //   Get.generalDialog(
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return WillPopScope(
  //         onWillPop: () async => false,
  //         child: Loader(),
  //       );
  //     },
  //   );
  // }

  static closeLoader() {
    Get.back(canPop: true);
  }

  // static String utcTimeToString() {
  //   var dateUtc = DateTime.now().toUtc();
  //   var strToDateTime = DateTime.parse(dateUtc.toString());
  //   var newFormat = DateFormat("yyyy-MM-ddTHH:mm:00+00:00");
  //   String updatedDt = newFormat.format(strToDateTime);
  //   return updatedDt;
  // }
  //
  // static String customUtcTimeToString() {
  //   var f = DateFormat('EEE, d MMM yyyy HH:mm:00 ');
  //   String date = f.format(DateTime.now()) + "GMT";
  //   return date;
  // }
}
