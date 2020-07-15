import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicap_covid/constants.dart';
import 'package:http/http.dart' as http;
import 'package:sicap_covid/paintBackground/backgroundSec.dart';
import 'recibosBody.dart';
import 'package:sicap_covid/models/recibo.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends StatelessWidget {
  final String idalumno;

  const ProductsScreen({Key key, this.idalumno}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: kPrimaryColor,
      body: new CustomPaint(
        painter: ShapePainter2(),
        child: FutureBuilder<List<Recibo>>(
          future: fetchVouchers(http.Client(), idalumno),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('error al parsear:' + snapshot.error);
            }
            return snapshot.hasData
                ? Body(recibos: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Text(
          'Documentos del Alumno',
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.left,
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/notification.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}
