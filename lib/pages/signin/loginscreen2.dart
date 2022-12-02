// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'package:o3_cards/models/login_request.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../constant/constant.dart';
import '../../models/local_auth.dart';
import '../../services/shared_service.dart';

class Loginscreen2 extends StatefulWidget {
  const Loginscreen2({Key? key}) : super(key: key);

  @override
  _Loginscreen2State createState() => _Loginscreen2State();
}

class _Loginscreen2State extends State<Loginscreen2> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? savedpassword;

  @override
  void initState() {
    super.initState();
    _autoLoginWithBio();
    _getSavedPassword();
  }

  String _firstname = '';
  String _savedemail = '';

  void _login(value) {
    setState(() {
      isAPIcallProcess = true;
    });
    LoginRequest model = LoginRequest(
      email: _savedemail,
      password: value,
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
                    } else if (value.message == "Personal Info not added yet") {
                      APIService.getUserInfo().then(
                        (info) {
                          if (info.success) {
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
              } else if (val.message == "Employer Info not added yet") {
                APIService.getPersonalDetails().then(
                  (value) {
                    if (value.success) {
                      APIService.getUserInfo().then(
                        (info) {
                          if (info.success) {
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
                    } else if (value.message == "Personal Info not added yet") {
                      APIService.getUserInfo().then(
                        (info) {
                          if (info.success) {
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

  _Loginscreen2State() {
    getTextFromFile().then(
      (val) => setState(
        () {
          _firstname = val;
        },
      ),
    );
    getEmailFromFile().then(
      (val) => setState(
        () {
          _savedemail = val;
        },
      ),
    );
  }
  void cleardata() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('password');
    prefs.remove('biometric');
  }

  void _getSavedPassword() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedpassword = prefs.getString('password') ?? '';
    });
  }

  void _loginWithBio() async {
    if (isbiometric) {
      final isAuthenticated = await LocalAuthApi.authenticate();
      if (isAuthenticated) {
        _login(savedpassword);
      }
    } else {
      FormHelper.showSimpleAlertDialog(
        context,
        '',
        'You have not enabled biometric login. Login and go to "more" to enable.',
        'OK',
        () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  void _autoLoginWithBio() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isbiometric = prefs.getBool('biometric') ?? false;
    });
    if (isbiometric) {
      final isAuthenticated = await LocalAuthApi.authenticate();

      if (isAuthenticated) {
        _login(savedpassword);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FvColors.offwhite,
      body: Stack(
        children: [
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
          height: heightOfScreen * 0.1,
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
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Good to see you again, ',
            style: TextStyle(
              color: FvColors.textview50FontColor,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: _firstname,
                style: TextStyle(
                  color: FvColors.textview50FontColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: heightOfScreen * 0.1,
        ),
        SizedBox(
          height: 10,
        ),
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
              icon:
                  Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
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
        SizedBox(
          height: heightOfScreen * 0.01,
        ),
        FormHelper.submitButton(
          'Sign In',
          () {
            if (validateAndSave()) {
              _login(password);
            }
          },
          btnColor: FvColors.maintheme,
          borderColor: Colors.white,
          txtColor: Colors.white,
        ),
        SizedBox(
          height: 40,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   'Not ' + _firstname + '? ',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     color: FvColors.textview50FontColor,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            GestureDetector(
              child: Text(
                'I am not ' + _firstname,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                SharedService.hardlogout(context);
                cleardata();
              },
            ),
          ],
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
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
                left: widthOfScreen * 0.01, top: heightOfScreen * 0.02),
            child: Center(
              child: GestureDetector(
                onTap: _loginWithBio,
                child: defaultTargetPlatform == TargetPlatform.android
                    ? Icon(
                        Icons.fingerprint,
                        color: FvColors.maintheme,
                        size: 48,
                      )
                    : SizedBox(
                        height: 48,
                        width: 48,
                        child: Image.asset(
                          "assets/face-id.png",
                          height: 23,
                          width: 23,
                        ),
                      ),
              ),
            ),
          ),
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

  Future<String> getTextFromFile() async {
    var userDetails = await SharedService.loginDetails();
    var name = userDetails!.payload!.user!.fullName;
    return name.substring(
      0,
      name.indexOf(' '),
    );
  }

  Future<String> getEmailFromFile() async {
    var userDetails = await SharedService.loginDetails();
    var savedEmail = userDetails!.payload!.user!.email;
    return savedEmail;
  }
}
