
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/src/pages/tab1_page.dart';
import 'package:store/src/pages/tab2_page.dart';
import 'package:store/src/pages/tab3_page.dart';
import 'package:store/src/pages/tab4_page.dart';
import 'package:store/src/theme/color_app.dart' as theme;

class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }

}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _navigation = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: _navigation.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Tab2Page(),
        Tab3Page(),
        Tab4Page()
      ],
    );
  }

}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _page = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      fixedColor: theme.ColorApp(context).btnTabsIConColor,
      currentIndex: _page.currentPage,
      onTap: ( i ) => _page.currentPage = i,
      items: [
        BottomNavigationBarItem(
          label: 'Inicio',
          icon: Icon( Icons.home )
        ),
        BottomNavigationBarItem(
          label: 'Favoritos',
          icon: Icon( Icons.favorite )
        ),
        BottomNavigationBarItem(
          label: 'Pedidos',
          icon: Icon( Icons.receipt )
        ),
        BottomNavigationBarItem(
          label: 'Más',
          icon: Icon( Icons.dehaze )
        ),
      ]
    );

  }

}

class _NavigationModel with ChangeNotifier {

  // Data Type
  int _currentPage = 0;
  PageController _pageController = new PageController();

  // Getters
  int get currentPage => this._currentPage;
  PageController get pageController => this._pageController;

  // Setters
  set currentPage( int value ) {

    this._currentPage = value;
    _pageController.animateToPage( value,
      curve: Curves.easeOut,
      duration: Duration( milliseconds: 250 )
    );

    notifyListeners();
  }

}