
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/src/utils/utils.dart';
import 'package:store/src/widgets/logo_widget.dart';
import 'package:store/src/services/login_service.dart';
import 'package:store/src/theme/color_app.dart' as theme;
import 'package:store/src/theme/font_styles.dart' as font;

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;
    final loginService = Provider.of<LoginService>(context);

    return Scaffold(
      backgroundColor: theme.ColorApp(context).cardColor,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          width: _size.width,
          height: _size.height,
          child: Column(
            children: <Widget>[
              SafeArea(
                child: LogoWidget()
              ),
              Expanded(
                child: Container(
                  width: _size.width,
                  decoration: BoxDecoration(
                    // color: Color( 0xffEFEEEF ),
                    color: theme.ColorApp(context).scaffoldColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular( 40.0),
                      topRight: Radius.circular( 40.0 )
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric( vertical: 40.0 ),
                        child: Text( 'Iniciar Sesión',
                          style: font.FontStyle(context).headerBlackBold
                        )
                      ),
                      _emailField( context ),
                      SizedBox( height: 15.0 ),
                      _passwordField( context ),
                      SizedBox( height: 15.0 ),
                      _forgotLabel( context ),
                      SizedBox( height: 30.0 ),
                      ( loginService.isLoading == true )
                      ? CircularProgressIndicator( backgroundColor: Color( 0xff6C63FF ) )
                      : _loginButton( context ),
                      SizedBox( height: 30.0 ),
                      _registerLabel( context )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

Widget _emailField( BuildContext context ) {

  final _size = MediaQuery.of(context).size;
  final loginService = Provider.of<LoginService>(context);

  return Container(
    width: _size.width * 0.8,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only( left: 13.0, bottom: 5.0 ),
          child: Text( 'Correo electrónico',
            style: TextStyle(
              fontSize: 13.0
            ),
          )
        ),
        TextField(
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            hintText: 'example@example.com',
            hintStyle: font.FontStyle(context).bodyBlack,
            errorText: loginService.email.error,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Colors.red, width: 2.0 ),
              borderRadius: BorderRadius.circular( 20.0 ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Colors.red, width: 2.0 ),
              borderRadius: BorderRadius.circular( 20.0 ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 20.0 ),
              borderSide: BorderSide( color: Color( 0xffEFEEEF ), width: 2.0 ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 20.0 ),
              borderSide: BorderSide( color: Color( 0xff6C63FF ), width: 2.0 ),
            ),
          ),
          onChanged: ( String value ) {
            loginService.validateEmail( value );
          },
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
        ),
      ],
    ),
  );

}

Widget _passwordField( BuildContext context ) {

  final _size = MediaQuery.of(context).size;
  final loginService = Provider.of<LoginService>(context);

  return Container(
    width: _size.width * 0.8,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only( left: 13.0, bottom: 5.0 ),
          child: Text( 'Contraseña',
            style: TextStyle(
              fontSize: 13.0
            ),
          )
        ),
        TextField(
          autofocus: false,
          obscureText: !loginService.isVisiblePass,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            hintText: 'Contraseña',
            hintStyle: font.FontStyle(context).bodyBlack,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Colors.red, width: 1.0 ),
              borderRadius: BorderRadius.circular( 20.0 ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Colors.red, width: 1.0 ),
              borderRadius: BorderRadius.circular( 20.0 ),
            ),
            errorText: loginService.pass.error,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 20.0 ),
              borderSide: BorderSide( color: Color( 0xffEFEEEF ), width: 2.0 ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 20.0 ),
              borderSide: BorderSide( color: Color( 0xff6C63FF ), width: 2.0 ),
            ),
            suffixIcon: IconButton(
              icon: !loginService.isVisiblePass
                    ? Icon( Icons.remove_red_eye, color: Color( 0xff6C63FF ) )
                    : Icon( Icons.visibility_off, color: Color( 0xff6C63FF ) ),
              onPressed: () {
                final loginService = Provider.of<LoginService>( context, listen: false );
                loginService.isVisiblePass = !loginService.isVisiblePass;
              }
            )
          ),
          onChanged: ( String value ) {
            loginService.validatePass( value );
          },
        ),
      ],
    ),
  );

}

Widget _forgotLabel( BuildContext context ) {

  final _size = MediaQuery.of(context).size;

  return GestureDetector(
    child: Container(
      width: _size.width * 0.8,
      alignment: Alignment.centerRight,
      child: Text('¿Olvidaste tu contraseña?',
        style: TextStyle(
          fontSize: 13.0,
        ),
      ),
    ),
    onTap: () {},
  );

}

Widget _loginButton( BuildContext context ) {

  final _size = MediaQuery.of(context).size;
  final loginService = Provider.of<LoginService>( context, listen: false );

  return Container(
    height: 50.0,
    width: _size.width * 0.8,
    child: RaisedButton(
      elevation: 3.0,
      textColor: Colors.white,
      color: Color( 0xff6C63FF ),
      child: Text( 'Iniciar Sesión' ),
      shape: StadiumBorder(),
      onPressed: loginService.isValidLoginForm ? () => _login( context ) : null
    ),
  );

}

Widget _registerLabel( BuildContext context ) {

  return GestureDetector(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('¿No tienes una cuenta? ',
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
        Text('Registrate',
          style: TextStyle(
            fontSize: 14.0,
            color: Color( 0xff6C63FF ),
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
    onTap: () {
      Navigator.pushReplacementNamed( context, 'register' );
    },
  );

}

_login( BuildContext context ) async {

  final loginService = Provider.of<LoginService>(context, listen: false);

  loginService.isLoading = true;

  Map info = await loginService.login( loginService.email.value, loginService.pass.value );

  if ( info[ 'ok' ] ) {
    loginService.isLoading = false;
    Navigator.pushNamedAndRemoveUntil( context, 'tabs', (Route<dynamic> route) => false );
  } else {
    loginService.isLoading = false;
    mostarAlerta( context, 'Error' ,
      info[ 'mensaje' ],
      FlatButton(
          child: Text( 'Aceptar', style: TextStyle( color: Color( 0xff6C63FF ) ) ),
          onPressed: () => Navigator.of(context).pop(),
      )
    );
  }

}