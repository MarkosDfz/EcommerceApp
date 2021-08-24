
import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {

  // Constructor
  AppTheme( int theme ) {

    switch ( theme ) {

      case 1: //light
        _darkTheme    = false;
        _currentTheme = ThemeData.light().copyWith(
          cardColor: Colors.white, // Card
          hintColor: Colors.black, // Letras
          hoverColor: Colors.white, // Letras
          focusColor: Colors.white,// Letra Eviar
          canvasColor: Colors.white, // tab
          buttonColor: Colors.black, // Button Active
          disabledColor: Color(0xffB88700), // Search y button disable
          scaffoldBackgroundColor: Colors.white, // Scaffold
          secondaryHeaderColor: Color(0xffFFC72C), // Header
          toggleableActiveColor: Color(0xffED662C), // Tabs
        );
      break;

      case 2: //dark
        _darkTheme    = true;
        _currentTheme = ThemeData.dark().copyWith(
          hintColor: Colors.white, // Letras
          hoverColor: Colors.black, // Letras
          buttonColor: Colors.black, // Button Active
          cardColor: Color(0xff252628), // Card
          focusColor: Color(0xffFFC72C), // Letra Eviar
          canvasColor: Color(0xff313131), // Tab Background
          disabledColor: Color(0xff6E6E72), // Search y button disable
          secondaryHeaderColor: Color(0xff252628), // Header
          toggleableActiveColor: Color(0xffFFC72C), // Tabs
          scaffoldBackgroundColor: Color(0xff313131) // Scaffold
        );
      break;

      default:
        _darkTheme    = false;
        _currentTheme = ThemeData.light().copyWith(
          cardColor: Colors.white, // Card
          hintColor: Colors.black, // Letras
          hoverColor: Colors.white, // Letras
          focusColor: Colors.white,// Letra Eviar
          canvasColor: Colors.white, // tab
          buttonColor: Colors.black, // Button Active
          disabledColor: Color(0xffB88700), // Search y button disable
          scaffoldBackgroundColor: Colors.white, // Scaffold
          secondaryHeaderColor: Color(0xffFFC72C), // Header
          toggleableActiveColor: Color(0xffED662C), // Tabs
        );

    }

  }

  // Data Type
  bool _darkTheme = false;
  ThemeData _currentTheme;

  // Getters
  bool get darkTheme => this._darkTheme;
  ThemeData get currentTheme => this._currentTheme;

  // Setters
  set darkTheme( bool value ) {

    this._darkTheme = value;

    if ( value ) {
      this._currentTheme = ThemeData.dark().copyWith(
        hintColor: Colors.white, // Letras
        hoverColor: Colors.black, // Letras
        buttonColor: Colors.black, // Button Active
        cardColor: Color(0xff252628), // Card
        focusColor: Color(0xffFFC72C), // Letra Eviar
        canvasColor: Color(0xff313131), // Tab Background
        disabledColor: Color(0xff6E6E72), // Search y button disable
        secondaryHeaderColor: Color(0xff252628), // Header
        toggleableActiveColor: Color(0xffFFC72C), // Tabs
        scaffoldBackgroundColor: Color(0xff313131) // Scaffold
      );
    } else {
      this._currentTheme = ThemeData.light().copyWith(
        cardColor: Colors.white, // Card
        hintColor: Colors.black, // Letras
        hoverColor: Colors.white, // Letras
        focusColor: Colors.white,// Letra Eviar
        canvasColor: Colors.white, // tab
        buttonColor: Colors.black, // Button Active
        disabledColor: Color(0xffB88700), // Search y button disable
        scaffoldBackgroundColor: Colors.white, // Scaffold
        secondaryHeaderColor: Color(0xffFFC72C), // Header
        toggleableActiveColor: Color(0xffED662C), // Tabs Icons
      );
    }

    notifyListeners();

  }

}