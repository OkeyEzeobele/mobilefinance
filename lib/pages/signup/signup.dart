// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/signup_request.dart';
import '/pages/dashboard/dashboard.dart';
import '/services/api_service.dart';
import '/ui/export.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

final Uri _url =
    Uri.parse('https://www.o3cards.com/terms_and_conditions_o3cards.pdf');

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String email = '';
  String password = '';
  String phone = '';
  String? passwordConfirm;
  String dob = '';
  final TextEditingController _controller = TextEditingController();
  final _phoneController = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  final today = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  bool has8char = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasnumber = false;
  bool hasSpecialChar = false;
  RegExp regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-%><:;.,!@#/$&*~]).{8,}$');
  final numericRegex = RegExp(r'[0-9]');
  final uppercaseRegex = RegExp(r'[A-Z]');
  final lowercaseRegex = RegExp(r'[a-z]');
  final specialRegex = RegExp(r'[-%><:;.,!@#/$&*~]');
  _onPasswordChanged(text) {
    setState(() {
      password = text;
      has8char = false;
      if (text.length >= 8) {
        has8char = true;
      }
      hasnumber = false;
      if (numericRegex.hasMatch(text)) {
        hasnumber = true;
      }
      hasUpperCase = false;
      if (uppercaseRegex.hasMatch(text)) {
        hasUpperCase = true;
      }
      hasLowerCase = false;
      if (lowercaseRegex.hasMatch(text)) {
        hasLowerCase = true;
      }
      hasSpecialChar = false;
      if (specialRegex.hasMatch(text)) {
        hasSpecialChar = true;
      }
    });
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
            child: SingleChildScrollView(child: _signupUI(context)),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
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
              height: heightOfScreen * 0.02,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              // height: heightOfScreen * 0.06,
              child: TextFormField(
                onChanged: (text) {
                  firstName = text;
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value[0] == '0') {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                // textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: heightOfScreen * 0.01,
                  ),
                  filled: true,
                  fillColor: FvColors.edittext51Background,
                  focusColor: FvColors.textview65FontColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.maintheme,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  hintText: 'First Name',
                  hintStyle: TextStyle(
                    color: FvColors.textview65FontColor,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: FvColors.maintheme,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.02,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              // height: heightOfScreen * 0.075,
              child: TextFormField(
                onChanged: (text) {
                  lastName = text;
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value[0] == '0') {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                // textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: heightOfScreen * 0.01,
                  ),
                  filled: true,
                  fillColor: FvColors.edittext51Background,
                  focusColor: FvColors.textview65FontColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.maintheme,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  hintText: 'Last Name',
                  hintStyle: TextStyle(
                    color: FvColors.textview65FontColor,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: FvColors.maintheme,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.02,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              // height: heightOfScreen * 0.075,
              child: TextFormField(
                // onChanged: (text) {
                //   dob = text;
                // },
                validator: (value) {
                  if (dob.isEmpty) {
                    return 'Please select your date of birth';
                  }
                  return null;
                },
                readOnly: true,
                keyboardType: TextInputType.none,
                // textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: heightOfScreen * 0.01,
                  ),
                  filled: true,
                  fillColor: FvColors.edittext51Background,
                  focusColor: FvColors.textview65FontColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.maintheme,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  hintText: dob.isEmpty ? 'Date of Birth' : dob,
                  hintStyle: TextStyle(
                    color: FvColors.textview65FontColor,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: FvColors.edittext51Background,
                  ),
                  suffixIcon: IconButton(
                    color: FvColors.maintheme,
                    icon: Icon(
                      Icons.date_range,
                    ),
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 1, 1),
                        maxTime: DateTime(today.year, today.month, today.day),
                        theme: const DatePickerTheme(
                          headerColor: FvColors.edittext51Background,
                          backgroundColor: FvColors.edittext51Background,
                          itemStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          doneStyle: TextStyle(
                            color: FvColors.maintheme,
                            fontSize: 16,
                          ),
                        ),
                        // onChanged: (date) {
                        //   if (kDebugMode) {
                        //     print(
                        //       'change ${formatter.format(date)} in time zone ' +
                        //           date.timeZoneOffset.inHours.toString(),
                        //     );
                        //   }
                        // },
                        onConfirm: (date) {
                          setState(() {
                            dob = formatter.format(date);
                          });
                          // if (kDebugMode) {
                          //   print('confirm ${formatter.format(date)}');
                          // }
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.en,
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.02,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              // height: heightOfScreen * 0.075,
              child: TextFormField(
                onChanged: (text) {
                  email = text;
                },
                validator: (value) {
                  final bool isValid = EmailValidator.validate(value!);
                  if (value == '') {
                    return 'Please enter your email address';
                  } else if (!isValid) {
                    return 'You have entered an invalid email address';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                // textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: heightOfScreen * 0.01,
                  ),
                  filled: true,
                  fillColor: FvColors.edittext51Background,
                  focusColor: FvColors.textview65FontColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.maintheme,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  hintText: 'Email Address',
                  hintStyle: TextStyle(
                    color: FvColors.textview65FontColor,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: FvColors.maintheme,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.02,
            ),
            SizedBox(
              // height: heightOfScreen * 0.08,
              width: widthOfScreen * 0.8,
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  setState(() {
                    phone = number.toString();
                  });
                },
                // onInputValidated: (bool value) {
                //   if (kDebugMode) {
                //     print(value);
                //   }
                // },
                validator: (value) {
                  if (phone == '') {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                maxLength: 10,
                // spaceBetweenSelectorAndTextField: 0,
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: _phoneController,
                textAlign: TextAlign.justify,
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                inputBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                inputDecoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: heightOfScreen * 0.01,
                  ),
                  filled: true,
                  fillColor: FvColors.edittext51Background,
                  focusColor: FvColors.textview65FontColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.maintheme,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  hintText: '   Phone Number',
                  hintStyle: TextStyle(
                    color: FvColors.textview65FontColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // onSaved: (PhoneNumber number) {
                //   print('On Saved: $number');
                // },
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.02,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              // height: heightOfScreen * 0.075,
              child: TextFormField(
                onChanged: _onPasswordChanged,
                controller: _controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please set a password';
                  } else if (!regex.hasMatch(value)) {
                    return 'The password you selected does not meet the requirements';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: hidePassword,
                // textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: heightOfScreen * 0.01,
                  ),
                  filled: true,
                  fillColor: FvColors.edittext51Background,
                  focusColor: FvColors.textview65FontColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.maintheme,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: FvColors.textview65FontColor,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.key,
                    color: FvColors.maintheme,
                  ),
                  suffixIcon: IconButton(
                    color: FvColors.maintheme,
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.01,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      border: has8char
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50),
                      color: has8char ? Colors.green : FvColors.offwhite,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: FvColors.offwhite,
                        size: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Contains at least 8 characters',
                    style: TextStyle(color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      border: hasnumber
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50),
                      color: hasnumber ? Colors.green : FvColors.offwhite,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: FvColors.offwhite,
                        size: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Contains at least 1 number',
                    style: TextStyle(color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      border: hasUpperCase
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50),
                      color: hasUpperCase ? Colors.green : FvColors.offwhite,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: FvColors.offwhite,
                        size: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Contains at least 1 uppercase letter',
                    style: TextStyle(color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      border: hasLowerCase
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50),
                      color: hasLowerCase ? Colors.green : FvColors.offwhite,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: FvColors.offwhite,
                        size: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Contains at least 1 lowercase letter',
                    style: TextStyle(color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      border: hasSpecialChar
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50),
                      color: hasSpecialChar ? Colors.green : FvColors.offwhite,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: FvColors.offwhite,
                        size: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Contains at least 1 special character',
                    style: TextStyle(color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
            // FlutterPwValidator(
            //   controller: _controller,
            //   minLength: 8,
            //   uppercaseCharCount: 1,
            //   numericCharCount: 1,
            //   specialCharCount: 1,
            //   width: widthOfScreen * 0.8,
            //   height: 150,
            //   onSuccess: (text) {
            //     password = text;
            //   },

            //   // onFail: yourCallbackFunction
            // ),
            SizedBox(
              height: heightOfScreen * 0.02,
            ),
            SizedBox(
              width: widthOfScreen * 0.8,
              // height: heightOfScreen * 0.075,
              child: TextFormField(
                // onChanged: (text) {
                //   password = text;
                // },
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value != password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: hidePassword,
                // textInputAction: TextInputAction.continueAction,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: heightOfScreen * 0.01,
                  ),
                  filled: true,
                  fillColor: FvColors.edittext51Background,
                  focusColor: FvColors.textview65FontColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.maintheme,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: FvColors.edittext51Background,
                    ),
                  ),
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(
                    color: FvColors.textview65FontColor,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.key,
                    color: FvColors.maintheme,
                  ),
                  suffixIcon: IconButton(
                    color: FvColors.maintheme,
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: heightOfScreen * 0.06,
              width: widthOfScreen * 0.6,
              child: TextButton(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: FvColors.offwhite,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: FvColors.maintheme,
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  // print('phone no is $phone');
                  if (globalFormKey.currentState!.validate()) {
                    setState(() {
                      isAPIcallProcess = true;
                    });
                    SignupRequest model = SignupRequest(
                        fullName: '$firstName $lastName',
                        email: email,
                        password: password,
                        phone: phone,
                        pushToken: '0',
                        dob: dob,
                        deviceId: '0',
                        tandc: '1');

                    APIService.signup(model).then(
                      (response) {
                        // debugPrint('Full Name: $firstName $lastName');
                        setState(() {
                          isAPIcallProcess = false;
                        });
                        if (response.success) {
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
              ),
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
        SizedBox(
          height: 30,
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

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
