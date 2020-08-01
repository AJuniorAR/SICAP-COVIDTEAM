import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;
//import 'dart:async';
//import 'dart:convert';
import 'package:sicap_covid/Screens/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Untiveros Encarnacion 16200032';

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}
