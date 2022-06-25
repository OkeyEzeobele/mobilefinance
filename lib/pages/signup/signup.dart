// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/pages/dashboard/dashboard.dart';
import '/models/loginRequest.dart';
import '/services/api_service.dart';
import '/ui/export.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

final Uri _url =
    Uri.parse('https://www.o3cards.com/terms_and_conditions_o3cards.pdf');

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FvColors.offwhite,
      body: Center(
        child: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _signupUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _signupUI(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            width: widthOfScreen * 0.3,
            height: heightOfScreen * 0.2,
            child:
                Image.asset("assets/CapitalLogoIcon_ImageView_46-190x110.png"),
          ),
        ),
        SizedBox(
          height: heightOfScreen * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.fitWidth,
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 14.0),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Already a user? ',
                    ),
                    TextSpan(
                      text: 'Sign in',
                      style: const TextStyle(
                        color: FvColors.maintheme,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Loginscreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.1,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              height: heightOfScreen * 0.065,
              child: FormHelper.inputFieldWidget(
                  context, "Username", "Username", (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Username cannot be empty";
                }
                return null;
              }, (onSavedVal) {
                email = onSavedVal;
              },
                  initialValue: '',
                  borderFocusColor: FvColors.maintheme,
                  borderColor: Colors.white,
                  backgroundColor: FvColors.edittext51Background,
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: FvColors.maintheme,
                  hintColor: FvColors.textview65FontColor,
                  textColor: FvColors.textview70FontColor,
                  showPrefixIcon: true,
                  borderRadius: 20,
                  multilineRows: 2),
            ),
            SizedBox(
              height: heightOfScreen * 0.065,
              width: widthOfScreen * 0.8,
              child: FormHelper.inputFieldWidget(context, "Email", "Email",
                  (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Email cannot be empty";
                } else if (!onValidateVal.contains('@')) {
                  return 'Please enter a valid email address';
                } else if (!onValidateVal.contains('.')) {
                  return 'Please enter a valid email address';
                }
                return null;
              }, (onSavedVal) {
                email = onSavedVal;
              },
                  initialValue: '',
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
            SizedBox(
              height: heightOfScreen * 0.065,
              width: widthOfScreen * 0.8,
              child: FormHelper.inputFieldWidget(
                context,
                "Password",
                "Password",
                (onValidateVal) {
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
                borderFocusColor: FvColors.maintheme,
                backgroundColor: FvColors.edittext51Background,
                prefixIcon: const Icon(Icons.key),
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
            SizedBox(
              height: heightOfScreen * 0.065,
              width: widthOfScreen * 0.8,
              child: FormHelper.inputFieldWidget(
                context,
                "Confirm password",
                "Confirm password",
                (onValidateVal) {
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
                borderFocusColor: FvColors.maintheme,
                backgroundColor: FvColors.edittext51Background,
                prefixIcon: const Icon(Icons.key),
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
            SizedBox(
              height: 30,
            ),
            FormHelper.submitButton(
              'Sign Up',
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
                      debugPrint('Response body: {$response}');
                      setState(() {
                        isAPIcallProcess = false;
                      });
                      if (response.success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                          ),
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
              height: 10,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 12.0),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'By signing up, you agree to our ',
                    ),
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: const TextStyle(
                        color: FvColors.maintheme,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _launchUrl,
                    ),
                  ],
                ),
              ),
            ),
          ],
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

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
