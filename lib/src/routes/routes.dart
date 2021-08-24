
import 'package:flutter/material.dart';

import 'package:store/src/pages/tabs_page.dart';
import 'package:store/src/pages/login_page.dart';
import 'package:store/src/pages/store_page.dart';
import 'package:store/src/pages/product_page.dart';
import 'package:store/src/pages/register_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {

  return <String, WidgetBuilder>{
    'login'     : ( BuildContext context ) => LoginPage(),
    'register'  : ( BuildContext context ) => RegisterPage(),
    'tabs'      : ( BuildContext context ) => TabsPage(),
    'store'     : ( BuildContext context ) => StorePage(),
    'product'   : ( BuildContext context ) => ProductPage()
  };

}