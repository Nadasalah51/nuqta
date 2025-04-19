import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nuqta/screens/firstpage.dart';
import 'package:nuqta/screens/forgetnumber.dart';
import 'package:nuqta/screens/homepage.dart';
import 'package:nuqta/screens/loginscreen.dart';
import 'package:nuqta/screens/profile_screen.dart';
import 'package:nuqta/screens/request.dart';
import 'package:nuqta/screens/signupscreen.dart';
import 'package:nuqta/screens/verifyscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      routes: {
        'firstpage': (context) => Firstpage(),
        'homepage': (context) => Homepage(),
        'loginscreen': (context) => Loginscreen(),
        'forgetnumber': (context) => Forgetnumber(),
        'signup': (context) => Signupscreen(),
        'verifyscreen': (context) => Verifyscreen(),
        'request': (context) => Request(),
        'profile': (context) => ProfileScreen(),
      },
      home: Firstpage(),
    );
  }
}
