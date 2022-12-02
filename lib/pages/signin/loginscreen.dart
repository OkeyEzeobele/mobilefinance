// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'package:o3_cards/models/login_request.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/ui/export.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../signup/signup.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
  }

  savecredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FvColors.offwhite,
      extendBody: true,
      body: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   child: Image.asset(
          //     "assets/topcurve.png",
          //     height: MediaQuery.of(context).size.height - 620,
          //     color: FvColors.maintheme
          //   ),
          // ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *0.6,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  "assets/bottomcurve.png",
                  // height: MediaQuery.of(context).size.height - 170,
                  // width: MediaQuery.of(context).size.width,
                  color: FvColors.maintheme,
                ),
              ),
            ),
          ),
          ProgressHUD(
            child: Form(
              key: globalFormKey,
              child: _loginUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
          ),
        ],
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: heightOfScreen *0.1
        ),
        SizedBox(
          height: heightOfScreen * 0.08,
          width: widthOfScreen * 0.5,
          child: Image.asset(
            "assets/CapitalLogoIcon_ImageView_46-190x110.png",
          ),
        ),
        SizedBox(
          height: heightOfScreen * 0.1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(
                color: FvColors.textview50FontColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            GestureDetector(
              child: Text(
                "Register",
                style: TextStyle(color: FvColors.maintheme),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Signupscreen(),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: heightOfScreen * 0.1,
        ),
        SizedBox(
          height: heightOfScreen * 0.08,
          width: widthOfScreen * 0.75,
          child: FormHelper.inputFieldWidget(
            context,
            "Email",
            "Email",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Email cannot be empty";
              } else if (!EmailValidator.validate(onValidateVal)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            (onSavedVal) {
              email = onSavedVal;
            },
            initialValue: '',
            validationColor: Colors.white,
            borderFocusColor: FvColors.maintheme,
            borderColor: Colors.white,
            backgroundColor: FvColors.edittext51Background,
            prefixIcon: const Icon(Icons.email_outlined),
            prefixIconColor: FvColors.maintheme,
            hintColor: FvColors.textview65FontColor,
            textColor: FvColors.textview70FontColor,
            showPrefixIcon: true,
            borderRadius: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            SizedBox(
              height: heightOfScreen * 0.08,
              width: widthOfScreen * 0.75,
              child: FormHelper.inputFieldWidget(
                context,
                "Password",
                "Password",
                (
                  onValidateVal,
                ) {
                  if (onValidateVal.isEmpty) {
                    return "Please enter password";
                  } else if (onValidateVal.length < 6) {
                    return "Password must have 6 or more characters ";
                  }
                  return null;
                },
                (onSavedVal) {
                  password = onSavedVal;
                },
                initialValue: '',
                validationColor: Colors.white,
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
                    setState(
                      () {
                        hidePassword = !hidePassword;
                      },
                    );
                  },
                ),
              ),
            ),
            // FlutterPwValidator(
            //   controller: _passwordController,
            //   minLength: 6,
            //   uppercaseCharCount: 1,
            //   numericCharCount: 1,
            //   specialCharCount: 1,
            //   width: 400,
            //   height: 150,
            //   onSuccess: () {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(
            //         content: Text("Password is matched"),
            //       ),
            //     );
            //   },
            //   onFail: () {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(
            //         content: Text("Password is not matched"),
            //       ),
            //     );
            //   },
            // )
          ],
        ),
        SizedBox(
          height: heightOfScreen * 0.05,
        ),
        FormHelper.submitButton(
          'Sign In',
          () {
            if (validateAndSave()) {
              setState(() {
                isAPIcallProcess = true;
              });
              LoginRequest model = LoginRequest(
                email: email!,
                password: password!,
              );

              APIService.login(model).then(
                (response) {
                  setState(() {
                    isAPIcallProcess = false;
                  });
                  if (response.success) {
                    APIService.getEmploymentDetails().then(
                      (val) {
                        if (val.success) {
                          APIService.getPersonalDetails().then(
                            (value) {
                              if (value.success) {
                                APIService.getUserInfo().then(
                                  (info) {
                                    if (info.success) {
                                      savecredentials();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Dashboard(
                                            pageIndex: 2,
                                          ),
                                        ),
                                      );
                                    } else {
                                      FormHelper.showSimpleAlertDialog(
                                        context,
                                        '',
                                        'There was an error. Please try again',
                                        'OK',
                                        () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }
                                  },
                                );
                              } else if (value.message ==
                                  "Personal Info not added yet") {
                                APIService.getUserInfo().then(
                                  (info) {
                                    if (info.success) {
                                      savecredentials();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Dashboard(
                                            pageIndex: 2,
                                          ),
                                        ),
                                      );
                                    } else {
                                      FormHelper.showSimpleAlertDialog(
                                        context,
                                        '',
                                        'There was an error. Please try again',
                                        'OK',
                                        () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }
                                  },
                                );
                              } else {
                                FormHelper.showSimpleAlertDialog(
                                  context,
                                  '',
                                  'There was an error. Please try again',
                                  'OK',
                                  () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              }
                            },
                          );
                        } else if (val.message ==
                            "Employer Info not added yet") {
                          APIService.getPersonalDetails().then(
                            (value) {
                              if (value.success) {
                                APIService.getUserInfo().then(
                                  (info) {
                                    if (info.success) {
                                      savecredentials();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Dashboard(
                                            pageIndex: 2,
                                          ),
                                        ),
                                      );
                                    } else {
                                      FormHelper.showSimpleAlertDialog(
                                        context,
                                        '',
                                        'There was an error. Please try again',
                                        'OK',
                                        () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }
                                  },
                                );
                              } else if (value.message ==
                                  "Personal Info not added yet") {
                                APIService.getUserInfo().then(
                                  (info) {
                                    if (info.success) {
                                      savecredentials();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Dashboard(
                                            pageIndex: 2,
                                          ),
                                        ),
                                      );
                                    } else {
                                      FormHelper.showSimpleAlertDialog(
                                        context,
                                        '',
                                        'There was an error. Please try again',
                                        'OK',
                                        () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }
                                  },
                                );
                              } else {
                                FormHelper.showSimpleAlertDialog(
                                  context,
                                  '',
                                  'There was an error. Please try again',
                                  'OK',
                                  () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              }
                            },
                          );
                        } else {
                          FormHelper.showSimpleAlertDialog(
                            context,
                            '',
                            'There was an error. Please try again',
                            'OK',
                            () {
                              Navigator.of(context).pop();
                            },
                          );
                        }
                      },
                    );
                  } else {
                    FormHelper.showSimpleAlertDialog(
                      context,
                      '',
                      response.message,
                      'OK',
                      () {
                        Navigator.of(context).pop();
                      },
                    );
                  }
                },
              );
            }
          },
          btnColor: FvColors.maintheme,
          borderColor: Colors.white,
          txtColor: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Forgot Password?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
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
