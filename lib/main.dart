import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;
//import 'dart:async';
//import 'dart:convert';
import 'package:users_app/Screens/login.dart';
import 'package:users_app/Screens/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final appTitle = 'Vouchers de JHON HAMILTON AGUILAR ROMERO';

    return MaterialApp(
      //title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}
