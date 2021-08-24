
import 'package:flutter/material.dart';

import 'package:store/src/theme/color_app.dart' as theme;

class SearchWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            autofocus: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: theme.ColorApp(context).btnDisableColor,
              prefixIcon: Icon( Icons.search, color: Colors.white ),
              hintText: 'Busca un local o un artículo',
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular( 10.0 ),
                borderSide: BorderSide( color: theme.ColorApp(context).btnDisableColor, width: 2.0 ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular( 10.0 ),
                borderSide: BorderSide( color: theme.ColorApp(context).btnDisableColor,width: 2.0 ),
              ),
            ),
          ),
        ),
        SizedBox( width: 15.0 ),
        Container(
          height: 54.0,
          width: 40.0,
          child: RaisedButton(
            padding: EdgeInsets.only( right: 0 ),
            color: theme.ColorApp(context).btnActivateColor,
            child: Icon(
              Icons.filter_list,
              size: 30.0,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.all( Radius.circular( 12.0 ) )
            ),
            onPressed: () {}
          ),
        ),
      ],
    );

  }

}