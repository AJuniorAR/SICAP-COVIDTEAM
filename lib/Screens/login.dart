import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicap_covid/paintBackground/backgroundPrin.dart';
import 'package:sicap_covid/style/estiloBtmas.dart';
import 'package:sicap_covid/style/estilosLetras.dart';
import 'package:sicap_covid/widget_routes/navigatorTab.dart';
import 'package:sicap_covid/clases/tipoUsuario.dart';
import 'package:sicap_covid/style/estilosLetras.dart';

import 'package:sicap_covid/style/estiloBtmas.dart';

// import '../Servicios/consultar.dart';

class MyLogin extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => MyLogin(),
    );
  }

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> with SingleTickerProviderStateMixin {
  bool _logueado = false;
  List<Tipo_User> _users = Tipo_User.getUsers();
  List<DropdownMenuItem<Tipo_User>> _dropdownMenuItems;
  Tipo_User _selectedUser;

  void initState() {
    _dropdownMenuItems = buildDropDownMenuItem(_users);
    _selectedUser = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Tipo_User>> buildDropDownMenuItem(List users) {
    List<DropdownMenuItem<Tipo_User>> items = List();
    for (Tipo_User tipo_user in users) {
      items.add(
        DropdownMenuItem(
          value: tipo_user,
          child: Text(tipo_user.tipo),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Tipo_User selectedTipo) {
    setState(() {
      _selectedUser = selectedTipo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //resizeToAvoidBottomInset: false,
      //backgroundColor: const Color(0xffF8F8F8),
      body: _logueado ? MyNavigator() : loginForm(),
    );
  }

  Widget loginForm() {
    return CustomPaint(
      painter: ShapePainter(),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: SafeArea(
          //padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        bottom: MediaQuery.of(context).size.height * 0.1),
                    child: Text(
                      'SIGAP',
                      style: GoogleFonts.bungee(
                          fontSize: 50.0, color: const Color(0xff26449D)),
                      textAlign: TextAlign.left,
                    )),
                _buildTipoUsuario(),
                _buildUser(),
                _buildPassword(),
                _buildIngresarButton(context),
                Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15,
                      bottom: 10,
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: GoogleFonts.montserrat(
                            fontSize: 12.0, color: textColor),
                        children: [
                          TextSpan(
                            text: 'Olvidaste tu contraseña?',
                          ),
                          TextSpan(
                            text: ' Clíck aquí',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUser() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: _buildBoxDecoration(0, 15),
      child: TextFormField(
        validator: (value) => value.isEmpty ? "Debe ingresar su usuario" : null,
        style: GoogleFonts.montserrat(),
        decoration: _buildInputDecoration("Usuario"),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: _buildBoxDecoration(0, 15),
      child: TextFormField(
        obscureText: true,
        validator: (value) =>
            value.length <= 2 ? "Debe ingresar su contraseña" : null,
        style: GoogleFonts.montserrat(),
        decoration: _buildInputDecoration("Contraseña"),
      ),
    );
  }

  Widget _buildIngresarButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: _buildBoxDecoration(0, 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: RaisedButton(
            //shape: StadiumBorder(),
            child: Text(
              "Ingresar",
              style:
                  GoogleFonts.bungee(color: textBtnPrincipal, fontSize: 15.0),
            ),
            color: contentBtnPrincipal,
            elevation: 4.0,
            onPressed: () {
//          _validateAndSubmit();
              setState(() {
                _logueado = true;
              });
            }),
      ),
    );
  }

  Widget _buildTipoUsuario() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
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
          value: _selectedUser,
          items: _dropdownMenuItems,
          onChanged: onChangeDropdownItem,
          dropdownColor: contentDropBtn,
        ),
      ),
    );
  }
}

//--------------------------------------------------------------------------------

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
