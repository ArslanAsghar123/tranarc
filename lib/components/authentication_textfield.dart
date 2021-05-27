import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tranarc/components/custom_prefix_icon.dart';
import 'package:tranarc/utils/constants/colors.dart';

TextFormField buildTextFormField(
    {
      String hint,
      String svgPic,
      Function onChanged,
    Function onValidate,
    TextEditingController myController,
    TextInputFormatter formatter,

    bool obsecureText,
    Function onSaved,
      int maxLength}) {
  return TextFormField(
    obscureText: obsecureText,

    inputFormatters: <TextInputFormatter>[formatter],
    controller: myController,
    keyboardType: TextInputType.emailAddress,
    onSaved: onSaved,
    onChanged: onChanged,
    maxLength: maxLength,
    validator: onValidate,
    decoration: InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      hintStyle: AppColors.kTextfieldTextStyle,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: CustomPreffixIcon(
        svgIcon: svgPic,


      ),
    ),
  );
}

// TextFormField buildEmailTextFormField() {
//   return TextFormField(
//     keyboardType: TextInputType.emailAddress,
//     onChanged: (val) {},
//     validator: (val) {},
//     decoration: InputDecoration(
//       hintText: 'Email',
//       filled: true,
//       fillColor: Colors.white,
//       hintStyle: AppColors.kTextfieldTextStyle,
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       prefix: CustomPreffixIcon(
//         svgIcon: "assets/mobile/icons/key.svg",
//       ),
//     ),
//   );
// }
//
// TextFormField buildPasswordTextFormField() {
//   return TextFormField(
//     keyboardType: TextInputType.emailAddress,
//     onChanged: (val) {},
//     validator: (val) {},
//     decoration: InputDecoration(
//       hintText: 'Password',
//       filled: true,
//       fillColor: Colors.white,
//       hintStyle: AppColors.kTextfieldTextStyle,
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       prefix: CustomPreffixIcon(
//         svgIcon: "assets/mobile/icons/key.svg",
//       ),
//     ),
//   );
// }
