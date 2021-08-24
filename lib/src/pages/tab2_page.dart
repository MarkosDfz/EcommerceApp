
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/src/models/store_model.dart';
import 'package:store/src/services/store_service.dart';
import 'package:store/src/theme/color_app.dart' as theme;
import 'package:store/src/theme/font_styles.dart' as font;
import 'package:store/src/widgets/card_prod_widget.dart';
import 'package:store/src/widgets/struct_general_widget.dart';

class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StructGeneralWidget(
      contentHeader: _header( context ),
      contentBody: _body( context )
    );

  }

}

Widget _header( BuildContext context ) {

  final _size = MediaQuery.of(context).size;
  final storeService = Provider.of<StoreService>( context, listen: false );

  return SafeArea(
    child: Column(
      children: <Widget>[
        SizedBox( height: 20.0 ),
        Text( 'Mis Favoritos',
          style: font.FontStyle(context).headerBlackBold
        ),
        SizedBox( height: 35.0 ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 50.0,
              width: _size.width * 0.40,
              child: RaisedButton(
                color: ( storeService.isBtnProd == false )
                ? theme.ColorApp(context).btnActivateColor
                : theme.ColorApp(context).btnDisableColor,
                child: Text( 'Locales',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white
                  )
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all( Radius.circular( 12.0 ) )
                ),
                onPressed: () {
                  storeService.isBtnProd = false;
                }
              ),
            ),
            Container(
              height: 50.0,
              width: _size.width * 0.40,
              child: RaisedButton(
                color: ( storeService.isBtnProd )
                ? theme.ColorApp(context).btnActivateColor
                : theme.ColorApp(context).btnDisableColor,
                child: Text( 'Productos',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white
                  )
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all( Radius.circular( 12.0 ) )
                ),
                onPressed: () {
                  storeService.isBtnProd = true;
                }
              ),
            ),
          ],
        )
      ],
    ),
  );

}

Widget _body( BuildContext context ) {

  final _size = MediaQuery.of( context ).size;
  final storeService = Provider.of<StoreService>( context );
  final List<Store> favStores = storeService.favStores;
  final List<Product> favProds = storeService.favProds;

  return Expanded(
    child: ( favStores.isEmpty && !storeService.isBtnProd || favProds.isEmpty && storeService.isBtnProd )
    ? Container(
      padding: EdgeInsets.only( top: _size.height * 0.1 ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 60,
          ),
          Container(
            padding: EdgeInsets.all( 30.0 ),
            child: Text( 'No tiene ningún elemento agregado a su lista de favoritos',
              style: font.FontStyle(context).titleBlack,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    )
    : Container(
      padding: EdgeInsets.symmetric( horizontal: 30.0 ),
      child: ListView.builder(
        itemCount: ( storeService.isBtnProd == false )
        ? favStores.length
        : favProds.length,
        padding: EdgeInsets.all( 0 ),
        itemBuilder: ( BuildContext context, int index ) {

          return ( storeService.isBtnProd == false )
          ? CardProdWidget(
            widgetLeft: Image(
              width: 70.0,
              height: 70.0,
              fit: BoxFit.contain,
              image: NetworkImage( favStores[index].logoStore )
            ),
            widgetRight: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text( favStores[index].storeName,
                  style: font.FontStyle(context).bodyBlackBold,
                ),
                Row(
                  children: <Widget>[
                    Icon( Icons.star, color: theme.ColorApp(context).btnTabsIConColor ),
                    SizedBox( width: 5.0 ),
                    Text( '${ favStores[index].scoreStore }',
                      style: font.FontStyle(context).bodyBlack,
                    ),
                    SizedBox( width: 10.0 ),
                    Text( '-',
                      style: font.FontStyle(context).bodyBlackBold
                    ),
                    SizedBox( width: 10.0 ),
                    Text( 'Comida',
                      style: font.FontStyle(context).bodyBlack
                    )
                  ],
                ),
              ],
            ),
            onTap: () {
              // final storeS = Provider.of<StoreService>(context, listen: false);
              // storeS.tabIndex = 0;
              // storeS.store = favStores[index];
              // Navigator.pushNamed( context, 'store' );
            },
          )
          : CardProdWidget(
            widgetLeft: Image(
              width: 90.0,
              height: 90.0,
              fit: BoxFit.contain,
              image: NetworkImage( favProds[index].imgProd )
            ),
            widgetRight: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text( favProds[index].nameProd,
                  style: font.FontStyle(context).bodyBlackBold,
                ),
                Row(
                  children: <Widget>[
                    Text( '\$ ${ favProds[index].getPrice() }',
                      style: font.FontStyle(context).bodyBlack,
                    ),
                    SizedBox( width: 10.0 ),
                    Text( '-',
                      style: font.FontStyle(context).bodyBlackBold
                    ),
                    SizedBox( width: 10.0 ),
                    Text( 'Comida',
                      style: font.FontStyle(context).bodyBlack
                    )
                  ],
                ),
              ],
            ),
            onTap: () {
              final storeS = Provider.of<StoreService>(context, listen: false);
              storeS.product = favProds[index];
              Navigator.pushNamed( context, 'product' );
            },
          );
        },
      ),
    ),
  );

}