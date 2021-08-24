
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/src/pages/tabs_page.dart';

import 'package:store/src/routes/routes.dart';
import 'package:store/src/prefs/user_prefs.dart';
import 'package:store/src/theme/theme_config.dart';
import 'package:store/src/services/store_service.dart';
// import 'package:store/src/pages/initial_page.dart';
import 'package:store/src/services/login_service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => new AppTheme(1) ),
        ChangeNotifierProvider( create: (_) => new LoginService() ),
        ChangeNotifierProvider( create: (_) => new StoreService() ),
      ],
      child: MyApp()
    )
  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<AppTheme>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: TabsPage(),
      theme: appTheme,
      routes: getAplicationRoutes()
    );
  }
}