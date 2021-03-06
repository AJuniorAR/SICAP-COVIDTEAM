import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicap_covid/widget_routes/navigatorTab.dart';
import '../Screens/login.dart';

class SplashScreen extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => SplashScreen(),
    );
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), _onShowLogin);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onShowLogin() {
    if (mounted) {
      Navigator.of(context).pushReplacement(MyLogin.route());
    }
  }

  /*void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    if (status) {
      Navigator.pushReplacement(context, MyNavigator.route());
    } else {
      Navigator.pushReplacement(context, MyLogin.route());
    }
  }*/

  @override
  /*Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
*/
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo[700],
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Flexible(
            flex: 2,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  //child: Icon(Icons.account_box),
                  //child: Image.asset('assets/white_logo.png'),
                ),
              ),
            ),
          ),
          Text(
            'Bienvenido',
            style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.white),
          ),
          Flexible(
            flex: 2,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 16.0),
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

/*class MainPage extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => MainPage(),
    );
  }

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  checkLoginStatus();
  }

  /* checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SplashScreen()),
          (Route<dynamic> route) => false);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Container();
  }*/
}
