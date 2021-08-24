
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/src/services/store_service.dart';
import 'package:store/src/theme/color_app.dart' as theme;

class CustomTabsPage extends StatelessWidget {

  final List<String> tabItems;
  final List<Widget> tabContentItems;

  CustomTabsPage(
    {
      @required this.tabItems,
      @required this.tabContentItems
    }
  );

  @override
  Widget build(BuildContext context) {

    final storeService = Provider.of<StoreService>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only( left: 20, right: 20 ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[] + createTabItems( context ),
          )
        ),
        Expanded(
          child: tabContentItems.elementAt( storeService.tabIndex )
        )
      ],
    );


  }

  List<Widget> createTabItems( BuildContext context ) {

    List<Widget> widgets = [];
    final storeService = Provider.of<StoreService>( context, listen: false );

    tabItems.forEach((item) {
      return widgets.add(
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: createItem( item, context ),
          onTap: () {
            storeService.tabIndex = tabItems.indexOf( item );
          },
        )
      );
    });

    return widgets;

  }

  Widget createItem( String item, BuildContext context ) {

    int i = tabItems.indexOf(item);
    final storeService = Provider.of<StoreService>( context );
    final condition = ( i == storeService.tabIndex );

    return Container(
      padding: EdgeInsets.only( bottom: 15.0 ),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              item,
              style: TextStyle(
                fontSize: condition ?  15 : 13,
                fontWeight: condition ? FontWeight.bold : null,
                color: condition ? theme.ColorApp(context).btnTabsIConColor : Theme.of(context).hintColor
              ),
            ),
            SizedBox( height: 2.0 ),
            CircleAvatar(
              backgroundColor: condition ?  theme.ColorApp(context).btnTabsIConColor : Colors.transparent,
              radius: 3.0,
            )
          ],
        )
      )
    );

  }


}