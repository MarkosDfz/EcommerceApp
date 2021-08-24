
import 'package:flutter/material.dart';

import 'package:store/src/theme/color_app.dart' as theme;

class CardProdWidget extends StatelessWidget {

  final Widget widgetLeft;
  final Widget widgetRight;
  final Function onTap;

  CardProdWidget(
    {
      @required this.onTap,
      @required this.widgetLeft,
      @required this.widgetRight
    }
  );

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of( context ).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only( bottom: 10.0 ),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( 15.0 )
          ),
          child: Container(
            width: _size.width * 0.83,
            height: _size.height * 0.15,
            padding: EdgeInsets.symmetric( vertical: 10.0, horizontal: 10.0 ),
            decoration: BoxDecoration(
              color: theme.ColorApp(context).cardColor,
              borderRadius: BorderRadiusDirectional.all(
                Radius.circular( 15.0 )
              )
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: _size.width * 0.27,
                  child: Center(
                    child: widgetLeft,
                  ),
                ),
                Container(
                  width: _size.width * 0.45,
                  margin: EdgeInsets.only( left: 20.0 ),
                  child: widgetRight,
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}