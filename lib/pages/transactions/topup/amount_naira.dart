// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:o3_cards/models/topup_request.dart';
import 'package:o3_cards/pages/transactions/topup/fund_card.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:o3_cards/services/api_service.dart';
import 'package:o3_cards/services/shared_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/slider.dart';
import '/ui/export.dart';
// import 'package:intl/intl.dart';

class AmountNaira extends StatefulWidget {
  final bool isDialog;
  final int id;

  const AmountNaira({Key? key, this.isDialog = false, required this.id})
      : super(key: key);

  @override
  _AmountNairaState createState() => _AmountNairaState();
}

class _AmountNairaState extends State<AmountNaira> {
  @override
  void initState() {
    super.initState();
  }

  bool isAPIcallProcess = false;
  final _formKey = GlobalKey<FormState>();
  final FocusNode _nodeText1 = FocusNode();
  String? amount = '';
  String _email = '';
  _AmountNairaState() {
    getTextFromFile().then(
      (val) => setState(
        () {
          _email = val;
        },
      ),
    );
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
                                  id: widget.id,
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
                                amount = text;
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(
                                  () {
                                    isAPIcallProcess = true;
                                  },
                                );
                                TopupRequest model = TopupRequest(
                                  email: _email,
                                  amount: amount!,
                                  cardId: widget.id,
                                  currency: 'NGN',
                                );
                                APIService.topup(model).then(
                                  (response) {
                                    setState(() {
                                      isAPIcallProcess = false;
                                    });
                                    if (response.success) {
                                      final Uri _url = Uri.parse(
                                        response.payload.authorizationUrl,
                                      );
                                      void _launchUrl() async {
                                        if (!await launchUrl(_url)) {
                                          FormHelper.showSimpleAlertDialog(
                                            context,
                                            '',
                                            'Network Timeout',
                                            'Close',
                                            () {
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        }
                                      }

                                      _launchUrl();
                                    } else {
                                      FormHelper.showSimpleAlertDialog(
                                        context,
                                        '',
                                        response.message,
                                        'Ok',
                                        () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }

                                    debugPrint(response.message);
                                  },
                                );
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
