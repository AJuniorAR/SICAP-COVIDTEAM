import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.transparent,
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[new Text("Trabajando ...")],
          ),
        ),
      );
  }
}
