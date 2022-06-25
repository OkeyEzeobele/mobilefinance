// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'package:o3_cards/models/loginRequest.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

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

  @override
  void initState() {
    super.initState();
  }

  String _firstname = '';
  String _savedemail = '';

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
                email: _savedemail,
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
          height: 20,
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
                'I am not '+ _firstname,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: FvColors.maintheme,
                ),
              ),
              onTap: () {
                SharedService.logout(context);
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
            color: FvColors.maintheme,
            fontWeight: FontWeight.w400,
          ),
        ),
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
                  },
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
