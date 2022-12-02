// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterbudpay/flutterbudpay.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';
import 'package:o3_cards/models/fund_card_request.dart';
// import 'package:o3_cards/models/topup_request.dart';
// import 'package:o3_cards/pages/transactions/topup/checkout.dart';
import 'package:o3_cards/pages/transactions/topup/fund_card.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:o3_cards/pages/transactions/topup/funding_complete.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/services/shared_service.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';
// import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/slider.dart';
// import '../../cardList/cardlist.dart';
import '/ui/export.dart';
// import 'package:intl/intl.dart';

class AmountNaira extends StatefulWidget {
    final StreamController<SessionState> sessionStateStream;
  final bool isDialog;
  final int id;

  const AmountNaira({Key? key, this.isDialog = false, required this.id, required this.sessionStateStream})
      : super(key: key);

  @override
  _AmountNairaState createState() => _AmountNairaState();
}

class _AmountNairaState extends State<AmountNaira> {
  final plugin = Budpay();
  String publicKey = dotenv.env['BUDPAY_PUBLIC_KEY']!;
  String secretKey = dotenv.env['BUDPAY_SECRET_KEY']!;

  bool isAPIcallProcess = false;
  final _formKey = GlobalKey<FormState>();
  final FocusNode _nodeText1 = FocusNode();
  String _amount = '0';
  String _email = '';
  String _reference = '';
  String o3Ref = '';
  // String _accessCode = '';

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey, secretKey: secretKey);
  }

  _AmountNairaState() {
    getTextFromFile().then(
      (val) => setState(
        () {
          _email = val;
        },
      ),
    );
  }
  void _getReference() {
    String platform;
    if (!kIsWeb) {
      if (Platform.isIOS) {
        platform = 'iOS';
      } else {
        platform = 'Android';
      }
    } else {
      platform = "WEB";
    }
    debugPrint(
        'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}');
    // return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
    setState(() {
      _reference =
          'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
      var val = _reference.split('_');
      var val2 = val[1];
      o3Ref = val2.substring(val2.length-12);
    });
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return KeyboardActions(
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
                        child: Image.asset('assets/loadinganimation4.gif'),
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
                                page: FundCard(
                                  id: widget.id, sessionStateStream: widget.sessionStateStream
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
                        'Funding Amount',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: FvColors.textview50FontColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightOfScreen * 0.3,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: heightOfScreen * 0.025,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: widthOfScreen * 0.13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amount',
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
                          height: heightOfScreen * 0.08,
                          width: widthOfScreen * 0.75,
                          child: Focus(
                            child: TextFormField(
                              focusNode: _nodeText1,
                              onChanged: (text) {
                                setState(() {
                                  _amount = text;
                                });

                                // debugPrint('amount:$_amount');
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value[0] == '0') {
                                  return 'Please enter a valid amount';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              // textInputAction: TextInputAction.continueAction,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                prefixText: '₦',
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
                                hintText: 'Enter Amount',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: heightOfScreen * 0.15,
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
                            onPressed: () async {
                              debugPrint(
                                'amount:${int.parse(_amount)}, reference:$_reference and $o3Ref ',
                              );
                              if (_formKey.currentState!.validate()) {
                                _getReference();
                                debugPrint(
                                  'reference:$_reference and $o3Ref ',
                                );
                                Charge charge = Charge()
                                  ..amount = int.parse(_amount) * 100
                                  ..reference = _reference
                                  ..email = _email;

                                var response = await plugin.checkout(
                                  context,
                                  fullscreen: true,
                                  charge: charge,
                                  logo: Text(
                                    'data',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  // logo: Image.asset(
                                  //   "assets/CapitalLogoIcon_ImageView_46-190x110.png",
                                  // ),
                                );
                                if (response.status == true) {
                                  setState(() {
                                    isAPIcallProcess = true;
                                  });
                                  FundRequest model = FundRequest(
                                    amount: int.parse(_amount),
                                    cardId: widget.id,
                                    txref: o3Ref,
                                  );
                                  APIService.fundCard(model).then((value) {
                                    setState(() {
                                      isAPIcallProcess = false;
                                    });
                                    debugPrint(jsonEncode(value));
                                    if (value.success) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TopupCompleted(
                                            amount: _amount,
                                            success: true,
                                            message: '', sessionStateStream: widget.sessionStateStream,
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TopupCompleted(
                                            amount: _amount,
                                            success: false,
                                            message: value.message, sessionStateStream: widget.sessionStateStream,
                                          ),
                                        ),
                                      );
                                    }
                                  });
                                }

                                // Get.to(() => Checkout());
                                //   setState(
                                //     () {
                                //       isAPIcallProcess = true;
                                //     },
                                //   );
                                //   TopupRequest model = TopupRequest(
                                //     email: _email,
                                //     amount: amount!,
                                //     cardId: widget.id,
                                //     currency: 'NGN',
                                //   );
                                //   APIService.topup(model).then(
                                //     (response) {
                                //       setState(() {
                                //         isAPIcallProcess = false;
                                //       });
                                //       if (response.success) {
                                //         final Uri _url = Uri.parse(
                                //           response.payload.authorizationUrl,
                                //         );
                                //         void _launchUrl() async {
                                //           if (!await launchUrl(_url)) {
                                //             FormHelper.showSimpleAlertDialog(
                                //               context,
                                //               '',
                                //               'Network Timeout',
                                //               'Close',
                                //               () {
                                //                 Navigator.of(context).pop();
                                //               },
                                //             );
                                //           }
                                //         }

                                //         _launchUrl();
                                //       } else {
                                //         FormHelper.showSimpleAlertDialog(
                                //           context,
                                //           '',
                                //           response.message,
                                //           'Ok',
                                //           () {
                                //             Navigator.of(context).pop();
                                //           },
                                //         );
                                //       }

                                //       debugPrint(response.message);
                                //     },
                                //   );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Future<String> getTextFromFile() async {
    var userDetails = await SharedService.loginDetails();
    var email = userDetails!.payload!.user!.email;
    return email;
  }
}
