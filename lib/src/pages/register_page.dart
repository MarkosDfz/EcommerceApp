
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/src/widgets/logo_widget.dart';
import 'package:store/src/services/login_service.dart';
import 'package:store/src/theme/color_app.dart' as theme;
import 'package:store/src/theme/font_styles.dart' as font;

class RegisterPage extends StatelessWidget {

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
          child: Stack(
            children: <Widget>[
              SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: LogoWidget()
                )
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: _size.width,
                  height: _size.height * 0.7,
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
                        child: Text( 'Crear Cuenta',
                          style: font.FontStyle(context).headerBlackBold
                        )
                      ),
                      _nameField( context ),
                      SizedBox( height: 15.0 ),
                      _emailField( context ),
                      SizedBox( height: 15.0 ),
                      _passwordField( context ),
                      SizedBox( height: 30.0 ),
                      ( loginService.isLoading == true )
                      ? CircularProgressIndicator( backgroundColor: Color( 0xffEFEEEF ) )
                      : _registerButton( context ),
                      SizedBox( height: 30.0 ),
                      _loginLabel( context )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

Widget _nameField( BuildContext context ) {

  final _size = MediaQuery.of(context).size;
  final loginService = Provider.of<LoginService>(context);

  return Container(
    width: _size.width * 0.8,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only( left: 13.0, bottom: 5.0 ),
          child: Text( 'Nombre',
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
            fillColor: Colors.white,
            hintText: 'Pepita Perez',
            hintStyle: font.FontStyle(context).bodyBlack,
            errorText: loginService.name.error,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Colors.red, width: 1.0 ),
              borderRadius: BorderRadius.circular( 20.0 ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Colors.red, width: 1.0 ),
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
            loginService.validateUsuario( value );
          },
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
        ),
      ],
    ),
  );

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
            fillColor: Colors.white,
            hintText: 'example@example.com',
            hintStyle: font.FontStyle(context).bodyBlack,
            errorText: loginService.email.error,
            errorStyle: font.FontStyle(context).miniBlack,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Colors.red, width: 1.0 ),
              borderRadius: BorderRadius.circular( 20.0 ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Colors.red, width: 1.0 ),
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
            fillColor: Colors.white,
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
            errorMaxLines: 2,
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
            loginService.validateRegisterPass( value );
          },
        ),
      ],
    ),
  );

}

Widget _registerButton( BuildContext context ) {

  final _size = MediaQuery.of(context).size;
  final loginService = Provider.of<LoginService>( context, listen: false );

  return Container(
    height: 50.0,
    width: _size.width * 0.8,
    child: RaisedButton(
      elevation: 3.0,
      textColor: Colors.white,
      color: Color( 0xff6C63FF ),
      child: Text( 'Crear Cuenta' ),
      shape: StadiumBorder(),
      onPressed: loginService.isValidRegisterForm ? () => _register( context ) : null
    ),
  );

}

Widget _loginLabel( BuildContext context ) {

  return GestureDetector(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('¿Ya tienes una cuenta? ',
          style: TextStyle(
            fontSize: 13.0,
          ),
        ),
        Text('Inicia Sesión',
          style: TextStyle(
            fontSize: 14.0,
            color: Color( 0xff6C63FF ),
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
    onTap: () {
      Navigator.pushReplacementNamed( context, 'login' );
    },
  );

}

_register( BuildContext context ) async {

}