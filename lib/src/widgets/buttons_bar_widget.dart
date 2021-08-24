
import 'package:flutter/material.dart';

class ButtonsBarWidget extends StatelessWidget {

  final String textNotification;
  final bool notifications;
  final IconData iconRight;
  final Function onTapPressRight;

  ButtonsBarWidget(
    {
      this.textNotification,
      @required this.notifications,
      @required this.iconRight,
      @required this.onTapPressRight
    }
  );

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 45.0,
                width: _size.width * 0.12,
                child: RaisedButton(
                  color: Colors.black,
                  child: Icon( Icons.arrow_back_ios,
                    size: 25.0,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.all( Radius.circular( 12.0 ) )
                  ),
                  onPressed: () {
                    Navigator.pop( context );
                  }
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 45.0,
                    width: _size.width * 0.12,
                    child: RaisedButton(
                      padding: EdgeInsets.only( right: 0 ),
                      color: Colors.black,
                      child: Icon( iconRight,
                        size: 25.0,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.all( Radius.circular( 12.0 ) )
                      ),
                      onPressed: onTapPressRight
                    ),
                  ),
                  ( notifications )
                  ? Positioned(
                    top:  8.0,
                    right: 6.0,
                    child: Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                      alignment: Alignment.center,
                      child: Text( textNotification,
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.white,
                        )
                      ),
                    ),
                  )
                  : Container()
                ],
              )
            ],
          ),
        ],
      )
    );

  }
}