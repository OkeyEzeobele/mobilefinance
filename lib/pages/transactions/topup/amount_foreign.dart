// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterbudpay/flutterbudpay.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:o3_cards/models/exchange_rates.dart';
// import 'package:o3_cards/models/topup_request.dart';
import 'package:o3_cards/pages/transactions/topup/fund_card.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/services/shared_service.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';
// import 'package:url_launcher/url_launcher.dart';
import '../../../models/fund_card_request.dart';
import '../../../models/rate_request.dart';
import '../../../widgets/slider.dart';
import '/ui/export.dart';
import 'funding_complete.dart';
// import 'package:intl/intl.dart';

class AmountForeign extends StatefulWidget {
    final StreamController<SessionState> sessionStateStream;
  final int id;

  const AmountForeign({Key? key, required this.id, required this.sessionStateStream}) : super(key: key);

  @override
  _AmountForeignState createState() => _AmountForeignState();
}

class _AmountForeignState extends State<AmountForeign> {
  final plugin = Budpay();
  String publicKey = dotenv.env['BUDPAY_PUBLIC_KEY']!;
  String secretKey = dotenv.env['BUDPAY_SECRET_KEY']!;
  String _reference = '';
  String o3Ref = '';
  String _amount = '0';
  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey, secretKey: secretKey);
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Select Currency"), value: ""),
      DropdownMenuItem(child: Text("US Dollars"), value: "USD"),
      DropdownMenuItem(child: Text("Pounds Sterling"), value: "GBP"),
    ];
    return menuItems;
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
      o3Ref = val2.substring(val2.length - 12);
    });
  }

  String selectedCurrency = '';

  int usdRate = 710;
  int gbpRate = 758;
  String convertedAmount = '0.00';
  bool isAPIcallProcess = false;

  final _formKey = GlobalKey<FormState>();
  // final FocusNode _nodeText1 = FocusNode();
  String? amount = '';
  String _email = '';
  _AmountForeignState() {
    getTextFromFile().then(
      (val) => setState(
        () {
          _email = val;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Container(
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
          : GestureDetector(
              onTap: () async {
                FocusScope.of(context).unfocus();
                if (_amount.isNotEmpty) {
                  setState(() {
                    convertedAmount = 'Please wait...';
                  });

                  RateRequest model = RateRequest(currency: selectedCurrency);
                  APIService.rates(model).then((response) {
                    if (response.success) {
                      var equivalentAmountInt =
                          response.payload.rate * int.parse(_amount);
                      var finalAmount = equivalentAmountInt.toString();
                      setState(() {
                        convertedAmount = finalAmount;
                      });
                    }
                  });
                }
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: FvColors.edittext51Background,
                body: Column(
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
                          'Select Currency',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: FvColors.textview50FontColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightOfScreen * 0.15,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Currency',
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
                              child: DropdownButtonFormField(
                                validator: (value) {
                                  if (value != 'USD' && value != 'GBP') {
                                    return 'Please select a currency';
                                  }
                                  return null;
                                },
                                value: selectedCurrency,
                                items: dropdownItems,
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
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedCurrency = value!;
                                  });
                                  if (amount!.isNotEmpty) {
                                    RateRequest model =
                                        RateRequest(currency: selectedCurrency);
                                    APIService.rates(model).then((response) {
                                      if (response.success) {
                                        var equivalentAmountInt =
                                            response.payload.rate *
                                                int.parse(amount!);
                                        var finalAmount =
                                            equivalentAmountInt.toString();
                                        setState(() {
                                          convertedAmount = finalAmount;
                                        });
                                      }
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: heightOfScreen * 0.03,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'You Pay',
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
                                // focusNode: _nodeText1,
                                onChanged: (text) {
                                  setState(() {
                                    _amount = text;
                                  });
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
                                  prefixText:
                                      selectedCurrency == 'GBP' ? '£' : '\$',
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
                            height: heightOfScreen * 0.03,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'You Get',
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
                            width: widthOfScreen * 0.75,
                            height: heightOfScreen * 0.055,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: FvColors.maintheme,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                width: widthOfScreen * 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '₦ ' + convertedAmount,
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
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
                                if (_formKey.currentState!.validate()) {
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
                                      ..email = _email
                                      ..currency = selectedCurrency;

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
                                              builder: (context) =>
                                                  TopupCompleted(
                                                amount: convertedAmount,
                                                success: true,
                                                message: '', sessionStateStream: widget.sessionStateStream,
                                              ),
                                            ),
                                          );
                                        } else {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TopupCompleted(
                                                amount: convertedAmount,
                                                success: false,
                                                message: value.message, sessionStateStream: widget.sessionStateStream,
                                              ),
                                            ),
                                          );
                                        }
                                      });
                                    }
                                  }
                                  // setState(
                                  //   () {
                                  //     isAPIcallProcess = true;
                                  //   },
                                  // );
                                  // TopupRequest model = TopupRequest(
                                  //   email: _email,
                                  //   amount: amount!,
                                  //   cardId: widget.id,
                                  //   currency: selectedCurrency,
                                  // );
                                  // APIService.topup(model).then(
                                  //   (response) {
                                  //     setState(() {
                                  //       isAPIcallProcess = false;
                                  //     });
                                  //     if (response.success) {
                                  //       final Uri _url = Uri.parse(
                                  //         response.payload.authorizationUrl,
                                  //       );
                                  //       void _launchUrl() async {
                                  //         if (!await launchUrl(_url)) {
                                  //           FormHelper.showSimpleAlertDialog(
                                  //             context,
                                  //             '',
                                  //             'Network Timeout',
                                  //             'Close',
                                  //             () {
                                  //               Navigator.of(context).pop();
                                  //             },
                                  //           );
                                  //         }
                                  //       }

                                  //       _launchUrl();
                                  //     } else {
                                  //       FormHelper.showSimpleAlertDialog(
                                  //         context,
                                  //         '',
                                  //         response.message,
                                  //         'Ok',
                                  //         () {
                                  //           Navigator.of(context).pop();
                                  //         },
                                  //       );
                                  //     }

                                  //     debugPrint(response.message);
                                  //   },
                                  // );
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
            ),
    );
  }

  Future<String> getTextFromFile() async {
    var userDetails = await SharedService.loginDetails();
    var email = userDetails!.payload!.user!.email;
    return email;
  }

  Future getExchangeRate() async {
    RateRequest model = RateRequest(currency: selectedCurrency);
    ExchangeRates rateResponse = await APIService.rates(model);
    int rate = rateResponse.payload.rate;
    return rate;
  }
}
