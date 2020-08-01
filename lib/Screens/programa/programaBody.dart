import 'package:flutter/material.dart';
import 'package:sicap_covid/constants.dart';
import 'package:sicap_covid/models/alumnoprograma.dart';
import 'package:sicap_covid/screens/reciboDetails/details_screen.dart';
import 'package:sicap_covid/models/recibo.dart';
import '../recibo/recibo_screen.dart';
import 'programaCard.dart';

class ProgramaBody extends StatelessWidget {
  final List<AlumnoPrograma> programas;

  ProgramaBody({Key key, this.programas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          //SearchBox(onChanged: (value) {}),
          //CategoryList(),
          SizedBox(height: kDefaultPadding / 2), //genera un Espacio
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  // here we use our demo procuts list
                  itemCount: programas.length,
                  itemBuilder: (context, index) => ProgramaCard(
                    itemIndex: index,
                    programa: programas[index],
                    press: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryanimation) {
                              return ReciboScreen(programa: programas[index]);
                            },
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryanimation,
                                Widget child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            }),
                        /*MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: recibos[index],
                          ),
                        ),*/
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
