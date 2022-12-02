// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:o3_cards/models/create_employer_request.dart';

import 'package:o3_cards/pages/creditCardApplication/application_details.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/services/shared_service.dart';
import 'package:o3_cards/models/employment_details.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../../widgets/slider.dart';
import '/ui/export.dart';
// import 'package:intl/intl.dart';

class EmploymentDetails extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  final bool isDialog;
  final String name;
  final String type;
  final int? id;
  final bool employmentDetailsAdded;
  final bool statementAdded;
  final bool personalDetailsAdded;
  const EmploymentDetails({
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
  _EmploymentDetails createState() => _EmploymentDetails();
}

class _EmploymentDetails extends State<EmploymentDetails> {
  late Future<EmployerDetails?> employerDetails;

  Future<EmployerDetails?> _getEmploymentModel() async {
    Future<EmployerDetails?> model = await SharedService.isEmploymentSaved()
        ? SharedService.employerDetails()
        : APIService.getEmploymentDetails();
    return model;
  }

  @override
  void initState() {
    super.initState();
    employerDetails = _getEmploymentModel();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Select Employment Status"), value: ""),
      DropdownMenuItem(child: Text("Employed"), value: "Employed"),
      DropdownMenuItem(child: Text("Unemployed"), value: "Unemployed"),
      DropdownMenuItem(child: Text("Self Employed"), value: "Self Employed"),
    ];
    return menuItems;
  }

  String occupation = '';
  String employmentStatus = '';
  String employerName = '';
  int? yearsOnJob;
  int? salary;
  String stateValue = NigerianStatesAndLGA.allStates[0];
  String lgaValue = 'Select a Local Government Area';
  String selectedLGAFromAllLGAs = NigerianStatesAndLGA.getAllNigerianLGAs()[0];
  List<String> statesLga = [];
  String city = "";
  String address = "";

  bool isAPIcallProcess = false;
  final _formKey = GlobalKey<FormState>();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final FocusNode _nodeText4 = FocusNode();
  final FocusNode _nodeText5 = FocusNode();
  final FocusNode _nodeText6 = FocusNode();

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
        KeyboardActionsItem(
          focusNode: _nodeText6,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool employmentSaved = widget.employmentDetailsAdded;
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder<EmployerDetails?>(
        future: employerDetails,
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
                                                employmentSaved,
                                            statementAdded:
                                                widget.statementAdded,
                                            personalDetailsAdded:
                                                widget.personalDetailsAdded, sessionStateStream: widget.sessionStateStream,
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
                                  'Employment Details',
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
                                    'Tell us more about yourself. Enter your employment details to enable us find the best offer for you.',
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
                                      // SizedBox(
                                      //   height: heightOfScreen * 0.025,
                                      //   child: Padding(
                                      //     padding:
                                      //         EdgeInsets.only(left: widthOfScreen * 0.13),
                                      //     child: Row(
                                      //       mainAxisAlignment: MainAxisAlignment.start,
                                      //       children: [
                                      //         Column(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Text(
                                      //               'Employment Status',
                                      //               style: TextStyle(
                                      //                 fontWeight: FontWeight.w700,
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: heightOfScreen * 0.05,
                                      //   width: widthOfScreen * 0.75,
                                      //   child: Focus(
                                      //     child: DropdownButtonFormField(
                                      //       validator: (value) {
                                      //         if (value == "") {
                                      //           return 'You have not selected your employment status';
                                      //         }
                                      //         return null;
                                      //       },
                                      //       borderRadius: BorderRadius.circular(10),
                                      //       value: employmentStatus,
                                      //       items: dropdownItems,
                                      //       decoration: InputDecoration(
                                      //           enabledBorder: OutlineInputBorder(
                                      //             borderRadius: BorderRadius.circular(10),
                                      //             borderSide: BorderSide(
                                      //               color: FvColors.maintheme,
                                      //             ),
                                      //           ),
                                      //           focusedBorder: OutlineInputBorder(
                                      //             borderRadius: BorderRadius.circular(10),
                                      //             borderSide: BorderSide(
                                      //               color: FvColors.maintheme,
                                      //             ),
                                      //           ),
                                      //           border: OutlineInputBorder(
                                      //             borderRadius: BorderRadius.circular(10),
                                      //             borderSide: BorderSide(
                                      //               color: FvColors.maintheme,
                                      //             ),
                                      //           ),
                                      //           contentPadding:
                                      //               EdgeInsets.fromLTRB(10, 0, 10, 0)),
                                      //       onChanged: (String? value) {
                                      //         setState(() {
                                      //           employmentStatus = value!;
                                      //         });
                                      //       },
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: heightOfScreen * 0.02,
                                      // ),
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
                                                    'What is your Occupation',
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
                                        height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            focusNode: _nodeText1,
                                            onChanged: (text) {
                                              occupation = text;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'You have not specified your occupation';
                                              }
                                              return null;
                                            },

                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: FvColors.maintheme,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                hintText: 'Occupation',
                                                contentPadding:
                                                    EdgeInsets.zero),
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
                                                    'Where do you work?',
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
                                        height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            focusNode: _nodeText2,
                                            onChanged: (text) {
                                              employerName = text;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'You have not specified your Employer';
                                              }
                                              return null;
                                            },
                                            // keyboardType: TextInputType.number,
                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: FvColors.maintheme,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                hintText: 'Employer name',
                                                contentPadding:
                                                    EdgeInsets.zero),
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
                                                    'How long have you worked there?(Years)',
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
                                        height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            focusNode: _nodeText3,
                                            onChanged: (text) {
                                              yearsOnJob = int.parse(text);
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please tell us the length of your employment';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: FvColors.maintheme,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                hintText:
                                                    'Length of employment',
                                                contentPadding:
                                                    EdgeInsets.zero),
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
                                                    'In what state is it located?',
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
                                        height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: DropdownButtonFormField(
                                            key: const ValueKey('States'),
                                            isExpanded: true,
                                            validator: (value) {
                                              if (value == "") {
                                                return 'Please select a state';
                                              }
                                              return null;
                                            },
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            value: stateValue,
                                            items: NigerianStatesAndLGA
                                                .allStates
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                child: Text(value),
                                                value: value,
                                              );
                                            }).toList(),
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: FvColors.maintheme,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                        10, 0, 10, 0)),
                                            onChanged: (String? val) {
                                              lgaValue =
                                                  'Select a Local Government Area';
                                              statesLga.clear();
                                              statesLga.add(lgaValue);
                                              statesLga.addAll(
                                                NigerianStatesAndLGA
                                                    .getStateLGAs(val!),
                                              );
                                              setState(() {
                                                stateValue = val;
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
                                                    'In what local government is it located?',
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
                                        height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: DropdownButtonFormField(
                                            key: const ValueKey(
                                                'Local governments'),
                                            isExpanded: true,
                                            validator: (value) {
                                              if (value == "") {
                                                return 'You have not specified the address';
                                              }
                                              return null;
                                            },
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            value: lgaValue,
                                            items: statesLga
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                child: Text(value),
                                                value: value,
                                              );
                                            }).toList(),
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: FvColors.maintheme,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                        10, 0, 10, 0)),
                                            onChanged: (String? val) {
                                              setState(() {
                                                lgaValue = val!;
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
                                                    'In what city is it located?',
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
                                        height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            focusNode: _nodeText5,
                                            enabled: lgaValue !=
                                                "Select a Local Government Area",
                                            onChanged: (text) {
                                              setState(() {
                                                city = text;
                                              });
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'You have not specified the address';
                                              }
                                              return null;
                                            },

                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: FvColors.maintheme,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                hintText: 'City',
                                                contentPadding:
                                                    EdgeInsets.zero),
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
                                                    'What is the street address?',
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
                                        height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            focusNode: _nodeText4,
                                            enabled: city != "",
                                            onChanged: (text) {
                                              address =
                                                  '$text, $city, $lgaValue local government area, $stateValue';
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'You have not specified the address';
                                              }
                                              return null;
                                            },

                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: FvColors.maintheme,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                hintText: 'Street Address',
                                                contentPadding:
                                                    EdgeInsets.zero),
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
                                                    'What is your monthly salary?',
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
                                        height: heightOfScreen * 0.05,
                                        width: widthOfScreen * 0.75,
                                        child: Focus(
                                          child: TextFormField(
                                            focusNode: _nodeText6,
                                            onChanged: (text) {
                                              salary = int.parse(text);
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please tell us your monthly salary';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            // textInputAction: TextInputAction.continueAction,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: FvColors.maintheme,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                                hintText: 'Monthly salary',
                                                contentPadding:
                                                    EdgeInsets.zero),
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
                                              CreateEmployerRequest model =
                                                  CreateEmployerRequest(
                                                profession: occupation,
                                                organizationName: employerName,
                                                monthlySalary: salary!,
                                                employerAddress: address,
                                                city: city,
                                                country: 'Nigeria',
                                                yearsOnJob: yearsOnJob!,
                                              );
                                              APIService.createEmployer(model)
                                                  .then(
                                                (response) {
                                                  setState(() {
                                                    isAPIcallProcess = false;
                                                  });
                                                  if (response.success) {
                                                    setState(() {
                                                      employmentSaved = true;
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
                                                                child: const Text(
                                                                    'Return'),
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
                                                                            employmentSaved,
                                                                        statementAdded:
                                                                            widget.statementAdded,
                                                                        personalDetailsAdded:
                                                                            widget.personalDetailsAdded, sessionStateStream: widget.sessionStateStream,
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
                                                      'Employer Information already created') {
                                                    setState(() {
                                                      employmentSaved = true;
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
                                                                            employmentSaved,
                                                                        statementAdded:
                                                                            widget.statementAdded,
                                                                        personalDetailsAdded:
                                                                            widget.personalDetailsAdded, sessionStateStream: widget.sessionStateStream,
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
                                            debugPrint(address);
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
                                  employmentDetailsAdded: employmentSaved,
                                  statementAdded: widget.statementAdded,
                                  personalDetailsAdded:
                                      widget.personalDetailsAdded, sessionStateStream: widget.sessionStateStream,
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
                        'Employment Details',
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
                          'Tell us more about yourself. Enter your employment details to enable us find the best offer for you.',
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
                                          'What is your Occupation',
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

                                  onChanged: (text) {
                                    occupation = text;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'You have not specified your occupation';
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
                                    hintText: details.profession,
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
                                          'Where do you work?',
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

                                  onChanged: (text) {
                                    employerName = text;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'You have not specified your Employer';
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
                                    hintText: details.organizationName,
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
                                          'How long have you worked there?(Years)',
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

                                  onChanged: (text) {
                                    yearsOnJob = int.parse(text);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please tell us the length of your employment';
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
                                    hintText: details.yearsOnJob,
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
                                          'In what state is it located?',
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
                                  key: const ValueKey('States'),
                                  isExpanded: true,
                                  validator: (value) {
                                    if (value == "") {
                                      return 'Please select a state';
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
                                          'In what local government is it located?',
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
                                  key: const ValueKey('Local governments'),
                                  isExpanded: true,
                                  validator: (value) {
                                    if (value == "") {
                                      return 'You have not specified the address';
                                    }
                                    return null;
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  value: lgaValue,
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
                                          'In what city is it located?',
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
                                  onChanged: (text) {
                                    setState(() {
                                      city = text;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'You have not specified the address';
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
                                    hintText: details.city,
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
                                          'What is the street address?',
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
                                  onChanged: (text) {
                                    address =
                                        '$text, $city, $lgaValue local government area, $stateValue';
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'You have not specified the address';
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
                                    hintText: details.employerAddress,
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
                                          'What is your monthly salary?',
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

                                  onChanged: (text) {
                                    salary = int.parse(text);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please tell us your monthly salary';
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
                                      details.monthlySalary,
                                    ),
                                    contentPadding: EdgeInsets.zero,
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
                                        employmentDetailsAdded: employmentSaved,
                                        statementAdded: widget.statementAdded,
                                        personalDetailsAdded:
                                            widget.personalDetailsAdded, sessionStateStream: widget.sessionStateStream,
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
                  employmentDetailsAdded: employmentSaved,
                  statementAdded: widget.statementAdded,
                  personalDetailsAdded: widget.personalDetailsAdded, sessionStateStream: widget.sessionStateStream,
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
                      employmentDetailsAdded: employmentSaved,
                      statementAdded: widget.statementAdded,
                      personalDetailsAdded: widget.personalDetailsAdded, sessionStateStream: widget.sessionStateStream,
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
}
