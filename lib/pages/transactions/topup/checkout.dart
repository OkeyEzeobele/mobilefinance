import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterbudpay/flutterbudpay.dart';
import 'package:get/get.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  var secretKey = dotenv.env['BUDPAY_SECRET_KEY']!;
  var publicKey = dotenv.env['BUDPAY_PUBLIC_KEY']!;
  final plugin = Budpay();
  var currency = ["USD", "NGN"];
  // Initial Selected Value
  String dropdownvalue = 'NGN';
  TextEditingController phoneController = TextEditingController();
  bool isloading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool check = false;

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey, secretKey: secretKey);
  }

  @override
  Widget build(BuildContext context) {
    Charge charge = Charge()
      ..amount = 10000
      ..reference = ''
      ..email = 'chimaokeyjay@gmail.com';
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          plugin.checkout(context, charge: charge, logo: Image.asset("assets/CapitalLogoIcon_ImageView_46-190x110.png"));
        },
        child: const Center(
          child: Text('data'),
        ),
      ),
    );
  }
}
