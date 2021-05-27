import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tranarc/components/custom_prefix_icon.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/size_config.dart';

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
      prefixIcon: Container(
        padding:  EdgeInsets.only(left: getProportionateScreenWidth(17),bottom: getProportionateScreenHeight(21),top: getProportionateScreenHeight(16)),
        child: CustomPreffixIcon(
          svgIcon: svgPic,


        ),
      ),
    ),
  );
}

