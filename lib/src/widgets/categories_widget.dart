
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/src/models/category_model.dart';
import 'package:store/src/services/store_service.dart';
import 'package:store/src/theme/color_app.dart' as theme;
import 'package:store/src/theme/font_styles.dart' as font;

class CategoriesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final storeService = Provider.of<StoreService>(context);
    final List<Category> categories = storeService.categories;

    return Container(
      height: 82.0,
      child: ListView.builder(
        itemCount: categories.length,
        padding: EdgeInsets.all( 0 ),
        scrollDirection: Axis.horizontal,
        itemBuilder: ( BuildContext context, int index ) {

          return Container(
            margin: ( index == 0 )
            ? EdgeInsets.only( left: 30.0, right: 15.0 )
            :EdgeInsets.only( right: 15.0 ),
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                  heroTag: null,
                  elevation: 2,
                  backgroundColor: theme.ColorApp(context).cardColor,
                  child: Image(
                    height: 30.0,
                    image: NetworkImage( '${ categories[index].iconCategory }')
                  ),
                  onPressed: () {}
                ),
                SizedBox( height: 10.0 ),
                Text( categories[index].nameCategory,
                  style: font.FontStyle(context).miniBlack,
                )
              ],
            ),
          );

        },
      ),
    );

  }

}