
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/src/models/store_model.dart';

import 'package:store/src/services/store_service.dart';
import 'package:store/src/theme/color_app.dart' as theme;
import 'package:store/src/theme/font_styles.dart' as font;
import 'package:store/src/widgets/buttons_bar_widget.dart';
import 'package:store/src/widgets/struct_prod_widget.dart';

class ProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final storeService = Provider.of<StoreService>(context);
    final Product prod = storeService.product;

    return StructProdWidget(
      imgProd: prod.imgProd,
      contentHeader: _header( context ),
      contentBody: _body( context, prod )
    );
  }
}

Widget _header( BuildContext context ) {

  return ButtonsBarWidget(
    notifications: true,
    textNotification: '2',
    iconRight: Icons.shopping_basket,
    onTapPressRight: () {}
  );

}

Widget _body( BuildContext context, Product prod ) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text( prod.nameProd,
        style: font.FontStyle(context).titleBlackBold,
      ),
      SizedBox( height: 10.0 ),
      _optionsColumn( context, prod ),
      SizedBox( height: 20.0 ),
      _description( context, prod ),
      _addButton( context )
    ],
  );

}

Widget _optionsColumn( BuildContext context, Product prod ) {

  final _size = MediaQuery.of(context).size;
  final storeService = Provider.of<StoreService>(context);

  return Column(
    children: <Widget>[
      Container(
        height: _size.height * 0.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon( Icons.star, color: theme.ColorApp(context).btnTabsIConColor ),
                SizedBox( width: 8.0 ),
                Text( '4.7',
                  style: font.FontStyle(context).subtitleBlack,
                )
              ],
            ),
            Icon( Icons.favorite_border, size: 30.0 )
          ],
        ),
      ),
      SizedBox( height: 10.0 ),
      Container(
        height: _size.height * 0.04,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: _size.width * 0.32,
                  decoration: BoxDecoration(
                    color: theme.ColorApp(context).scaffoldColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: 45.0,
                          height: _size.height * 0.04,
                          color: Colors.transparent,
                          child: Icon( Icons.remove )
                        ),
                        onTap: (){
                          if (storeService.qtyProd > 1) {
                            storeService.qtyProd--;
                          }
                        },
                      ),
                      Container(
                        child: Text( '${storeService.qtyProd}',
                          textAlign: TextAlign.center,
                          style: font.FontStyle(context).subtitleBlackBold,
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          width: 45.0,
                          height: _size.height * 0.04,
                          color: Colors.transparent,
                          child: Icon( Icons.add )
                        ),
                        onTap: (){
                          storeService.qtyProd++;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text( '\$ ${ prod.getPrice() }',
              style: font.FontStyle(context).titleBlackBold,
            )
          ],
        ),
      )
    ],
  );

}

Widget _description( BuildContext context, Product prod ) {

  final _size = MediaQuery.of(context).size;

  return Container(
    margin: EdgeInsets.only( bottom: 30.0 ),
    height: _size.height * 0.15 ,
    child: Text( prod.descripPod,
      maxLines: 6,
      style: font.FontStyle(context).subtitleBlack,
      textAlign: TextAlign.justify,
    ),
  );

}

Widget _addButton( BuildContext context ) {

  final _size = MediaQuery.of(context).size;

  return Center(
    child: Container(
      height: 50.0,
      width: _size.width * 0.7,
      child: RaisedButton(
        elevation: 3.0,
        textColor: Colors.white,
        color: theme.ColorApp(context).btnTabsIConColor,
        child: Text( 'Agregar al carrito',
          style: font.FontStyle(context).bodyWhiteBold,
        ),
        shape: StadiumBorder(),
        onPressed: () {}
      ),
    ),
  );

}