
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:store/src/utils/utils.dart';
import 'package:store/src/prefs/user_prefs.dart';
import 'package:store/src/utils/validations.dart';

final _urlApi = '';

class LoginService with ChangeNotifier {

  final _prefs = new PreferenciasUsuario();

  // Data Type
  bool _isloading       = false;
  bool _isLoggedIn      = false;
  bool _isVisiblePass   = false;
  ValidationItem _name  = ValidationItem( null, null );
  ValidationItem _email = ValidationItem( null, null );
  ValidationItem _pass  = ValidationItem( null, null );
  // Getters
  get isLoading            => _isloading;
  get isVisiblePass        => _isVisiblePass;
  bool get isLoggedIn      => _isLoggedIn;
  ValidationItem get name  => _name;
  ValidationItem get pass  => _pass;
  ValidationItem get email => _email;

  bool get isValidLoginForm {
    if ( _email.value != null && _pass.value != null ){
      return true;
    } else {
      return false;
    }
  }

  bool get isValidRegisterForm {
    if ( _email.value != null && _pass.value != null && _name != null ){
      return true;
    } else {
      return false;
    }
  }

  // Setters
  set isVisiblePass( bool value ) {
    this._isVisiblePass = value;
    notifyListeners();
  }

  set isLoading( bool value ) {
    this._isloading = value;
    notifyListeners();
  }

  // Funtions
  void validateEmail( String value ) {

    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp( pattern );

    if ( regExp.hasMatch( value ) ) {
      _email = ValidationItem( value, null );
    } else {
      _email = ValidationItem( null, 'Ingrese un email válido' );
    }

    notifyListeners();

  }

  void validateUsuario( String value ) {

    if ( value.length >= 5 ){
      _name = ValidationItem( value, null) ;
    } else {
      _name = ValidationItem( null, 'Nombre de usuario muy corto' );
    }

    notifyListeners();

  }

  void validatePass( String value ) {

    if ( value.length >= 3 ){
      _pass = ValidationItem( value, null ) ;
    } else {
      _pass = ValidationItem( null, 'Contraseña muy corta' );
    }

    notifyListeners();

  }

  void validateRegisterPass( String value ) {

    Pattern pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}';

    RegExp regExp = new RegExp( pattern );

    if ( value.length >= 6  ){
      if ( regExp.hasMatch( value ) ) {
        _pass = ValidationItem( value, null ) ; 
      } else {
        _pass = ValidationItem( null, 'La contraseña debe contener por lo menos una letra mayúscula y un simbolo especial' );
      }
    } else {
      _pass = ValidationItem( null, 'La contraseña debe contener al menos 8 caracteres' );
    }

    notifyListeners();

  }

  login( String email, String password ) async {

    final conection = await checkNetwork();

    if ( conection == false ) {
      return { 'ok' : false, 'mensaje' : 'No tiene conexión a internet, compruebe y vuelva a intentar' };
    }

    final authData = {
      'identifier' : email,
      'password'   : password,
    };

    final resp = await http.post('$_urlApi/auth/local', body: authData );

    Map<String, dynamic> decodeResp = json.decode( resp.body );

    if ( decodeResp.containsKey( 'jwt' ) ) {

      _prefs.token  = decodeResp[ 'jwt' ];

      return { 'ok' : true  };
    } else {
      return { 'ok' : false, 'mensaje' : decodeResp['message'][0]['messages'][0]['message'] };
    }

  }

}