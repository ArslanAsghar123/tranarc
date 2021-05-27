import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteApp {
  static final RouteApp _instance = RouteApp._internal();

  static RouteApp instance = RouteApp();

  factory RouteApp() {
    return _instance;
  }

  RouteApp._internal() {
    // TODO: add init logic if needed
    // FOR EXAMPLE API parameters
  }

  pushPage(BuildContext context, Widget nextPage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
  }
}
