
import 'package:flutter/material.dart';
import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'package:o3_cards/models/loginRequest.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: FvColors.offwhite,
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ));
  }

  Widget _loginUI(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 0,
            ),
            child: SizedBox(
              height: heightOfScreen * 0.08,
              width: widthOfScreen * 0.5,
              child: Image.asset(
                  "assets/CapitalLogoIcon_ImageView_46-190x110.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: EdgeInsets.only(
                  left: widthOfScreen * 0.04, top: heightOfScreen * 0.08),
              // ignore: prefer_const_constructors
              child: FittedBox(
                fit: BoxFit.fitWidth,
                // ignore: prefer_const_constructors
                child: Text("Don't have an account? Register",
                    textAlign: TextAlign.left,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: FvColors.textview50FontColor,
                      fontWeight: FontWeight.w400,
                    )),
              )),
        ),
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
                  return "Email cannot be empty";
                } else if (!onValidateVal.contains('@')) {
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

        Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.only(
                  left: widthOfScreen * 0.355, top: heightOfScreen * 0.02),
              // ignore: prefer_const_constructors
              child: Text(
                "Forgot Password?",
                textAlign: TextAlign.center,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: FvColors.maintheme,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ),
        // ignore: prefer_const_constructors
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
                left: widthOfScreen * 0.01, top: heightOfScreen * 0.02),
            child: SizedBox(
              height: heightOfScreen * 0.1,
              width: widthOfScreen * 0.3,
              child: FittedBox(
                child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.fingerprint),
                    color: FvColors.maintheme,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Useronboardingscreen2(),
                        ),
                      );
                    }),
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
}
