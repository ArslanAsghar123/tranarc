import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteAppReplacement {
  static final RouteAppReplacement _instance = RouteAppReplacement._internal();

  static RouteAppReplacement instance = RouteAppReplacement();

  factory RouteAppReplacement() {
    return _instance;
  }

  RouteAppReplacement._internal() {
    // TODO: add init logic if needed
    // FOR EXAMPLE API parameters
  }

  pushPage(BuildContext context, Widget nextPage) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => nextPage));
  }
}
