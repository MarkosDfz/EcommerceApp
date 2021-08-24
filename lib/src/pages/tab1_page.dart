
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/src/models/store_model.dart';
import 'package:store/src/widgets/search_widget.dart';
import 'package:store/src/services/store_service.dart';
import 'package:store/src/theme/color_app.dart' as theme;
import 'package:store/src/theme/font_styles.dart' as font;
import 'package:store/src/widgets/categories_widget.dart';
import 'package:store/src/widgets/struct_general_widget.dart';

class Tab1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StructGeneralWidget(
      contentHeader: _header( context ),
      contentBody: _body(context)
    );
  }

}

Widget _header( BuildContext context ) {

  return SafeArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text( 'ENVAR A',
          style: TextStyle(
            fontSize: 15.0,
            color: Theme.of(context).focusColor,
            fontWeight: FontWeight.bold
          )
        ),
        SizedBox( height: 15.0 ),
        Text( 'Latacunga la laguna 328232',
          style: font.FontStyle(context).subtitleBlackBold
        ),
        SizedBox( height: 30.0 ),
        SearchWidget()
      ],
    ),
  );

}

Widget _body( BuildContext context ) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        padding: EdgeInsets.only( left: 30.0 ),
        child: Text( 'Categorías',
          style: font.FontStyle(context).titleBlackBold,
        ),
      ),
      SizedBox( height: 10.0 ),
      CategoriesWidget(),
      SizedBox( height: 10.0 ),
      Container(
        padding: EdgeInsets.only( left: 30.0 ),
        child: Text( 'Productos destacados',
          style: font.FontStyle(context).titleBlackBold,
        ),
      ),
      SizedBox( height: 20.0 ),
      _featuredProducts( context ),
      SizedBox( height: 20.0 ),
      Container(
        padding: EdgeInsets.only( left: 30.0 ),
        child: Text( 'Locales destacados',
          style: font.FontStyle(context).titleBlackBold,
        ),
      ),
      SizedBox( height: 20.0 ),
      _featuredStores( context ),
    ],
  );

}

Widget _featuredProducts( BuildContext context ) {

  final _size = MediaQuery.of(context).size;
  final storeService = Provider.of<StoreService>(context);
  final List<Product> products = storeService.products;

  return Container(
    height: _size.height * 0.16,
    child: ListView.builder(
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: ( BuildContext context, int index ) {

        return Container(
          margin: (index == 0 )
          ? EdgeInsets.only( right: 10.0, left: 30.0 )
          : EdgeInsets.only( right: 10.0 ),
          child: GestureDetector(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular( 15.0 )
              ),
              child: Container(
                width: _size.width * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage( products[index].imgProd ),
                  ),
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular( 15.0 )
                  )
                ),
                child: Container(
                  padding: EdgeInsets.all( 30.0 ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity( 0.4 ),
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular( 15.0 )
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text( products[index].nameProd,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white
                        )
                      ),
                      Text( '\$ ${ products[index].getPrice()}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {
              final storeS = Provider.of<StoreService>(context, listen: false);
              storeS.product = products[index];
              Navigator.pushNamed( context, 'product' );
            },
          ),
        );

      },
    ),
  );

}

Widget _featuredStores( BuildContext context ) {

  final _size = MediaQuery.of(context).size;
  final storeService = Provider.of<StoreService>(context);
  final List<Store> stores = storeService.stores;

  return Container(
    height: _size.height * 0.16,
    child: ListView.builder(
      itemCount: stores.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: ( BuildContext context, int index ) {

        return Container(
          margin: ( index == 0 )
          ? EdgeInsets.only( right: 10.0, left: 30.0 )
          : EdgeInsets.only( right: 10.0 ),
          child: GestureDetector(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( 15.0 )
              ),
              child: Container(
                width: _size.width * 0.32,
                height: _size.height * 0.15,
                padding: EdgeInsets.all( 10.0 ),
                decoration: BoxDecoration(
                  color: theme.ColorApp(context).cardColor,
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular( 15.0 )
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.fitWidth,
                      image: NetworkImage( stores[index].logoStore )
                    ),
                    Text( stores[index].storeName,
                      style: font.FontStyle(context).bodyBlackBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ),
            ),
            onTap: () {
              final storeS = Provider.of<StoreService>(context, listen: false);
              storeS.tabIndex = 0;
              storeS.store = stores[index];
              Navigator.pushNamed( context, 'store' );
            },
          ),
        );

      },
    ),
  );

}