// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:mono_flutter/mono_flutter.dart';
import 'package:o3_cards/pages/creditCardApplication/personal_info.dart';
import 'package:o3_cards/pages/creditCardApplication/select_card_type.dart';

import 'package:o3_cards/ui/export.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../widgets/slider.dart';
import '../../models/mono_auth_request.dart';
import '../../services/api_service.dart';
import 'employment_details.dart';

class ApplicationDetails extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  final String name;
  final String type;
  final int? id;
  final bool employmentDetailsAdded;
  final bool statementAdded;
  final bool personalDetailsAdded;
  const ApplicationDetails({
    Key? key,
    required this.name,
    required this.type,
    required this.id,
    required this.employmentDetailsAdded,
    required this.statementAdded,
    required this.personalDetailsAdded, required this.sessionStateStream,
  }) : super(key: key);

  @override
  _ApplicationDetailsState createState() => _ApplicationDetailsState();
}

class _ApplicationDetailsState extends State<ApplicationDetails> {
  // void _launchMono(BuildContext context) {
  //   Navigator.of(context).push(Mono());
  // }
  bool isAPIcallProcess = false;
  String monoKey = dotenv.env['MONO_KEY']!;

  @override
  Widget build(BuildContext context) {
    bool statementConnected = widget.statementAdded;
    bool employmentSaved = widget.employmentDetailsAdded;
    bool personalSaved = widget.personalDetailsAdded;
    _statementTick() {
      if (statementConnected) {
        return Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(50),
              color: Colors.green),
          child: Center(
            child: Icon(
              Icons.check,
              color: FvColors.offwhite,
              size: 10,
            ),
          ),
        );
      } else {
        return Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
          ),
          child: Center(
            child: Icon(
              Icons.check,
              color: Colors.transparent,
              size: 10,
            ),
          ),
        );
      }
    }

    _personalTick() {
      if (personalSaved) {
        return Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(50),
              color: Colors.green),
          child: Center(
            child: Icon(
              Icons.check,
              color: FvColors.offwhite,
              size: 10,
            ),
          ),
        );
      } else {
        return Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
          ),
          child: Center(
            child: Icon(
              Icons.check,
              color: Colors.transparent,
              size: 10,
            ),
          ),
        );
      }
    }

    _employmentTick() {
      if (employmentSaved) {
        return Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(50),
              color: Colors.green),
          child: Center(
            child: Icon(
              Icons.check,
              color: FvColors.offwhite,
              size: 10,
            ),
          ),
        );
      } else {
        return Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
          ),
          child: Center(
            child: Icon(
              Icons.check,
              color: Colors.transparent,
              size: 10,
            ),
          ),
        );
      }
    }

    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: isAPIcallProcess
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                              page: CardType(sessionStateStream: widget.sessionStateStream,),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  'Applicant Details',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: FvColors.textview50FontColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: heightOfScreen * 0.1,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!personalSaved) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonalInfo(
                                name: widget.name,
                                type: widget.type,
                                id: widget.id,
                                employmentDetailsAdded: employmentSaved,
                                statementAdded: statementConnected,
                                personalDetailsAdded: personalSaved, sessionStateStream: widget.sessionStateStream,
                              ),
                            ),
                          );
                        }
                      },
                      child: SizedBox(
                        height: heightOfScreen * 0.15,
                        width: widthOfScreen * 0.9,
                        child: FittedBox(
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.grey.shade50,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              height: heightOfScreen * 0.12,
                              width: widthOfScreen * 0.89,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: heightOfScreen * 0.08,
                                    width: widthOfScreen * 0.15,
                                    child: CircleAvatar(
                                      backgroundColor: FvColors.offwhitepink,
                                      child: Icon(
                                        Icons.person,
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: widthOfScreen * 0.4,
                                    // height: heightOfScreen * 0.05,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Personal Information',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  _personalTick()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!employmentSaved) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmploymentDetails(
                                name: widget.name,
                                type: widget.type,
                                id: widget.id,
                                employmentDetailsAdded: employmentSaved,
                                statementAdded: statementConnected,
                                personalDetailsAdded: personalSaved, sessionStateStream: widget.sessionStateStream,
                              ),
                            ),
                          );
                        }
                      },
                      child: SizedBox(
                        height: heightOfScreen * 0.15,
                        width: widthOfScreen * 0.9,
                        child: FittedBox(
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.grey.shade50,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              height: heightOfScreen * 0.12,
                              width: widthOfScreen * 0.89,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: heightOfScreen * 0.08,
                                    width: widthOfScreen * 0.15,
                                    child: CircleAvatar(
                                      backgroundColor: FvColors.offwhitepink,
                                      child: Icon(
                                        Icons.work,
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: widthOfScreen * 0.4,
                                    // height: heightOfScreen * 0.05,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Employment Details',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _employmentTick(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!statementConnected) {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (c) {
                              // return AlertDialog(
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.all(
                              //       Radius.circular(15.0),
                              //     ),
                              //   ),
                              //   contentPadding: EdgeInsets.all(5),
                              //   content: SizedBox(
                              //     width: widthOfScreen * 0.9,
                              //     height: heightOfScreen * 0.7,
                              //     child: MonoWebView(
                              //       apiKey: monoKey,
                              //     ),
                              //   ),
                              // );
                              return MonoWebView(
                                apiKey: monoKey,
                                onSuccess: (code) {
                                  setState(
                                    () {
                                      isAPIcallProcess = true;
                                    },
                                  );
                                  RequestMonoAuth model =
                                      RequestMonoAuth(code: code);
                                  APIService.authenticateMono(model).then(
                                    (response) {
                                      setState(() {
                                        isAPIcallProcess = false;
                                      });
                                      if (response.success) {
                                        setState(() {
                                          statementConnected = true;
                                        });
                                        Navigator.pushReplacement(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (
                                              context,
                                              animation1,
                                              animation2,
                                            ) =>
                                                ApplicationDetails(
                                              name: widget.name,
                                              type: widget.type,
                                              id: widget.id,
                                              employmentDetailsAdded:
                                                  widget.employmentDetailsAdded,
                                              statementAdded:
                                                  statementConnected,
                                              personalDetailsAdded:
                                                  personalSaved, sessionStateStream: widget.sessionStateStream,
                                            ),
                                            transitionDuration: Duration.zero,
                                            reverseTransitionDuration:
                                                Duration.zero,
                                          ),
                                        );
                                      } else {
                                        setState(() {
                                          statementConnected = false;
                                        });
                                        Navigator.pushReplacement(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (
                                              context,
                                              animation1,
                                              animation2,
                                            ) =>
                                                ApplicationDetails(
                                              name: widget.name,
                                              type: widget.type,
                                              id: widget.id,
                                              employmentDetailsAdded:
                                                  widget.employmentDetailsAdded,
                                              statementAdded:
                                                  statementConnected,
                                              personalDetailsAdded:
                                                  personalSaved, sessionStateStream: widget.sessionStateStream,
                                            ),
                                            transitionDuration: Duration.zero,
                                            reverseTransitionDuration:
                                                Duration.zero,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          );
                        }
                        // _launchMono(context);

                        // MonoFlutter().launch(
                        //   context,
                        //   monoKey,
                        //   reference:
                        //       DateTime.now().millisecondsSinceEpoch.toString(),
                        //   // config: {
                        //   //   "selectedInstitution": {
                        //   //     "id": "5f2d08bf60b92e2888287703",
                        //   //     "auth_method": "internet_banking"
                        //   //   }
                        //   // },
                        //   // onEvent: (event, data) {
                        //   //   if (kDebugMode) print('event: $event, data: $data');
                        //   // },
                        //   // onClosed: () {
                        //   //   if (kDebugMode) print('Modal closed');
                        //   // },
                        //   // onLoad: () {
                        //   //   setState(() {
                        //   //     isAPIcallProcess = false;
                        //   //   });
                        //   //   if (kDebugMode) print('Mono loaded successfully');
                        //   // },
                        //   onSuccess: (code) {
                        //     if (kDebugMode) print('Mono Success $code');
                        //   },
                        // );
                        // showGeneralDialog(
                        //   context: context,
                        //   barrierDismissible: true,
                        //   barrierLabel:
                        //       MaterialLocalizations.of(context).modalBarrierDismissLabel,
                        //   barrierColor: Colors.black45,
                        //   transitionDuration: const Duration(milliseconds: 200),
                        //   pageBuilder: (buildContext, animation, secondaryAnimation) {
                        //     // return AlertDialog(
                        //     //   shape: RoundedRectangleBorder(
                        //     //     borderRadius: BorderRadius.all(
                        //     //       Radius.circular(15.0),
                        //     //     ),
                        //     //   ),
                        //     //   contentPadding: EdgeInsets.all(5),
                        //     //   content: SizedBox(
                        //     //     width: widthOfScreen * 0.9,
                        //     //     height: heightOfScreen * 0.7,
                        //     //     child: MonoWebView(
                        //     //       apiKey: monoKey,
                        //     //     ),
                        //     //   ),
                        //     // );
                        //     return SizedBox(
                        //       width: widthOfScreen,
                        //       height: heightOfScreen,
                        //       child: MonoWebView(
                        //         apiKey: monoKey,
                        //         onSuccess: (code) {
                        //           setState(() {
                        //             statementConnected = true;
                        //           });
                        //           if (kDebugMode) print('Mono Success $code');
                        //         },
                        //       ),
                        //     );
                        //   },
                        // );
                      },
                      child: SizedBox(
                        height: heightOfScreen * 0.15,
                        width: widthOfScreen * 0.9,
                        child: FittedBox(
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.grey.shade50,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              height: heightOfScreen * 0.12,
                              width: widthOfScreen * 0.89,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: heightOfScreen * 0.08,
                                    width: widthOfScreen * 0.15,
                                    child: CircleAvatar(
                                      backgroundColor: FvColors.offwhitepink,
                                      child: FaIcon(
                                        FontAwesomeIcons.buildingColumns,
                                        color: FvColors.maintheme,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: widthOfScreen * 0.4,
                                    // height: heightOfScreen * 0.05,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Link your Salary Account',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  _statementTick()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightOfScreen * 0.05,
                    ),
                    SizedBox(
                      height: heightOfScreen * 0.06,
                      width: widthOfScreen * 0.6,
                      child: TextButton(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: const Text(
                            'Continue',
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
                                BorderRadius.circular(16.31081199645996),
                            side: const BorderSide(
                              width: 1,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (personalSaved &&
                              employmentSaved &&
                              employmentSaved) {
                            FormHelper.showSimpleAlertDialog(
                              context,
                              '',
                              'Completed',
                              'Ok',
                              () {
                                Navigator.of(context).pop();
                              },
                            );
                          } else {
                            FormHelper.showSimpleAlertDialog(
                              context,
                              '',
                              'Please provide your information',
                              'Ok',
                              () {
                                Navigator.of(context).pop();
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
