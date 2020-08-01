import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicap_covid/constants.dart';
import 'package:http/http.dart' as http;
import 'recibosBody.dart';
import 'package:sicap_covid/models/recibo.dart';

class ReciboScreen extends StatelessWidget {
  final String idalumno;

  const ReciboScreen({Key key, this.idalumno}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: kPrimaryColor,
      body: FutureBuilder<List<Recibo>>(
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
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text('Documentos del Alumno'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
