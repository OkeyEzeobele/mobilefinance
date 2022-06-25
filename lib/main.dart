import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'pages/splashscreenscreen1/splashscreenscreen1.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'O3 Cards',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // routes:{
      //   '/dashboard':(context)=> const Dashboard(),
      // },
      // debugShowCheckedModeBanner: false,
      home: const Splashscreenscreen1(),
    );
  }
}
