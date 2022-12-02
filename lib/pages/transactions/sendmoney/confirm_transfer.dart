// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'dart:convert';

import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:o3_cards/pages/transactions/sendmoney/transfer_to_bank.dart';
import 'package:o3_cards/ui/export.dart';

import '../../../models/transfer_request.dart';
import '../../../services/api_service.dart';
import 'transfer_complete.dart';

class ConfirmTransfer extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  final String amount;
  final String recepient;
  final String bankName;
  final String bankCode;
  final int cardId;
  final String cifNumber;
  final String accountNumber;
  final String narration;
  final String accountName;

  const ConfirmTransfer(
      {Key? key,
      required this.amount,
      required this.recepient,
      required this.bankName,
      required this.bankCode,
      required this.cardId,
      required this.cifNumber,
      required this.accountNumber,
      required this.narration,
      required this.accountName, required this.sessionStateStream})
      : super(key: key);

  @override
  _ConfirmTransferState createState() => _ConfirmTransferState();
}

class _ConfirmTransferState extends State<ConfirmTransfer> {
  String pin = '';
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TransfertoBank(
        amount: widget.amount, sessionStateStream: widget.sessionStateStream,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: widthOfScreen * 0.05,
                  top: heightOfScreen * 0.05,
                ),
                child: TextButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: FvColors.maintheme,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(_createRoute());
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Pay ${widget.accountName}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: FvColors.textview50FontColor,
                    ),
                  ),
                  Text(
                    '${widget.bankName}: ${widget.accountNumber}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: FvColors.textview50FontColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: PinAuthentication(
              submitLabel: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    color: FvColors.maintheme,
                    borderRadius: BorderRadius.circular(150)),
                child: Center(
                  child: Text(
                    'Complete',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onbuttonClick: () {
                if (pin.length == 4) {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) =>
                          TransferLoading(
                        accountName: widget.accountName,
                        accountNumber: widget.accountNumber,
                        amount: widget.amount,
                        bankCode: widget.bankCode,
                        bankName: widget.bankName,
                        cardId: widget.cardId,
                        cifNumber: widget.cifNumber,
                        narration: widget.narration,
                        recepient: widget.recepient,
                        pin: pin,
                      ),
                    ),
                  );
                }
              },
              onChanged: (v) {
                setState(() {
                  pin = v;
                });

                // if (kDebugMode) {
                //   print(pin);
                // }
              },
              // submitLabel: Text('Finish'),
              action: '₦${widget.amount}\n\n',
              actionDescription:
                  'Please enter your pin to complete this transaction',
              pinTheme: PinTheme(
                inactiveFillColor: FvColors.offwhitepink2,
                activeFillColor: FvColors.offwhitepink2,
                selectedColor: FvColors.offwhitepink2,
                activeColor: FvColors.offwhitepink2,
                keysColor: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                selectedFillColor: FvColors.offwhitepink2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransferLoadingWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  final String amount;
  final String recepient;
  final String bankName;
  final String bankCode;
  final int cardId;
  final String cifNumber;
  final String accountNumber;
  final String narration;
  final String accountName;
  final String pin;
  const TransferLoadingWrapper(
      {Key? key,
      required this.onInit,
      required this.child,
      required this.amount,
      required this.recepient,
      required this.bankName,
      required this.bankCode,
      required this.cardId,
      required this.cifNumber,
      required this.accountNumber,
      required this.narration,
      required this.accountName,
      required this.pin})
      : super(key: key);
  @override
  _TransferLoadingWrapperState createState() => _TransferLoadingWrapperState();
}

class _TransferLoadingWrapperState extends State<TransferLoadingWrapper> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class TransferLoading extends StatelessWidget {
  final String amount;
  final String recepient;
  final String bankName;
  final String bankCode;
  final int cardId;
  final String cifNumber;
  final String accountNumber;
  final String narration;
  final String accountName;
  final String pin;
  const TransferLoading(
      {Key? key,
      required this.amount,
      required this.recepient,
      required this.bankName,
      required this.bankCode,
      required this.cardId,
      required this.cifNumber,
      required this.accountNumber,
      required this.narration,
      required this.accountName,
      required this.pin,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionStateStream = StreamController<SessionState>();
    return TransferLoadingWrapper(
      onInit: () {
        TransferRequest model = TransferRequest(
          amount: int.parse(amount),
          pin: pin,
          recepient: 'bank',
          cardId: cardId,
          cifNumber: '',
          bankCode: bankCode,
          bankName: bankName,
          accountNumber: accountNumber,
          narration: narration,
        );
        debugPrint(jsonEncode(model));
        APIService.transfer(model).then(
          (response) {
            debugPrint(jsonEncode(response));
            if (response.success) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TransferCompleted(
                    message: response.message,
                    amount: amount,
                    recepient: accountName,
                    success: true, sessionStateStream: sessionStateStream
                  ),
                ),
              );
            } else {
              Navigator.pushReplacement(
                
                context,
                MaterialPageRoute(
                  builder: (context) => TransferCompleted(
                    message: response.message,
                    amount: amount,
                    recepient: accountName,
                    success: false, sessionStateStream: sessionStateStream,
                  ),
                ),
              );
            }
          },
        );
      },
      accountName: accountName,
      accountNumber: accountNumber,
      amount: amount,
      bankCode: bankCode,
      bankName: bankName,
      cardId: cardId,
      cifNumber: cifNumber,
      narration: narration,
      recepient: recepient,
      pin: pin,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.85),
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text(
                    "Please enter a valid amount",
                    style: TextStyle(),
                  ),
                ),
              );
            },
            child: Image.asset(
              'assets/loadinganimation4.gif',
              width: 220,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
