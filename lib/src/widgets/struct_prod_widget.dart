
import 'package:flutter/material.dart';

import 'package:store/src/theme/color_app.dart' as theme;

class StructProdWidget extends StatelessWidget {

  final Widget contentHeader;
  final Widget contentBody;
  final String imgProd;

  StructProdWidget({
    @required this.contentHeader,
    @required this.contentBody,
    @required this.imgProd
  });

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.ColorApp(context).scaffoldColor,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric( vertical: 20.0, horizontal: 30  ),
                width: _size.width,
                height: _size.height * 0.45,
                child: contentHeader,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage( imgProd ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular( 50.0),
                    bottomRight: Radius.circular( 50.0 )
                  )
                ),
              ),
            ],
          ),
          Container(
            width: _size.width,
            padding: EdgeInsets.all( 30.0 ),
            child: contentBody
          ),
        ],
      ),
    );
  }

}