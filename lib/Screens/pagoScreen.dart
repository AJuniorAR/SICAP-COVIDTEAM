import 'package:flutter/material.dart';
import 'package:sicap_covid/paintBackground/backgroundSec.dart';

class MyPago extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ShapePainter2(),
        child: new Container(
          child: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[new Text("Trabajando ...")],
            ),
          ),
        ),
      ),
    );
  }
}
