import 'package:flutter/material.dart';
import 'package:users_app/widget_routes/navigatorTab.dart';

import '../Servicios/consultar.dart';

class MyLogin extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => MyLogin(),
    );
  }

  @override
  _MyLoginState createState() => _MyLoginState();
}

class Tipo_User {
  int id;
  String tipo;
  Tipo_User(this.id, this.tipo);
  static List<Tipo_User> getUsers() {
    return <Tipo_User>[
      Tipo_User(1, 'Estudiante'),
      Tipo_User(2, 'Administrativo')
    ];
  }
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
    return Container(
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
                padding: EdgeInsets.only(top: 10, left: 10),
                // color: Colors.green,
                child: Align(
                    alignment: FractionalOffset(0.0, 1.0),
                    child: Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 25,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(top: 5, left: 10),
                //color: Colors.yellow,
                child: Align(
                    alignment: FractionalOffset(0.0, 1.0),
                    child: Text(
                      'Prueba de login',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 20,
                        color: const Color(0xff959595),
                      ),
                      textAlign: TextAlign.left,
                    )),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Image.asset(
                  'assets/sigap.png',
                  scale: 2.2,
                ),
              ),
              /*Container(
                  padding: EdgeInsets.all(5.5),
                  margin: EdgeInsets.all(15),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  child: TextField(
                    decoration: new InputDecoration(
                      hintText: 'Usuario',
                      icon: new Icon(Icons.account_box),
                      contentPadding: new EdgeInsets.all(0.0),

                      //prefixIcon: new Icon(Icons.accessibility_new),
                    ),
                  ),
                ),*/
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
                    value: _selectedUser,
                    items: _dropdownMenuItems,
                    onChanged: onChangeDropdownItem,
                    dropdownColor: const Color(0xff4054A0),
                  ),
                ),
              ),
              _buildUser(),
              _buildPassword(),
              Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 15,
                        color: const Color(0xff898989),
                      ),
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
              _buildIngresarButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUser() {
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
        validator: (value) => value.isEmpty ? "Debe ingresar su usuario" : null,
        style: TextStyle(fontFamily: 'Open Sans'),
        decoration: _buildInputDecoration("Usuario"),
      ),
    );
  }

  Widget _buildPassword() {
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
        obscureText: true,
        validator: (value) =>
            value.length <= 2 ? "Debe ingresar su contraseña" : null,
        style: TextStyle(
            color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'Open Sans'),
        decoration: _buildInputDecoration("Contraseña"),
      ),
    );
  }

  Widget _buildIngresarButton(BuildContext context) {
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
              'INGRESAR',
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
                _logueado = true;
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
