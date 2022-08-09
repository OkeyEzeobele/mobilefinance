// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:o3_cards/pages/transactions/sendmoney/choose_transfer_type.dart';
import '/ui/export.dart';
import '/widgets/numpad.dart';
// import 'package:intl/intl.dart';

class Sendmoney extends StatefulWidget {
  const Sendmoney({Key? key}) : super(key: key);

  @override
  _SendmoneyState createState() => _SendmoneyState();
}

class _SendmoneyState extends State<Sendmoney> {
  final TextEditingController _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox.square(
          dimension: heightOfScreen * 0.08,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: widthOfScreen * 0.5,
                  child: FittedBox(
                    child: Text(
                      'Amount you want to send',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: FvColors.textview50FontColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox.square(
          dimension: heightOfScreen * 0.2,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: heightOfScreen * 0.1,
            child: Center(
              child: TextField(
                // inputFormatters: [
                //   LengthLimitingTextInputFormatter(9)
                // ],
                controller: _myController,
                textAlign: TextAlign.center,
                showCursor: false,
                style: TextStyle(
                  fontSize: 30,
                ),
                decoration: InputDecoration(
                  prefixIcon: Text('₦'),
                  prefixStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
                // Disable the default soft keybaord
                keyboardType: TextInputType.none,
              ),
            ),
          ),
        ),
        NumPad(
          buttonSize: 75,
          buttonColor: FvColors.maintheme,
          iconColor: FvColors.maintheme,
          controller: _myController,
          delete: () {
            _myController.text = _myController.text.substring(
              0,
              _myController.text.length - 1,
            );
          },
          onSubmit: () {
            if (_myController.text.isEmpty){
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text(
                    "Please enter a valid amount",
                    style: TextStyle(),
                  ),
                ),
              );
            }
            else if (_myController.text[0] == '0'){
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text(
                    "Please enter a valid amount",
                    style: TextStyle(),
                  ),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TransferType(amount: _myController.text),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
