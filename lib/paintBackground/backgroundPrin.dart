import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

import 'package:sicap_covid/style/colorBack.dart';
//import 'package:google_fonts/google_fonts.dart';

class ShapePainter extends CustomPainter {
  Color color1 = color_fondo;
  Color color2 = color_circulos;
  bool dibujar = true;
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = color1;
    canvas.drawPath(mainBackground, paint);
//----------------------------------------------------------------
    /* Path flechita = Path();
    var angle = (math.pi * 2) / sides;
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    flechita.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      flechita.lineTo(x, y);
    }
    paint.color = Colors.white;
    flechita.close();
    canvas.drawPath(flechita, paint);*/
//---------------------------------------------------------------

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
    paint.color = color2;

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
    if (dibujar = true) {
      canvas.drawPath(principalBk, paint);
    }
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
