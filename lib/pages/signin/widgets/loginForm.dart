// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:o3_cards/models/loginRequest.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/ui/pallete.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Form(
        key: globalFormKey,
        child: _loginUI(context),
      ),
      inAsyncCall: isAPIcallProcess,
      opacity: 0.3,
      key: UniqueKey(),
    );
  }

  Widget _loginUI(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
                left: widthOfScreen * 0.13, top: heightOfScreen * 0.08),
            child: SizedBox(
              height: heightOfScreen * 0.1,
              width: widthOfScreen * 0.75,
              child: FormHelper.inputFieldWidget(context, "Email", "Email",
                  (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Email cannot be Empty";
                }
                return null;
              }, (onSavedVal) {
                email = onSavedVal;
              },
                  borderFocusColor: FvColors.maintheme,
                  borderColor: Colors.white,
                  backgroundColor: FvColors.edittext51Background,
                  prefixIcon: const Icon(Icons.email_outlined),
                  prefixIconColor: FvColors.maintheme,
                  hintColor: FvColors.textview65FontColor,
                  textColor: FvColors.textview70FontColor,
                  showPrefixIcon: true,
                  borderRadius: 20),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: widthOfScreen * 0.13),
            child: SizedBox(
              height: heightOfScreen * 0.1,
              width: widthOfScreen * 0.75,
              child: FormHelper.inputFieldWidget(
                context,
                "Password",
                "Password",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "Email cannot be Empty";
                  }
                  return null;
                },
                (onSavedVal) {
                  email = onSavedVal;
                },
                borderFocusColor: FvColors.maintheme,
                backgroundColor: FvColors.edittext51Background,
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: FvColors.maintheme,
                borderColor: Colors.white,
                hintColor: FvColors.textview65FontColor,
                textColor: FvColors.textview70FontColor,
                borderRadius: 20,
                showPrefixIcon: true,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  color: FvColors.maintheme,
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        FormHelper.submitButton(
          'Sign In',
          () {
            if (validateAndSave()) {
              setState(() {
                isAPIcallProcess = true;
              });
              LoginRequest model =
                  LoginRequest(email: email!, password: password!);

              APIService.login(model).then((response) => {
                    if (response.success)
                      {
                        Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route)=>false),
                      }
                    else
                      {
                        FormHelper.showSimpleAlertDialog(
                            context, '', 'Invalid Username/Password', 'OK', () {
                          Navigator.pop(context);
                        })
                      }
                  });
            }
          },
          btnColor: FvColors.maintheme,
          borderColor: Colors.white,
          txtColor: Colors.white,
        )
      ],
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
