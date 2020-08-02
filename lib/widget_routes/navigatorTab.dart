import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicap_covid/Screens/consultaScreen.dart';
import 'package:sicap_covid/Screens/homeScreen.dart';
import 'package:sicap_covid/Screens/login.dart';
import 'package:sicap_covid/Screens/pagoScreen.dart';
import 'package:sicap_covid/Screens/reciboScreen.dart';
import 'package:sicap_covid/Screens/splashScreen.dart';
import 'package:sicap_covid/constants.dart';
import 'package:sicap_covid/paintBackground/backgroundSec.dart';
import 'package:bmnav/bmnav.dart' as bmnav;

class MyNavigator extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => MyNavigator(),
    );
  }

  @override
  _MyNavigatorState createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator>
    with SingleTickerProviderStateMixin {
  String idalumno;
  SharedPreferences sharedPreferences;
//----------------------------------------------------------
  AnimationController animationcontroller;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationcontroller);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationcontroller);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationcontroller);

    rotationAnimation = Tween(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationcontroller, curve: Curves.easeOut));
    super.initState();
    animationcontroller.addListener(() {
      setState(() {});
    });
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SplashScreen()),
          (Route<dynamic> route) => false);
    }
  }

  final List<Widget> screens = [
    MyHome(),
    MyConsultaScreen(),
    MyRecibo(),
    MyPago()
  ];

  Widget currentScreen = MyHome();

  int _widgetIndex = 0;

  /*Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => SplashScreen()),
        (Route<dynamic> route) => false);
  }*/

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return Scaffold(
      body: CustomPaint(
        painter: ShapePainter2(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              new IndexedStack(
                children: screens,
                index: _widgetIndex,
              ),
              new Positioned(
                right: 30,
                bottom: 30,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    IgnorePointer(
                      child: Container(
                        //color: Colors.black.withOpacity(0.5), // comment or change to transparent color
                        height: 150.0,
                        width: 150.0,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(getRadiansFromDegree(270),
                          degOneTranslationAnimation.value * 100),
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value))
                          ..scale(degOneTranslationAnimation.value),
                        alignment: Alignment.center,
                        child: CircularButtom(
                          color: const Color(0xff5F3DB7),
                          width: 50,
                          height: 50,
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          onClick: () {},
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(getRadiansFromDegree(225),
                          degTwoTranslationAnimation.value * 100),
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value))
                          ..scale(degOneTranslationAnimation.value),
                        alignment: Alignment.center,
                        child: CircularButtom(
                          color: const Color(0xff5F79C6),
                          width: 50,
                          height: 50,
                          icon: Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          onClick: () {
                            sharedPreferences.clear();
                            sharedPreferences.commit();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SplashScreen()),
                                (Route<dynamic> route) => false);
                          },
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(getRadiansFromDegree(180),
                          degThreeTranslationAnimation.value * 100),
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value))
                          ..scale(degOneTranslationAnimation.value),
                        alignment: Alignment.center,
                        child: CircularButtom(
                          color: const Color(0xffFF820F),
                          width: 50,
                          height: 50,
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          onClick: () {},
                        ),
                      ),
                    ),
                    CircularButtom(
                      color: const Color(0xff0C8A9C),
                      width: 60,
                      height: 60,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onClick: () {
                        if (animationcontroller.isCompleted) {
                          animationcontroller.reverse();
                        } else {
                          animationcontroller.forward();
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bmnav.BottomNav(
        index: _widgetIndex,
        onTap: (i) {
          setState(() {
            _widgetIndex = i;
            currentScreen = screens[i];
          });
        },
        labelStyle: bmnav.LabelStyle(visible: false),
        iconStyle:
            bmnav.IconStyle(onSelectSize: 32.0, onSelectColor: kBlueColor),
        items: [
          bmnav.BottomNavItem(Icons.home, label: 'Home'),
          bmnav.BottomNavItem(Icons.search, label: 'Workouts'),
          bmnav.BottomNavItem(Icons.receipt, label: 'Account'),
          bmnav.BottomNavItem(Icons.payment, label: 'Settings')
        ],
        //color: Colors.white,
      ),
    );
  }
}

class CircularButtom extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  const CircularButtom(
      {Key key, this.width, this.height, this.color, this.icon, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}
