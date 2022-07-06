// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '/models/request_account_details.dart';
import '../cardList/cardlist.dart';
import 'widgets/banks_modal.dart';
import 'widgets/cards_modal.dart';
import '../sendmoney/chooseTransferType.dart';
import '/services/api_service.dart';
import '/../ui/export.dart';
import '../../widgets/slider.dart';

class TransfertoBank extends StatefulWidget {
  final String amount;
  const TransfertoBank({Key? key, required this.amount}) : super(key: key);

  @override
  _TransfertoBankState createState() => _TransfertoBankState();
}

class _TransfertoBankState extends State<TransfertoBank> {
  late Future<CardList> selectedCard;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isAPIcallProcess = true;
  String? bankName;
  String cardNumPlaceholder = 'Click to select card';
  String bankPlaceholder = 'Click to select bank';
  String? accountNumber = '';
  String? code = '';
  String accountNamePlaceholder = '';
  String? narration = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
        if (accountNumber!.length >= 10 && code!.isNotEmpty) {
          if (accountNamePlaceholder != 'Account not found' &&
              accountNamePlaceholder != 'Please wait...') {
            setState(
              () {
                accountNamePlaceholder = 'Please wait...';
              },
            );
            RequestAccountDetails model = RequestAccountDetails(
              bankCode: code!,
              accountNumber: accountNumber!,
            );
            APIService.accountDetails(model).then(
              (response) {
                if (response!.success) {
                  setState(
                    () {
                      accountNamePlaceholder =
                          response.payload.details.accountName;
                    },
                  );
                } else {
                  setState(() {
                    accountNamePlaceholder = 'Account not found';
                  });
                }
              },
            );
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: FvColors.edittext51Background,
        body: Column(
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
                          page: TransferType(
                            amount: widget.amount,
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
                  'Transfer to bank account',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: FvColors.textview50FontColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightOfScreen * 0.1,
            ),
            SizedBox(
              height: heightOfScreen * 0.025,
              child: Padding(
                padding: EdgeInsets.only(left: widthOfScreen * 0.13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Card',
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
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: FvColors.maintheme),
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    width: widthOfScreen * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widthOfScreen * 0.6,
                          child: Text(
                            cardNumPlaceholder,
                            style: GoogleFonts.inconsolata(
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
                onTap: () async {
                  var cardSelected = await showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (context) => CardsModal(),
                  );
                  setState(
                    () {
                      cardSelected != null
                          ? cardNumPlaceholder = cardSelected[1]
                          : cardNumPlaceholder = 'No card selected';
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.03,
            ),
            SizedBox(
              height: heightOfScreen * 0.025,
              child: Padding(
                padding: EdgeInsets.only(left: widthOfScreen * 0.13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bank Name',
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
              child: GestureDetector(
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
                        SizedBox(
                          width: widthOfScreen * 0.6,
                          child: Text(
                            bankPlaceholder,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
                onTap: () async {
                  var bankSelected = await showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (context) => BanksModal(),
                  );
                  setState(
                    () {
                      bankSelected != null
                          ? bankPlaceholder = bankSelected[0]
                          : bankPlaceholder = 'No bank selected';
                    },
                  );
                  setState(
                    () {
                      bankSelected != null ?
                      code = bankSelected[1]
                      :code = null;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.03,
            ),
            SizedBox(
              height: heightOfScreen * 0.025,
              child: Padding(
                padding: EdgeInsets.only(left: widthOfScreen * 0.13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Number',
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
                child: TextField(
                  // focusNode: _nodeText1,
                  onChanged: (text) {
                    accountNumber = text;
                  },
                  maxLength: 10,
                  maxLengthEnforcement:
                      MaxLengthEnforcement.truncateAfterCompositionEnds,
                  keyboardType: TextInputType.number,
                  // textInputAction: TextInputAction.continueAction,
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
                    hintText: 'Enter the account number',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.025,
              child: Padding(
                padding: EdgeInsets.only(left: widthOfScreen * 0.13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Name',
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
                        accountNamePlaceholder,
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
              height: heightOfScreen * 0.03,
            ),
            SizedBox(
              height: heightOfScreen * 0.025,
              child: Padding(
                padding: EdgeInsets.only(left: widthOfScreen * 0.13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Narration',
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
              child: TextFormField(
                // focusNode: _nodeText2,
                onChanged: (text) {
                  narration = text;
                },
                maxLengthEnforcement:
                    MaxLengthEnforcement.truncateAfterCompositionEnds,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
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
                  hintText: 'Narration',
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.1,
            ),
            FormHelper.submitButton(
              'Continue',
              () {
                FormHelper.showSimpleAlertDialog(
                  context,
                  '',
                  'Confirm transfer of ${NumberFormat.currency(
                    name: '₦ ',
                    decimalDigits: 2,
                  ).format(int.parse(widget.amount))} to $accountNamePlaceholder',
                  'OK',
                  () {
                    Navigator.of(context).pop();
                  },
                );
              },
              btnColor: FvColors.maintheme,
              borderColor: Colors.white,
              txtColor: Colors.white,
            ),
          ],
        ),
      ),
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
