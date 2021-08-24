
import 'package:flutter/material.dart';

class ColorApp {

  Color headerColor;
  Color scaffoldColor;
  Color cardColor;
  Color btnActivateColor;
  Color btnDisableColor;
  Color btnTabsIConColor;

  ColorApp(_context) {
    headerColor      = Theme.of(_context).secondaryHeaderColor;
    scaffoldColor    = Theme.of(_context).scaffoldBackgroundColor;
    cardColor        = Theme.of(_context).cardColor;
    btnActivateColor = Theme.of(_context).buttonColor;
    btnDisableColor  = Theme.of(_context).disabledColor;
    btnTabsIConColor = Theme.of(_context).toggleableActiveColor;
  }

}

//   static const headerColor      = Color(0xffFFC72C);
//   static const scaffoldColor    = Colors.white;
//   static const cardColor        = Colors.white;
//   static const btnActivateColor = Colors.black;
//   static const btnDisableColor  = Color(0xffB88700);
//   static const btnTabsIConColor = Color(0xffED662C);