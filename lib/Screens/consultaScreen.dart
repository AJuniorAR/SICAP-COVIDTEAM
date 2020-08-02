import 'package:flutter/material.dart';
//import 'package:users_app/Servicios/recibo.dart';
import 'package:sicap_covid/Screens/recibo/recibos_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicap_covid/style/estiloBtmas.dart';
import 'package:sicap_covid/style/estilosLetras.dart';
import 'package:sicap_covid/paintBackground/backgroundSec.dart';

class MyConsultaScreen extends StatefulWidget {
  @override
  _MyConsultaScreenState createState() => _MyConsultaScreenState();
}

class _MyConsultaScreenState extends State<MyConsultaScreen> {
  String selected = 'Nombre';

  var _txtIdUsuario = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double altura=MediaQuery.of(context).size.height;
    return
         Scaffold(
           resizeToAvoidBottomPadding: false,
           backgroundColor: Colors.transparent,
           body: SafeArea(

            child:new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            child: Center(
              child: SingleChildScrollView(
                child: Stack(

                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.65,
                      //margin: EdgeInsets.only(top:( altura*0.25)/2) ,
                      decoration: BoxDecoration(

                          color: const Color(0xffFFB30F),
                          borderRadius: new BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                              bottomLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0)
                          )),
                    ),
                    new Container(

                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.62,
                        //margin: EdgeInsets.only(bottom: 10),
                        //margin: EdgeInsets.only(top:( altura*0.25)/2) ,
                        decoration: BoxDecoration(

                            color: const Color(0xffF8F8F8),
                            borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0)
                            )),

                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 60),
                                  child: new Text(
                                    'Consultas',
                                    style: GoogleFonts.bungee(
                                        fontSize: 30.0, color: const Color(0xff26449D)),
                                    //textAlign: TextAlign.left,
                                  ),
                                ),

                                _buildTipoOpcion(),
                                _buildOpcion(selected),
                                _buildConsultarButton(context)
                              ],
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
            ),
        ),
         );
  }

  Widget _buildOpcion(String value) {

    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 47,
      decoration: _buildBoxDecoration(0, 15),
      child: TextFormField(
        controller: _txtIdUsuario,
        validator: (value) => value.isEmpty ? "Debe ingresar algo" : null,
        style: GoogleFonts.montserrat(),
        decoration: _buildInputDecoration(value),
      ),
    );
  }

  Widget _buildConsultarButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 50,
          bottom:15
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 47,
      decoration: _buildBoxDecoration(0, 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: RaisedButton(
            //shape: StadiumBorder(),
            child: Text(
              'CONSULTAR',
              style:
                  GoogleFonts.bungee(color: textBtnPrincipal, fontSize: 15.0),
            ),
            color: contentBtnPrincipal,
            elevation: 4.0,
            onPressed: () {
//          _validateAndSubmit();
              setState(() {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            new ProductsScreen(idalumno: _txtIdUsuario.text)));
                //_logueado = true;
              });
            }),
      ),
    );
  }

  Widget _buildTipoOpcion() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 50.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 47,
      decoration: _buildBoxDecoration(0xffFFB30F, 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          style: GoogleFonts.montserrat(
              fontSize: 15,
              color: textDropBtn,
              textStyle: TextStyle(fontWeight: FontWeight.bold)),
          elevation: 4,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          iconSize: 40,
          isExpanded: true,
          autofocus: true,
          isDense: true,
          items: <String>['Nombre', 'Codigo'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
              ),
            );
          }).toList(),
          value: selected,
          onChanged: (String value) {
            setState(() {
              selected = value;
              //valor = value;
            });
          },
          dropdownColor: contentBtnPrincipal,
        ),
      ),
    );
  }
}

BoxDecoration _buildBoxDecoration(int _color, double radio) {
  Color color = new Color(_color);
  return BoxDecoration(
    color: color,
    borderRadius: new BorderRadius.circular(radio),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 0.2,
        blurRadius: 10,
        offset: Offset(0, 1),
      )
    ],
  );
}

InputDecoration _buildInputDecoration(String hint) {
  return InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(15.0),
      ),
    ),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    hintText: hint,
    hintStyle: GoogleFonts.montserrat(
      fontSize: 12,
      color: textColor,
    ),
    fillColor: Colors.white,
  );
}
