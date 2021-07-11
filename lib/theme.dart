
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData theme(BuildContext context) {
  return ThemeData(
  // appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      ),
      accentColor: Color(0xFFFF1E00)
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(35),
    borderSide: BorderSide(color: Color(0xff0D3552)),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.all(25),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}


// AppBarTheme appBarTheme() {
//   return AppBarTheme(
//     color: Colors.white,
//     elevation: 0,
//     brightness: Brightness.light,
//     iconTheme: IconThemeData(color: Colors.black),
//     textTheme: TextTheme(
//       headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
//     ),
//   );
// }
