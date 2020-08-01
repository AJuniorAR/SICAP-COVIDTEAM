import 'package:flutter/material.dart';
import 'dart:ui';
//import 'dart:math' as math;
//import 'package:google_fonts/google_fonts.dart';

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = const Color(0xffF7F8FA);
    canvas.drawPath(mainBackground, paint);

    Path circulo1 = circulo(380, 6, 61.0);
    Path circulo2 = circulo(20, 10, 99.0);
    Path circulo3 = circulo(280, 170, 28.0);
    Path circulo4 = circulo(-20, 450, 61.0);
    Path circulo5 = circulo(381, 520, 105.0);
    Path circulo6 = circulo(100, 701, 83.0);
    List<Path> lista = [
      circulo1,
      circulo2,
      circulo3,
      circulo4,
      circulo5,
      circulo6
    ];
    paint.color = Colors.white;

    for (var item in lista) {
      canvas.drawPath(item, paint);
    }

//---------------------------------------------------------------
    Path principalBk = Path();
    double distancia = size.height * 0.2;

    principalBk.moveTo(0, 0);
    principalBk.lineTo(size.height * 0.5, size.height * 0.5);
    principalBk.lineTo(0, size.height);
    principalBk.lineTo(0, size.height * 0.8);
    principalBk.lineTo(size.height * 0.5 - distancia, size.height * 0.5);
    principalBk.lineTo(0, size.height * 0.2);
    paint.color = const Color(0xff1F4698);

    principalBk.close();
    canvas.drawPath(principalBk, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Path circulo(double x, double y, double radio) {
  var path = Path();
  path.addOval(Rect.fromCircle(
    center: Offset(x, y),
    radius: radio,
  ));

  return path;
}
