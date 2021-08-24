
import 'package:flutter/material.dart';

import 'package:store/src/theme/color_app.dart' as theme;
import 'package:store/src/widgets/custom_tab_widget.dart';

class StructStoreWidget extends StatelessWidget {

  final Widget contentHeader;
  final Widget firstTab;
  final Widget secondTab;
  final Widget thirdTab;
  final Widget fourthTab;
  final String imgHeader;

  StructStoreWidget({
    @required this.contentHeader,
    @required this.firstTab,
    @required this.secondTab,
    @required this.thirdTab,
    @required this.fourthTab,
    @required this.imgHeader
  });

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.ColorApp(context).scaffoldColor,
      body: Column(// aqui va un scroll view
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: _size.width,
                height: 350.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage( imgHeader ),
                  ),
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular( 15.0 )
                  )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric( vertical: 20.0, horizontal: 30  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity( 0.7 ),
                  ),
                  child: contentHeader
                ),
              ),
              Positioned(
                top: 320.0,
                child: Container(
                  width: _size.width,
                  padding: EdgeInsets.only( top: 30.0 ),
                  decoration: BoxDecoration(
                    color: theme.ColorApp(context).scaffoldColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular( 40.0),
                      topRight: Radius.circular( 40.0 )
                    )
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              height: 200,
              child: CustomTabsPage(
                tabItems: ['Productos', 'Categorías', 'Información', 'Reviews'],
                tabContentItems: <Widget>[
                  firstTab,
                  secondTab,
                  thirdTab,
                  fourthTab,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}