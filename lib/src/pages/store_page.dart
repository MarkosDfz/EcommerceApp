
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/src/models/store_model.dart';
import 'package:store/src/services/store_service.dart';
import 'package:store/src/theme/color_app.dart' as theme;
import 'package:store/src/theme/font_styles.dart' as font;
import 'package:store/src/widgets/buttons_bar_widget.dart';
import 'package:store/src/widgets/struct_store_widget.dart';

class StorePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final storeService = Provider.of<StoreService>(context);
    final Store store = storeService.store;

    return StructStoreWidget(
      imgHeader: store.imgHeader,
      contentHeader: _header( context, store ),
      firstTab: _productTab( context, store ),
      secondTab: _categoryTab( context, store ),
      thirdTab: _infoTab( context, store ),
      fourthTab: _reviewTab( context, store ),
    );

  }

}

Widget _header( BuildContext context, Store store ) {

  return Column(
    children: <Widget>[
      ButtonsBarWidget(
        notifications: false,
        iconRight: Icons.favorite_border,
        onTapPressRight: () {}
      ),
      Image(
        width: 60.0,
        height: 60.0,
        fit: BoxFit.fitWidth,
        image: NetworkImage( store.logoStore )
      ),
      SizedBox( height: 10.0 ),
      Text( store.storeName,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox( height: 10.0 ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text( store.open,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white
            ),
          ),
          SizedBox( width: 5.0 ),
          Text( 'a',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white
            ),
          ),
          SizedBox( width: 5.0 ),
          Text( store.close,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white
            ),
          ),
        ],
      ),
      SizedBox( height: 12.0 ),
      _infoBar( context )
    ],
  );

}

Widget _infoBar( BuildContext context ) {

  final _size = MediaQuery.of(context).size;

  return Container(
    height: 56,
    width: _size.width * 0.8,
    decoration: BoxDecoration(
      color: Colors.white24,
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular( 30.0 )
      )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:2.0),
          child: Column(
            children: <Widget>[
              Image(
                width: 33.0,
                image: NetworkImage('https://img.icons8.com/color/48/000000/pizza-delivery.png')
              ),
              SizedBox( height: 1.0 ),
              Text('Gratis',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.white,
                )
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top:2.0),
          child: Column(
            children: <Widget>[
              Image(
                width: 33.0,
                image: NetworkImage('https://img.icons8.com/color/48/000000/alarm-clock.png')
              ),
              SizedBox( height: 1.0 ),
              Text('20-30 m',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.white,
                )
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top:2.0),
          child: Column(
            children: <Widget>[
              Image(
                width: 33.0,
                image: NetworkImage('https://img.icons8.com/color/48/000000/christmas-star.png')
              ),
              SizedBox( height: 1.0 ),
              Text('4.6',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.white,
                )
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top:2.0),
          child: Column(
            children: <Widget>[
              Image(
                width: 33.0,
                image: NetworkImage('https://img.icons8.com/fluent/48/000000/approval.png')
              ),
              SizedBox( height: 1.0 ),
              Text('Verificado',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.white,
                )
              )
            ],
          ),
        ),
      ],
    ),
  );

}

Widget _productTab( BuildContext context, Store store ) {

  final _size = MediaQuery.of(context).size;
  final double itemHeight = 210.0;
  final double itemWidth = _size.width / 2;

  return Container(
    padding: EdgeInsets.symmetric( horizontal: 30.0 ),
    child: GridView.builder(
      padding: EdgeInsets.all(0),
      itemCount: store.products.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 2
      ),
      itemBuilder: ( BuildContext context, int index ) {

        return GestureDetector(
          child: Card(
            elevation: 3,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( 15.0 )
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: _size.height * 0.13,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage( store.products[index].imgProd ),
                        ),
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular( 15.0 ),
                          topEnd: Radius.circular( 15.0 )
                        )
                      ),
                      child: Container(
                        padding: EdgeInsets.all( 30.0 ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity( 0.1 ),
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular( 15.0 ),
                            topEnd: Radius.circular( 15.0 )
                          )
                        ),
                      )
                    ),
                    Positioned(
                      top: 10.0,
                      right: 10,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.black87,
                        child: Text( '\$${ store.products[index].getPrice() }',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric( horizontal: 10.0 ),
                    child: Center(
                      child: Text( store.products[index].nameProd,
                        maxLines: 2,
                        style: font.FontStyle(context).bodyBlack,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: theme.ColorApp(context).cardColor,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular( 15.0 ),
                        bottomEnd: Radius.circular( 15.0 )
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            final storeS = Provider.of<StoreService>(context, listen: false);
            storeS.product = store.products[index];
            Navigator.pushNamed( context, 'product' );
          },
        );

      },
    ),
  );

}

Widget _categoryTab( BuildContext context, Store store ) {

  return Center(child: Text('Categorías'));

}

Widget _infoTab( BuildContext context, Store store ) {

  return Center(child: Text('Información'));

}

Widget _reviewTab( BuildContext context, Store store ) {

  return Center(child: Text('Reviews'));

}