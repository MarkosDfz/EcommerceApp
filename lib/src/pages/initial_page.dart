
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/src/theme/color_app.dart' as theme;
import 'package:store/src/theme/font_styles.dart' as font;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.ColorApp(context).cardColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _logoContainer( context ),
            Container(
              width: _size.width,
              height: _size.height * 0.4,
              padding: EdgeInsets.symmetric( horizontal: 30.0 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text( 'Lorem ipsum dolor sit amet',
                    style:font.FontStyle(context).subtitleBlackBold,
                  ),
                  Container(
                    width: _size.width,
                    height: _size.height * 0.3,
                    child: Column(
                      children: <Widget>[
                        _loginButton( context ),
                        SizedBox( height: 20.0 ),
                        _registerButton( context ),
                        SizedBox( height: 30.0 ),
                        Text( 'O ingresa con',
                          style: font.FontStyle(context).miniBlack,
                        ),
                        SizedBox( height: 10.0 ),
                        _socialButtons()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _logoContainer( BuildContext context ) {

  final _size = MediaQuery.of(context).size;

  return Container(
    width: _size.width,
    height: _size.height * 0.5,
    padding: EdgeInsets.symmetric( vertical: 10.0, horizontal: 30.0 ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 40.0 )
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric( vertical: 30.0 ),
            child: Text( 'App Name',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SvgPicture.asset( 'assets/logo.svg',
            width: _size.width * 0.3,
            height: _size.height * 0.3,
          ),
        ],
      ),
    ),
  );

}

Widget _loginButton( BuildContext context ) {

  final _size = MediaQuery.of(context).size;

  return Container(
    height: 50.0,
    width: _size.width * 0.8,
    child: RaisedButton(
      elevation: 3.0,
      textColor: Colors.white,
      color: Color( 0xff6C63FF ),
      child: Text( 'Iniciar Sesión',
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
        ),
      ),
      shape: StadiumBorder(),
      onPressed: () {
        Navigator.pushNamed( context, 'login' );
      }
    ),
  );
}

Widget _registerButton( BuildContext context ) {

  final _size = MediaQuery.of(context).size;

  return Container(
    height: 50.0,
    width: _size.width * 0.8,
    child: RaisedButton(
      elevation: 3.0,
      color: Colors.white,
      child: Text( 'Registrarse',
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
      ),
      shape: StadiumBorder(),
      onPressed: () {
        Navigator.pushNamed( context, 'register' );
      }
    ),
  );

}

Widget _socialButtons() {

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      IconButton(
        icon: Icon( FontAwesomeIcons.facebook, size: 28.0, color: Color( 0xff3F569A ) ),
        onPressed: () {}
      ),
      IconButton(
        icon: Icon( FontAwesomeIcons.google, size: 28.0, color: Color( 0xffE25643 ) ),
        onPressed: () {}
      ),
      IconButton(
        icon: Icon( FontAwesomeIcons.twitter, size: 28.0, color: Color( 0xff69ACE8 ) ),
        onPressed: () {}
      ),
    ],
  );

}