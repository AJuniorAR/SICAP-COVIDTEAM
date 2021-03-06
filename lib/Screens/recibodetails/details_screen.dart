import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicap_covid/constants.dart';
import 'package:sicap_covid/models/recibo.dart';

import './detailsBody.dart';

class DetailsScreen extends StatelessWidget {
  final Recibo recibo;

  const DetailsScreen({Key key, this.recibo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: DetailsBody(
        recibo: recibo,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        //style: Theme.of(context).textTheme.bodyText2,
        style: GoogleFonts.montserrat(
          textStyle: Theme.of(context).textTheme.bodyText2
        ) ,

      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
          onPressed: () {},
        ),
      ],
    );
  }
}
