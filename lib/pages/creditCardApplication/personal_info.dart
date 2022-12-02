// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:o3_cards/models/create_personal_info_request.dart';
import 'package:o3_cards/models/personal_details.dart';

import 'package:o3_cards/pages/creditCardApplication/application_details.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/services/shared_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../../widgets/slider.dart';
import '../../models/user_info.dart';
import '/ui/export.dart';
// import 'package:intl/intl.dart';

class PersonalInfo extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  final bool isDialog;
  final String name;
  final String type;
  final int? id;
  final bool employmentDetailsAdded;
  final bool statementAdded;
  final bool personalDetailsAdded;
  const PersonalInfo({
    Key? key,
    this.isDialog = false,
    required this.name,
    required this.type,
    required this.id,
    required this.employmentDetailsAdded,
    required this.statementAdded,
    required this.personalDetailsAdded, required this.sessionStateStream,
  }) : super(key: key);

  @override
  _PersonalInfo createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {
  late Future<PersonalDetails?> personalDetails;

  Future<PersonalDetails?> _getPersonalDetailsModel() async {
    Future<PersonalDetails?> model = await SharedService.isPersonalSaved()
        ? SharedService.personalDetails()
        : APIService.getPersonalDetails();
    return model;
  }

  @override
  void initState() {
    super.initState();
    personalDetails = _getPersonalDetailsModel();
  }

  List<DropdownMenuItem<String>> get genderItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Select Gender"), value: ""),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
      DropdownMenuItem(child: Text("Male"), value: "Male"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get maritalStatusItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Marital Status"), value: ""),
      DropdownMenuItem(child: Text("Single"), value: "Single"),
      DropdownMenuItem(child: Text("Married"), value: "Married"),
      DropdownMenuItem(child: Text("Divorced"), value: "Divorced"),
      DropdownMenuItem(child: Text("Separated"), value: "Separated"),
    ];
    return menuItems;
  }

  UserInfo? loginDetails;
  int? income;
  _PersonalInfo() {
    _getLoginDetails().then(
      (val) => setState(() {
        loginDetails = val;
      }),
    );
    _getIncome().then(
      (val) => setState(() {
        income = val;
      }),
    );
  }

  bool isAPIcallProcess = false;
  final _formKey = GlobalKey<FormState>();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final FocusNode _nodeText4 = FocusNode();
  final FocusNode _nodeText5 = FocusNode();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
        ),
        KeyboardActionsItem(
          focusNode: _nodeText2,
        ),
        KeyboardActionsItem(
          focusNode: _nodeText3,
        ),
        KeyboardActionsItem(
          focusNode: _nodeText4,
        ),
        KeyboardActionsItem(
          focusNode: _nodeText5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String? fullName =
        loginDetails != null ? loginDetails!.payload!.fullName! : "";
    List<String> splitName = fullName == "" ? [] : fullName.split(' ');
    String? firstName = splitName.isEmpty ? "" : splitName[0];
    String? middleName = '';
    String? lastName = splitName.isEmpty ? "" : splitName[1];
    String gender = "";
    String maritalStatus = "";
    int? monthlyIncome = income;
    String? dob = loginDetails != null ? loginDetails!.payload!.dob : '';
    DateTime? dt = dob == '' ? null : DateTime.parse(dob!);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    int? bvn = 0;
    bool personalSaved = widget.personalDetailsAdded;
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder<PersonalDetails?>(
        future: personalDetails,
        builder: (context, employerModel) {
          if (employerModel.hasData) {
            var details = employerModel.data!.payload!;
            if (!employerModel.data!.success) {
              return KeyboardActions(
                autoScroll: false,
                config: _buildConfig(context),
                isDialog: widget.isDialog,
                child: Container(
                  decoration: BoxDecoration(
                    color: FvColors.edittext51Background,
                  ),
                  child: isAPIcallProcess
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                width: widthOfScreen * 0.4,
                                height: heightOfScreen * 0.2,
                                child: FittedBox(
                                  child: Image.asset(
                                    'assets/loadinganimation4.gif',
                                  ),
                                ),
                              ),
                            )
                            // const CircularProgressIndicator(
                            //   color: FvColors.maintheme,
                            // ),
                          ],
                        )
                      : Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: widthOfScreen * 0.05,
                                    top: heightOfScreen * 0.05,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.keyboard_backspace,
                                      color: FvColors.maintheme,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        SlideRightRoute(
                                          page: ApplicationDetails(
                                            id: widget.id,
                                            name: widget.name,
                                            type: widget.type,
                                            employmentDetailsAdded:
                                                widget.employmentDetailsAdded,
                                            statementAdded:
                                                widget.statementAdded,
                                            personalDetailsAdded: personalSaved, sessionStateStream: widget.sessionStateStream,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Personal Information',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: FvColors.textview50FontColor,
                                    fontSize: heightOfScreen * 0.015 +
                                        widthOfScreen * 0.015,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: widthOfScreen * 0.75,
                                  child: Text(
                                    'Tell us more about yourself.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: FvColors.textview50FontColor,
                                      fontSize: heightOfScreen * 0.008 +
                                          widthOfScreen * 0.008,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.05,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: heightOfScreen * 0.025,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: widthOfScreen * 0.13,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'What is your First Name?',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            enabled: false,
                                            focusNode: _nodeText1,
                                            onChanged: (text) {
                                              firstName = text;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'First name cannot be empty';
                                              }
                                              return null;
                                            },

                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              hintText: firstName,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                vertical: heightOfScreen * 0.01,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.02,
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.025,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: widthOfScreen * 0.13),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'What is your middle name?(Optional)',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            focusNode: _nodeText2,
                                            onChanged: (text) {
                                              middleName = text;
                                            },
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Middle name cannot be empty';
                                              }
                                              return null;
                                            },
                                            // keyboardType: TextInputType.number,
                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              hintText: 'Middle name',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                vertical: heightOfScreen * 0.01,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.02,
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.025,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: widthOfScreen * 0.13,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'What is your last name?',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            enabled: false,
                                            focusNode: _nodeText3,
                                            onChanged: (text) {
                                              lastName = text;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Last name cannot be empty';
                                              }
                                              return null;
                                            },
                                            // keyboardType: TextInputType.number,
                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              hintText: lastName,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                vertical: heightOfScreen * 0.01,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.02,
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.025,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: widthOfScreen * 0.13,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'What is your gender?',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: DropdownButtonFormField(
                                            validator: (value) {
                                              if (value == "") {
                                                return 'Please select your gender';
                                              }
                                              return null;
                                            },
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            value: gender,
                                            items: genderItems,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                gender = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.02,
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.025,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: widthOfScreen * 0.13),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'What is your marital status?',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: DropdownButtonFormField(
                                            validator: (value) {
                                              if (value == "") {
                                                return 'Please select your marital status';
                                              }
                                              return null;
                                            },
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            value: maritalStatus,
                                            items: maritalStatusItems,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                maritalStatus = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.02,
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.025,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: widthOfScreen * 0.13,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'What is your monthly income(salary)?',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            enabled: monthlyIncome == 0,
                                            focusNode: _nodeText4,
                                            onChanged: (text) {
                                              monthlyIncome = int.parse(text);
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Monthly Income cannot be empty';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              hintText: monthlyIncome == 0
                                                  ? 'Monthly Income'
                                                  : NumberFormat.currency(
                                                      name: '₦ ',
                                                      decimalDigits: 0,
                                                    ).format(
                                                      monthlyIncome,
                                                    ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                vertical: heightOfScreen * 0.01,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.02,
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.025,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: widthOfScreen * 0.13,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'What is your date of birth?',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            enabled: false,
                                            focusNode: _nodeText5,
                                            onChanged: (text) {
                                              dob = text;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Date of birth cannot be empty';
                                              }
                                              return null;
                                            },

                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: FvColors.maintheme,
                                                ),
                                              ),
                                              hintText: formatter.format(dt!),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                vertical: heightOfScreen * 0.01,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.04,
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.06,
                                        width: widthOfScreen * 0.6,
                                        child: TextButton(
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: const Text(
                                              'Save and Continue',
                                              style: TextStyle(
                                                color: FvColors.offwhite,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            backgroundColor: FvColors.maintheme,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      16.31081199645996),
                                              side: const BorderSide(
                                                width: 1,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              // debugPrint(
                                              //     'profession:$occupation, employer:$employerName, monthlySalary:$salary, address:$address, city:$city, yearsOnJob:$yearsOnJob');
                                              setState(
                                                () {
                                                  isAPIcallProcess = true;
                                                },
                                              );
                                              PersonalDetailsRequest model =
                                                  PersonalDetailsRequest(
                                                bvn: bvn,
                                                dob: dob,
                                                firstName: firstName,
                                                gender: gender,
                                                lastName: lastName,
                                                maritalStatus: maritalStatus,
                                                middleName: middleName,
                                                monthlyIncome: monthlyIncome,
                                              );
                                              APIService.createPersonalDetails(
                                                      model)
                                                  .then(
                                                (response) {
                                                  setState(() {
                                                    isAPIcallProcess = false;
                                                  });
                                                  if (response.success) {
                                                    setState(() {
                                                      personalSaved = true;
                                                    });
                                                    Future<void>
                                                        _showMyDialog() async {
                                                      return showDialog<void>(
                                                        context: context,
                                                        barrierDismissible:
                                                            false, // user must tap button!
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            // title: const Text(
                                                            //   'AlertDialog Title',
                                                            // ),
                                                            content:
                                                                SingleChildScrollView(
                                                              child: ListBody(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    response
                                                                        .message,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child:
                                                                    const Text(
                                                                  'Return',
                                                                ),
                                                                onPressed: () {
                                                                  Navigator
                                                                      .pushReplacement(
                                                                    context,
                                                                    SlideRightRoute(
                                                                      page:
                                                                          ApplicationDetails(
                                                                        id: widget
                                                                            .id,
                                                                        name: widget
                                                                            .name,
                                                                        type: widget
                                                                            .type,
                                                                        employmentDetailsAdded:
                                                                            widget.employmentDetailsAdded,
                                                                        statementAdded:
                                                                            widget.statementAdded,
                                                                        personalDetailsAdded:
                                                                            personalSaved, sessionStateStream: widget.sessionStateStream,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    _showMyDialog();
                                                  } else if (response.message ==
                                                      'Personal Information already created') {
                                                    setState(() {
                                                      personalSaved = true;
                                                    });
                                                    Future<void>
                                                        _showMyDialog() async {
                                                      return showDialog<void>(
                                                        context: context,
                                                        barrierDismissible:
                                                            false, // user must tap button!
                                                        builder: (
                                                          BuildContext context,
                                                        ) {
                                                          return AlertDialog(
                                                            // title: const Text(
                                                            //   'AlertDialog Title',
                                                            // ),
                                                            content:
                                                                SingleChildScrollView(
                                                              child: ListBody(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    response
                                                                        .message,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child: Text(
                                                                  'Return',
                                                                ),
                                                                onPressed: () {
                                                                  Navigator
                                                                      .pushReplacement(
                                                                    context,
                                                                    SlideRightRoute(
                                                                      page:
                                                                          ApplicationDetails(
                                                                        id: widget
                                                                            .id,
                                                                        name: widget
                                                                            .name,
                                                                        type: widget
                                                                            .type,
                                                                        employmentDetailsAdded:
                                                                            widget.employmentDetailsAdded,
                                                                        statementAdded:
                                                                            widget.statementAdded,
                                                                        personalDetailsAdded:
                                                                            personalSaved, sessionStateStream: widget.sessionStateStream,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    _showMyDialog();
                                                  } else {
                                                    Future<void>
                                                        _showMyDialog() async {
                                                      return showDialog<void>(
                                                        context: context,
                                                        barrierDismissible:
                                                            false, // user must tap button!
                                                        builder: (
                                                          BuildContext context,
                                                        ) {
                                                          return AlertDialog(
                                                            content:
                                                                SingleChildScrollView(
                                                              child: ListBody(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    response
                                                                        .message,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child: Text(
                                                                  'Ok',
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                    context,
                                                                  ).pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    _showMyDialog();
                                                  }
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.04,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              );
            }
            return Container(
              decoration: BoxDecoration(
                color: FvColors.edittext51Background,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: widthOfScreen * 0.05,
                          top: heightOfScreen * 0.05,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.keyboard_backspace,
                            color: FvColors.maintheme,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              SlideRightRoute(
                                page: ApplicationDetails(
                                  id: widget.id,
                                  name: widget.name,
                                  type: widget.type,
                                  employmentDetailsAdded:
                                      widget.employmentDetailsAdded,
                                  statementAdded: widget.statementAdded,
                                  personalDetailsAdded: personalSaved, sessionStateStream: widget.sessionStateStream,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Personal Information',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: FvColors.textview50FontColor,
                          fontSize:
                              heightOfScreen * 0.015 + widthOfScreen * 0.015,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: widthOfScreen * 0.75,
                        child: Text(
                          'Tell us more about yourself.',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: FvColors.textview50FontColor,
                            fontSize:
                                heightOfScreen * 0.008 + widthOfScreen * 0.008,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightOfScreen * 0.05,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: heightOfScreen * 0.025,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: widthOfScreen * 0.13,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'What is your First Name?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.05,
                              width: widthOfScreen * 0.75,
                              child: Focus(
                                child: TextFormField(
                                  enabled: false,
                                  focusNode: _nodeText1,
                                  onChanged: (text) {
                                    firstName = text;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'First name cannot be empty';
                                    }
                                    return null;
                                  },

                                  // textInputAction: TextInputAction.continueAction,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    hintText: details.firstName,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.025,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: widthOfScreen * 0.13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'What is your middle name?(Optional)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.05,
                              width: widthOfScreen * 0.75,
                              child: Focus(
                                child: TextFormField(
                                  enabled: false,
                                  focusNode: _nodeText2,
                                  onChanged: (text) {
                                    middleName = text;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Middle name cannot be empty';
                                    }
                                    return null;
                                  },
                                  // keyboardType: TextInputType.number,
                                  // textInputAction: TextInputAction.continueAction,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    hintText: details.middleName,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.025,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: widthOfScreen * 0.13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'What is your last name?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.05,
                              width: widthOfScreen * 0.75,
                              child: Focus(
                                child: TextFormField(
                                  enabled: false,
                                  focusNode: _nodeText3,
                                  onChanged: (text) {
                                    lastName = text;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Last name cannot be empty';
                                    }
                                    return null;
                                  },
                                  // keyboardType: TextInputType.number,
                                  // textInputAction: TextInputAction.continueAction,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    hintText: details.lastName,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.025,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: widthOfScreen * 0.13,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'What is your gender?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.05,
                              width: widthOfScreen * 0.75,
                              child: Focus(
                                child: DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == "") {
                                      return 'Please select your gender';
                                    }
                                    return null;
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  value: '',
                                  items: null,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0)),
                                  onChanged: null,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.025,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: widthOfScreen * 0.13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'What is your marital status?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.05,
                              width: widthOfScreen * 0.75,
                              child: Focus(
                                child: DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == "") {
                                      return 'Please select your marital status';
                                    }
                                    return null;
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  value: '',
                                  items: null,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0)),
                                  onChanged: null,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.025,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: widthOfScreen * 0.13,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'What is your monthly income(salary)?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.05,
                              width: widthOfScreen * 0.75,
                              child: Focus(
                                child: TextFormField(
                                  enabled: false,
                                  focusNode: _nodeText4,
                                  onChanged: (text) {
                                    monthlyIncome = int.parse(text);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Monthly Income cannot be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  // textInputAction: TextInputAction.continueAction,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    hintText: NumberFormat.currency(
                                      name: '₦ ',
                                      decimalDigits: 0,
                                    ).format(
                                      details.monthlyIncome,
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.025,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: widthOfScreen * 0.13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'What is your date of birth?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.05,
                              width: widthOfScreen * 0.75,
                              child: Focus(
                                child: TextFormField(
                                  enabled: false,
                                  focusNode: _nodeText5,
                                  onChanged: (text) {
                                    dob = text;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Date of birth cannot be empty';
                                    }
                                    return null;
                                  },

                                  // textInputAction: TextInputAction.continueAction,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                    hintText: details.dob,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.02,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.04,
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.06,
                              width: widthOfScreen * 0.6,
                              child: TextButton(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: const Text(
                                    'Save and Continue',
                                    style: TextStyle(
                                      color: FvColors.offwhite,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: FvColors.maintheme,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        16.31081199645996),
                                    side: const BorderSide(
                                      width: 1,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    SlideRightRoute(
                                      page: ApplicationDetails(
                                        id: widget.id,
                                        name: widget.name,
                                        type: widget.type,
                                        employmentDetailsAdded:
                                            widget.employmentDetailsAdded,
                                        statementAdded: widget.statementAdded,
                                        personalDetailsAdded: personalSaved, sessionStateStream: widget.sessionStateStream,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.04,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (employerModel.hasError) {
            Navigator.pushReplacement(
              context,
              SlideRightRoute(
                page: ApplicationDetails(
                  id: widget.id,
                  name: widget.name,
                  type: widget.type,
                  employmentDetailsAdded: widget.employmentDetailsAdded,
                  statementAdded: widget.statementAdded,
                  personalDetailsAdded: personalSaved, sessionStateStream: widget.sessionStateStream,
                ),
              ),
            );
            // return Container(
            //   decoration: BoxDecoration(
            //     color: FvColors.edittext51Background,
            //   ),
            //   child: SizedBox(
            //     height: heightOfScreen * 0.8,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         SizedBox(
            //           width: widthOfScreen * 0.4,
            //           height: heightOfScreen * 0.2,
            //           child: Text('An Error occurred'),
            //         )
            //         // const CircularProgressIndicator(
            //         //   color: FvColors.maintheme,
            //         // ),
            //       ],
            //     ),
            //   ),
            // );
            FormHelper.showSimpleAlertDialog(
              context,
              '',
              'An error has occurred',
              'OK',
              () {
                Navigator.pushReplacement(
                  context,
                  SlideRightRoute(
                    page: ApplicationDetails(
                      id: widget.id,
                      name: widget.name,
                      type: widget.type,
                      employmentDetailsAdded: widget.employmentDetailsAdded,
                      statementAdded: widget.statementAdded,
                      personalDetailsAdded: personalSaved, sessionStateStream: widget.sessionStateStream,
                    ),
                  ),
                );
              },
            );
          }
          return Container(
            decoration: BoxDecoration(
              color: FvColors.edittext51Background,
            ),
            child: Center(
              child: SizedBox(
                width: widthOfScreen * 0.4,
                height: heightOfScreen * 0.2,
                child: FittedBox(
                  child: Image.asset('assets/loadinganimation4.gif'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<UserInfo?> _getLoginDetails() async {
    var userDetails = await SharedService.userInfo();
    return userDetails;
  }

  Future<int?> _getIncome() async {
    var isIncomeSaved = await SharedService.isEmploymentSaved();
    if (isIncomeSaved) {
      var incomeDetails = await SharedService.employerDetails().then((value) {
        return value!.payload!.monthlySalary;
      });
      return incomeDetails;
    } else {
      return 0;
    }
  }
}
