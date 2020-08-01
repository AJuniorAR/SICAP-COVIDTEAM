import 'package:flutter/material.dart';
import 'package:sicap_covid/models/recibo.dart';
import 'package:sicap_covid/models/alumnoprograma.dart';
import '../../constants.dart';

class ProgramaCard extends StatelessWidget {
  const ProgramaCard({
    Key key,
    this.itemIndex,
    this.programa,
    this.press,
  }) : super(key: key);

  final int itemIndex;
  final AlumnoPrograma programa;
  final Function press;

  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      //color: Colors.blueAccent,
      height: 100, // Este es el alto del card
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: itemIndex.isEven ? kBlueColor : kSecondaryColor,
                boxShadow: [kDefaultShadow],
              ),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // Fecha del tramite
            Positioned(
              top: 60,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Tap to open date picker',
                      onPressed: () {
                        //_selectDate(context);
                      },
                    ),
                    Hero(
                      tag: 'AnioIngreso' + '${programa.anioIngreso}',
                      child: Material(
                        child: InkWell(
                          child: Text(
                            "${programa.anioIngreso}",
                            textAlign: TextAlign.right,
                            //style: TextStyle(color: Color(0xFF000000)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Product title and price
            Positioned(
              //bottom: 0,
              //left: 0,
              child: SizedBox(
                height: 110,
                // our image take 200 width, thats why we set out total width - 200
                width: size.width - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        programa.nom_programa,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    // it use the available space
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5, // 30 padding
                        vertical: kDefaultPadding / 4, // 5 top and bottom
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Sit. ${programa.codSitu}",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
