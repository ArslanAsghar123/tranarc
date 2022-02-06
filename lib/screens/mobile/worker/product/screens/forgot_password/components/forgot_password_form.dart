
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:logger/logger.dart';
import 'package:tranarc/screens/mobile/product/components/custom_suffix_icon.dart';
import 'package:tranarc/screens/mobile/product/components/default_button.dart';
import 'package:tranarc/screens/mobile/product/components/no_account_text.dart';
import 'package:tranarc/screens/mobile/product/exceptions/firebaseauth/credential_actions_exceptions.dart';
import 'package:tranarc/screens/mobile/product/exceptions/firebaseauth/messeged_firebaseauth_exception.dart';
import 'package:tranarc/screens/mobile/product/services/authentification/authentification_service.dart';
import 'package:tranarc/screens/mobile/product/size_config.dart';

import '../../../constants.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailFieldController = TextEditingController();
  @override
  void dispose() {
    emailFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Send verification email",
            press: sendVerificationEmailButtonCallback,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailFieldController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Enter your email",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Future<void> sendVerificationEmailButtonCallback() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final String emailInput = emailFieldController.text.trim();
      bool resultStatus;
      String snackbarMessage;
      try {
        final resultFuture =
            AuthentificationService().resetPasswordForEmail(emailInput);
        resultFuture.then((value) => resultStatus = value);
        resultStatus = await showDialog(
          context: context,
          builder: (context) {
            return FutureProgressDialog(
              resultFuture,
              message: Text("Sending verification email"),
            );
          },
        );
        if (resultStatus == true) {
          snackbarMessage = "Password Reset Link sent to your email";
        } else {
          throw FirebaseCredentialActionAuthUnknownReasonFailureException(
              message:
                  "Sorry, could not process your request now, try again later");
        }
      } on MessagedFirebaseAuthException catch (e) {
        snackbarMessage = e.message;
      } catch (e) {
        snackbarMessage = e.toString();
      } finally {
        Logger().i(snackbarMessage);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarMessage),
          ),
        );
      }
    }
  }
}
