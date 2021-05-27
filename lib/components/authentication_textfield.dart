import 'package:flutter/material.dart';
import 'package:tranarc/components/custom_prefix_icon.dart';
import 'package:tranarc/utils/constants/colors.dart';

TextFormField buildUsernameTextFormField(
    {Function onChanged,
    Function onValidate,
    TextEditingController myController,
    FocusNode focusNode,
    bool obsecureText}) {
  return TextFormField(
    obscureText: obsecureText,
    focusNode: focusNode,
    controller: myController,
    keyboardType: TextInputType.emailAddress,
    onChanged: onChanged,
    validator: onValidate,
    decoration: InputDecoration(
      hintText: 'First Name',
      filled: true,
      fillColor: Colors.white,
      hintStyle: AppColors.kTextfieldTextStyle,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefix: CustomPreffixIcon(
        svgIcon: "assets/mobile/icons/user.svg",
      ),
    ),
  );
}

TextFormField buildEmailTextFormField() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    onChanged: (val) {},
    validator: (val) {},
    decoration: InputDecoration(
      hintText: 'Email',
      filled: true,
      fillColor: Colors.white,
      hintStyle: AppColors.kTextfieldTextStyle,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefix: CustomPreffixIcon(
        svgIcon: "assets/mobile/icons/key.svg",
      ),
    ),
  );
}

TextFormField buildPasswordTextFormField() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    onChanged: (val) {},
    validator: (val) {},
    decoration: InputDecoration(
      hintText: 'Password',
      filled: true,
      fillColor: Colors.white,
      hintStyle: AppColors.kTextfieldTextStyle,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefix: CustomPreffixIcon(
        svgIcon: "assets/mobile/icons/key.svg",
      ),
    ),
  );
}
