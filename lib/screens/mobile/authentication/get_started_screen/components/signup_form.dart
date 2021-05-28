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

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  //region declaration of var to be used in form
  final _formKey = GlobalKey<FormState>();
  String password;
  String email;
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
            keyboardType: TextInputType.emailAddress,

            //region validation checks to avoid any mishappens
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
            //endregion

            hint: 'Email',
            svgPic: "assets/mobile/icons/user.svg",
            obsecureText: false,
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ . @ 0-9]"),
            ),
          ),
          //endregion

          SizedBox(
            height: SizeConfig.screenHeight * 0.019,
          ),

          //region textfield for firstname of user
          buildTextFormField(
            onChanged: (val) {},
            onValidate: (val) {},
            onSaved: (val) {},
            hint: 'first name',
            svgPic: "assets/mobile/icons/key.svg",
            obsecureText: false,
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ . @ 0-9]"),
            ),
          ),
          //endregion

          SizedBox(
            height: SizeConfig.screenHeight * 0.019,
          ),
          //region textfield for lastname of user
          buildTextFormField(
            onChanged: (val) {},
            onValidate: (val) {},
            onSaved: (val) {},
            hint: 'second name',
            svgPic: "assets/mobile/icons/key.svg",
            obsecureText: false,
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ . @ 0-9]"),
            ),
          ),
          //endregion

          SizedBox(
            height: SizeConfig.screenHeight * 0.019,
          ),
          //region textfield for password
          buildTextFormField(
              keyboardType: TextInputType.emailAddress,

              //region validation checks to avoid any mishappens
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
              onSaved: (val) => password = val,
              //endregion

              hint: 'password',
              svgPic: "assets/mobile/icons/key.svg",
              formatter: FilteringTextInputFormatter.allow(
                RegExp("[A-Z a-z _ . @ 0-9]"),
              ),
              obsecureText: true),
          //endregion

          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.019,
          ),
          //region button to create a account after checking validation
          button(context,
              lable: "Create an Account",
              colour: AppColors.authenticationBtnColors,
              colourText: Colors.black, press: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              // if all are valid then go to success screen

              RouteApp.instance.pushPage(context, LogInScreen());
            }
          }),
          //endregion
          SizedBox(
            height: SizeConfig.screenHeight * 0.019,
          ),
          dottedSeparation(),
          SizedBox(
            height: SizeConfig.screenHeight * 0.019,
          ),
          button(context,
              lable: "Log In",
              colour: AppColors.authenticationEndBtnColor,
              colourText: Colors.white,
              press: () => RouteApp.instance.pushPage(context, LogInScreen())),
        ],
      ),
    );
    //endregion
  }
}
