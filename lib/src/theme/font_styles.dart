
import 'package:flutter/material.dart';


class FontStyle {

  Color black;
  Color white;
  TextStyle headerWhite;
  TextStyle headerBlack;
  TextStyle headerWhiteBold;
  TextStyle headerBlackBold;
  TextStyle titleWhite;
  TextStyle titleBlack;
  TextStyle titleWhiteBold;
  TextStyle titleBlackBold;
  TextStyle subtitleWhite;
  TextStyle subtitleBlack;
  TextStyle subtitleWhiteBold;
  TextStyle subtitleBlackBold;
  TextStyle bodyWhite;
  TextStyle bodyBlack;
  TextStyle bodyWhiteBold;
  TextStyle bodyBlackBold;
  TextStyle miniWhite;
  TextStyle miniBlack;
  TextStyle miniWhiteBold;
  TextStyle miniBlackBold;

  FontStyle(_context) {

    black = Theme.of(_context).hintColor;
    white = Theme.of(_context).hoverColor;

    headerWhite = TextStyle( fontSize: 24.0, color: white );
    headerBlack = TextStyle( fontSize: 24.0, color: black );

    headerWhiteBold = TextStyle( fontSize: 24.0, color: white, fontWeight: FontWeight.bold );
    headerBlackBold = TextStyle( fontSize: 24.0, color: black, fontWeight: FontWeight.bold );

    titleWhite = TextStyle( fontSize: 20.0, color: white );
    titleBlack = TextStyle( fontSize: 20.0, color: black );

    titleWhiteBold = TextStyle( fontSize: 20.0, color: white, fontWeight: FontWeight.bold );
    titleBlackBold = TextStyle( fontSize: 20.0, color: black, fontWeight: FontWeight.bold );

    subtitleWhite = TextStyle( fontSize: 17.0, color: white );
    subtitleBlack = TextStyle( fontSize: 17.0, color: black );

    subtitleWhiteBold = TextStyle( fontSize: 17.0, color: white, fontWeight: FontWeight.bold );
    subtitleBlackBold = TextStyle( fontSize: 17.0, color: black, fontWeight: FontWeight.bold );

    bodyWhite = TextStyle( fontSize: 15.0, color: white );
    bodyBlack = TextStyle( fontSize: 15.0, color: black );

    bodyWhiteBold = TextStyle( fontSize: 15.0, color: white, fontWeight: FontWeight.bold );
    bodyBlackBold = TextStyle( fontSize: 15.0, color: black, fontWeight: FontWeight.bold );

    miniWhite = TextStyle( fontSize: 11.0, color: white );
    miniBlack = TextStyle( fontSize: 11.0, color: black );

    miniWhiteBold = TextStyle( fontSize: 11.0, color: white, fontWeight: FontWeight.bold );
    miniBlackBold = TextStyle( fontSize: 11.0, color: black, fontWeight: FontWeight.bold );

  }

}