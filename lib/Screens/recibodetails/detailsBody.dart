import 'package:flutter/material.dart';
import 'package:sicap_covid/constants.dart';
//import 'package:furniture_app/models/product.dart';

//import 'chat_and_add_to_cart.dart';
//import 'list_of_colors.dart';
//import 'product_image.dart';
import 'package:sicap_covid/models/recibo.dart';

class DetailsBody extends StatelessWidget {
  final Recibo recibo;

  const DetailsBody({Key key, this.recibo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    //Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*Center(
                    child: Hero(
                        tag: '${product.idRec}',
                        child: Material(
                          child: ProductPoster(
                            size: size,
                            image:
                                'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true',
                          ),
                        )),
                  ),*/
                  //ListOfColors(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 2),
                    child: Text(
                      recibo.nomPrograma,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    '\$${recibo.importe}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                    ),
                  ),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                    child: Text(
                      recibo.descripcion_tipo,
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ),
                  Hero(
                    tag: 'fecha' + '${recibo.idRec}',
                    child: Material(
                      child: InkWell(
                        child: Text(
                          "${recibo.fecha}",
                          textAlign: TextAlign.right,
                          //style: TextStyle(color: Color(0xFF000000)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
            //ChatAndAddToCart(),
          ],
        ),
      ),
    );
  }
}
