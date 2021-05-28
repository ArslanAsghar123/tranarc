import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tranarc/components/authentication_textfield.dart';
import 'package:tranarc/components/default_button.dart';
import 'package:tranarc/components/dotted_separation.dart';
import 'package:tranarc/components/form_error.dart';
import 'package:tranarc/screens/mobile/authentication/login/login_screen.dart';
import 'package:tranarc/screens/mobile/authentication/reset_password/reset_password_screen.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/constants.dart';
import 'package:tranarc/utils/constants/size_config.dart';
import 'package:tranarc/utils/push_route.dart';

class ForgotpasswordForm extends StatefulWidget {
  const ForgotpasswordForm({Key key}) : super(key: key);

  @override
  _ForgotpasswordFormState createState() => _ForgotpasswordFormState();
}

class _ForgotpasswordFormState extends State<ForgotpasswordForm> {
  //region declaration of var to be used in form

  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

//endregion

  @override
  Widget build(BuildContext context) {
    //region main form
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //region main textfield for email

          buildTextFormField(
            //region validation checks to avoid any mishappens

            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return null;
            },
            onValidate: (value) {
              if (value.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "";
              }
              return null;
            },
            hint: 'Enter registered Email ID',
            svgPic: "assets/mobile/icons/user.svg",
            obsecureText: false,
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ . @ 0-9]"),
            ),
            //endregion
          ),
          //endregion
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          //region button to Send password reset link after checking validation

          button(context,
              lable: "Send password reset link",
              colour: AppColors.authenticationBtnColors,
              colourText: Colors.black, press: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              // if all are valid then go to success screen

              RouteApp.instance.pushPage(context, ResetPasswordScreen());
            }
          }),
          //endregion
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          dottedSeparation(),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          button(context,
              lable: "Back to Sign In",
              colour: AppColors.authenticationEndBtnColor,
              colourText: Colors.white,
              press: () {}),
        ],
      ),
    );
    //endregion
  }
}
