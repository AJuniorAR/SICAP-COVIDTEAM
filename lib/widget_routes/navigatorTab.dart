import 'package:flutter/material.dart';
import 'package:sicap_covid/Screens/consultaScreen.dart';
import 'package:sicap_covid/Screens/homeScreen.dart';
import 'package:sicap_covid/Screens/pagoScreen.dart';
import 'package:sicap_covid/Screens/reciboScreen.dart';

class MyNavigator extends StatefulWidget {
  @override
  _MyNavigatorState createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        children: <Widget>[
          new MyHome(),
          new MyConsultaScreen(),
          new MyRecibo(),
          new MyPago()
        ],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          labelColor: Colors.indigo[900],
          unselectedLabelColor: const Color(0xff898989),
          indicatorColor: Colors.indigo[900],
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.home)),
            new Tab(icon: Icon(Icons.search)),
            new Tab(icon: Icon(Icons.receipt)),
            new Tab(icon: Icon(Icons.payment))
          ],
          controller: controller,
        ),
      ),
    );
  }
}
