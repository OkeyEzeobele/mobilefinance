// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, file_names
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:o3_cards/pages/sendmoney/chooseTransferType.dart';
// import 'package:o3_cards/pages/cardList/widgets/bottomModal.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../widgets/slider.dart';

class TransfertoBank extends StatefulWidget {
  final String amount;
  const TransfertoBank({Key? key, required this.amount}) : super(key: key);

  @override
  _TransfertoBankState createState() => _TransfertoBankState();
}

class _TransfertoBankState extends State<TransfertoBank> {
  String? bankName;
  String? testField;
  List<dynamic> productTypesList = [];
  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    this.productTypesList.add({"id": "404", "name": "Simple"});
    // this.productTypesList.add({"id": "variable", "name": "Variable"});
    return Scaffold(
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
            height: heightOfScreen * 0.2,
          ),
          SizedBox(
            width: widthOfScreen * 0.8,
            child: FormHelper.dropDownWidgetWithLabel(
              context,
              'From Card',
              'Select a card to use',
              '',
              productTypesList,
              (onChangedVal) {},
              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Please select a card';
                }
                return null;
              },
              labelFontSize: 12,
              borderFocusColor: FvColors.maintheme,
              prefixIconColor: FvColors.maintheme,
              borderColor: Colors.grey,
              borderRadius: 10,
              paddingLeft: 0,
              paddingRight: 0,
            ),
          ),
          SizedBox(
            height: heightOfScreen * 0.03,
          ),
          SizedBox(
            width: widthOfScreen * 0.8,
            child: FormHelper.inputFieldWidgetWithLabel(
              context,
              "Account",
              "Account Number",
              "",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Please enter account number';
                }

                return null;
              },
              (onSavedVal) => {
                testField = onSavedVal,
              },
              initialValue: '',
              labelFontSize: 12,
              obscureText: false,
              borderFocusColor: FvColors.maintheme,
              prefixIconColor: FvColors.maintheme,
              borderColor: Colors.grey,
              borderRadius: 10,
              paddingLeft: 0,
              paddingRight: 0,
              showPrefixIcon: false,
              prefixIcon: Icon(Icons.web),
              onChange: (val) {},
            ),
          ),
          SizedBox(
            height: heightOfScreen * 0.03,
          ),
          SizedBox(
            width: widthOfScreen * 0.8,
            child: FormHelper.inputFieldWidgetWithLabel(
              context,
              "Account Name",
              "Account Name",
              "",
              (onValidateVal) {
                return null;
              },
              (onSavedVal) => {
                bankName = onSavedVal,
              },
              initialValue: '',
              labelFontSize: 12,
              obscureText: false,
              borderFocusColor: FvColors.maintheme,
              prefixIconColor: FvColors.maintheme,
              borderColor: Colors.grey,
              borderRadius: 10,
              paddingLeft: 0,
              paddingRight: 0,
              showPrefixIcon: false,
              prefixIcon: Icon(Icons.web),
              onChange: (val) {},
            ),
          ),
        ],
      ),
    );
  }
}
