import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:sicap_covid/constants.dart';
import 'package:http/http.dart' as http;
import 'programaBody.dart';
import 'package:sicap_covid/models/alumnoprograma.dart';

class ProgramaScreen extends StatelessWidget {
  final String dnialumno;

  const ProgramaScreen({Key key, this.dnialumno}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: kPrimaryColor,
      body: FutureBuilder<List<AlumnoPrograma>>(
        future: fetchVouchers(http.Client(), dnialumno),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('error al parsear:' + snapshot.error);
          }
          return snapshot.hasData
              ? ProgramaBody(programas: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text('Programas del Alumno'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
