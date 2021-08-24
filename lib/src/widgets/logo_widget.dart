
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric( vertical: 20.0 ),
      child: SvgPicture.asset( 'assets/logo2.svg',
        width: _size.width * 0.3,
        height: _size.height * 0.3,
      ),
    );
  }

}