import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse_management/screens/home.dart';
import 'package:warehouse_management/screens/login.dart';
import 'package:warehouse_management/screens/splash.dart';
import 'package:warehouse_management/utils/color_palette.dart';

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warehouse Management',
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorPalette.white)),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
            return StreamBuilder<User?>(
              stream: firebaseAuth.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.data!.isAnonymous) {
                  return Home();
                } else {
                  return Login();
                }
              },
            );
          }
          return Splash();
        },
      ),
    );
  }
}
