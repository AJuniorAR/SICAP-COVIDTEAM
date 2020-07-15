import 'package:flutter/material.dart';
//import 'package:furniture_app/components/search_box.dart';
import 'package:sicap_covid/constants.dart';
//import 'package:furniture_app/models/product.dart';
import 'package:sicap_covid/screens/reciboDetails/details_screen.dart';
import 'package:sicap_covid/models/recibo.dart';
//import 'category_list.dart';
import 'recibo_card.dart';

class Body extends StatelessWidget {
  final List<Recibo> recibos;

  Body({Key key, this.recibos}) : super(key: key);

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
                  itemCount: recibos.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: recibos[index],
                    press: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryanimation) {
                              return DetailsScreen(recibo: recibos[index]);
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
