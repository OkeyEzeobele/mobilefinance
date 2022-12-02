import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:o3_cards/pages/signin/loginscreen2.dart';
import 'package:o3_cards/ui/pallete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'pages/splashscreenscreen1/splashscreenscreen1.dart';
import 'services/shared_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  // SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;
  final sessionStateStream = StreamController<SessionState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final sessionConfig = SessionConfig(
      invalidateSessionForAppLostFocus: const Duration(seconds: 5),
      invalidateSessionForUserInactivity: const Duration(seconds: 600),
    );
    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
      sessionStateStream.add(SessionState.stopListening);
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
        _navigator.push(
          MaterialPageRoute(
            builder: (_) => Loginscreen2(
              sessionStateStream: sessionStateStream,
            ),
          ),
        );
        // handle user  inactive timeout
      } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        // handle user  app lost focus timeout
        _navigator.push(
          MaterialPageRoute(
            builder: (_) => Loginscreen2(
              sessionStateStream: sessionStateStream,
            ),
          ),
        );
      }
    });
    return SessionTimeoutManager(
      sessionConfig: sessionConfig,
      sessionStateStream: sessionStateStream.stream,
      child: GetMaterialApp(
          navigatorKey: _navigatorKey,
          title: 'O3 Cards',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: FvColors.maintheme,
            ),
            // primarySwatch: FvColors.maintheme,
          ),
          // routes:{
          //   '/dashboard':(context)=> const Dashboard(),
          // },
          debugShowCheckedModeBanner: false,
          home: Splashscreenscreen1(sessionStateStream: sessionStateStream)),
    );
  }
}
