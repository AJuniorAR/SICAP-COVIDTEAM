import 'package:flutter/material.dart';
//import 'package:users_app/Servicios/recibo.dart';
import 'package:sicap_covid/Screens/recibo/recibos_screen.dart';

class MyConsultaScreen extends StatefulWidget {
  @override
  _MyConsultaScreenState createState() => _MyConsultaScreenState();
}

class _MyConsultaScreenState extends State<MyConsultaScreen> {
  String selected = 'Nombre';
  var _txtIdUsuario = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: new Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
                color: const Color(0xffF8F8F8),
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: new Text(
                      'Consultas',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 25,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      //textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    width: 312.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 50),
                      child: Text(
                        'Ingrese el nombre o código \ndel alumno. Elija una de las \ndos opciones antes.',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 20,
                          color: const Color(0xff898989),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 20.0),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(121, 134, 203, 1),
                      borderRadius: new BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.2,
                          blurRadius: 10,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 15,
                          color: const Color(0xffe8eaf6),
                        ),
                        elevation: 4,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: const Color(0xffe8eaf6),
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
                          });
                        },
                        dropdownColor: const Color(0xff4054A0),
                      ),
                    ),
                  ),
                  _buildOpcion(),
                  _buildConsultarButton(context)
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildOpcion() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 65.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 10,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: TextFormField(
        controller: _txtIdUsuario,
        validator: (value) => value.isEmpty ? "Debe ingresar su usuario" : null,
        style: TextStyle(fontFamily: 'Open Sans'),
        decoration: _buildInputDecoration("Usuario"),
      ),
    );
  }

  Widget _buildConsultarButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 65.0,
      decoration: BoxDecoration(
        /*color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),*/
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: RaisedButton(
            //shape: StadiumBorder(),
            child: const Text(
              'CONSULTAR',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 20,
                color: const Color(0xffe8eaf6),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            color: Color.fromRGBO(26, 35, 126, 1),
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
    hintStyle: TextStyle(
      fontFamily: 'Segoe UI',
      fontSize: 15,
      color: Color.fromRGBO(137, 137, 137, 1),
    ),
    fillColor: Colors.white,
  );
}
