
import 'package:flutter/material.dart';

import 'package:store/src/theme/color_app.dart' as theme;

class StructGeneralWidget extends StatelessWidget {

  final Widget contentHeader;
  final Widget contentBody;

  StructGeneralWidget({
    @required this.contentHeader,
    @required this.contentBody
  });

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: theme.ColorApp(context).scaffoldColor,
      body: Column(// aqui va un scroll view
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: theme.ColorApp(context).headerColor,
                // color: Colors.red,
                padding: EdgeInsets.symmetric( vertical: 20.0, horizontal: 30  ),
                width: _size.width,
                height: _size.height * 0.30,
                child: contentHeader,
              ),
              Positioned(
                top: _size.height * 0.27,
                // top: _size.height * 0.27,
                child: Container(
                  width: _size.width,
                  padding: EdgeInsets.only( top: 30.0 ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    // color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular( 40.0),
                      topRight: Radius.circular( 40.0 )
                    )
                  ),
                ),
              )
            ],
          ),
           Container(
            width: _size.width,
            padding: EdgeInsets.only( top: 1.0 ),
            color: Theme.of(context).canvasColor,
          ),
          contentBody
        ],
      ),
    );
  }

}