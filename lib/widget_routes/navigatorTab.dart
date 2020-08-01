import 'package:flutter/material.dart';
import 'package:sicap_covid/Screens/consultaScreen.dart';
import 'package:sicap_covid/Screens/homeScreen.dart';
import 'package:sicap_covid/Screens/pagoScreen.dart';
//import 'package:sicap_covid/Screens/reciboScreen.dart';
import 'package:sicap_covid/Screens/recibo/recibos_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:sicap_covid/style/estiloBtmas.dart';

class MyNavigator extends StatefulWidget {
  @override
  _MyNavigatorState createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator> {
  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List pages = [
    MyRoute(
      iconData: Icons.perm_identity,
      page: MyHome(),
    ),
    MyRoute(
      iconData: Icons.search,
      page: MyConsultaScreen(),
    ),
    MyRoute(
      iconData: Icons.receipt,
      page: ReciboScreen(),
    ),
    MyRoute(
      iconData: Icons.payment,
      page: MyPago(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: pages
            .map((p) => Icon(
                  p.iconData,
                  size: 30,
                ))
            .toList(),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      backgroundColor: Colors.blueAccent,
      body: pages[_pageIndex].page,
    );
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({this.iconData, this.page});
}
