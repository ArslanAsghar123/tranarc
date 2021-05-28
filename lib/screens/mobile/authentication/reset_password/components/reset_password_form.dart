import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tranarc/components/authentication_textfield.dart';
import 'package:tranarc/components/default_button.dart';
import 'package:tranarc/components/dotted_separation.dart';
import 'package:tranarc/components/form_error.dart';
import 'package:tranarc/screens/mobile/authentication/login/login_screen.dart';
import 'package:tranarc/utils/constants/colors.dart';
import 'package:tranarc/utils/constants/constants.dart';
import 'package:tranarc/utils/constants/size_config.dart';
import 'package:tranarc/utils/push_route.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key key}) : super(key: key);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTextFormField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              return null;
            },
            onValidate: (value) {
              if (value.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return "";
              }
              return null;
            },
            onSaved: (value) => password = value,
            hint: 'New password',
            svgPic: "assets/mobile/icons/key.svg",
            obsecureText: true,
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ . @ 0-9]"),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          buildTextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              return null;
            },
            onValidate: (value) {
              if (value.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return "";
              }
              return null;
            },
            onSaved: (value) => password = value,
            hint: 'Confirm New password',
            svgPic: "assets/mobile/icons/key.svg",
            obsecureText: true,
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ . @ 0-9]"),
            ),
          ),
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          button(context,
              lable: "Send password reset link",
              colour: AppColors.authenticationBtnColors,
              colourText: Colors.black,
              press: () {}),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          dottedSeparation(),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          button(context,
              lable: "Back to Sign In",
              colour: AppColors.authenticationEndBtnColor,
              colourText: Colors.white, press: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              // if all are valid then go to success screen

              RouteApp.instance.pushPage(context, LogInScreen());
            }
          }),
        ],
      ),
    );
  }
}
