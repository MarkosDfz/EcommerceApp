
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/src/theme/theme_config.dart';
import 'package:store/src/theme/color_app.dart' as theme;
import 'package:store/src/theme/font_styles.dart' as font;
import 'package:store/src/widgets/struct_general_widget.dart';

class Tab4Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StructGeneralWidget(
      contentHeader: _header( context ),
      contentBody: _body( context )
    );
  }
}

Widget _header( BuildContext context ) {

  return Container(
    padding: EdgeInsets.only( top: 10.0 ),
    child: Row(
      children: <Widget>[
        CircleAvatar( radius: 50.0,
          backgroundImage: NetworkImage('https://lh3.googleusercontent.com/-92f5ll3MDmc/XPmwsPw6ypI/AAAAAAAAACE/HD6DZBbv-KciaZVWUA252Lw7Rs2tlT7FwCEwYBhgLKtMDAL1Ocqymr6BTakLPZdK9OplV7Y4A_tPxPEq8BUEF1jr0g6Y1o_HgEKfY0dN2D7OpbiR82hRitupsPSf-FqhPG4CSWh9h6n7aHCwjjYb5ePoJSiQd0NwlQKJDInEsesrRBwAtSZW_fVLsXdbpUNx0A9HZQiInqCrPC_rCmltkvaW-8Phpcka09o5_G1V2IfL5DfieriwAdB5MVwVi1NDx76UsDngTkaCd4AiYVDMYn2m8ZRbOFOyN9zKbVUz0VeMqklHdxjdCFpOkuFiXm5SUIKOfgSAeFm1I9qieTc_jKnuj95inaKyUuPB_iOhN5UGquqocwyjwpc9cX09PHLszxqSo2i5ndTv8btsv8ZmzTwvcvPTIe11qNLMPe6vSkVOLQ9oYSS7HfdZViHuGRdzsmPPKZd_QiMbkgb_cI5vcLDQ62iOYwzGL-IleZX0Wi3W4aVcVbNxdmRPlHY2T_DU7eEqh9CVHRVY9hPvOE2ha6fyDSQ8CW5o8feo6lKO0gxsXeDjwoYfyG_9cFf2XwaS3qPCOoZu9mzlE0YlV4DDpr1JeHiboiyRUPjxComwAkIK6FdmKgHEVrbjBPvJoag5L4NX54TYsUqTM8kGFvV2mZxdS9jgwxp_S-AU/w280-h280-p/10354898_797980216941967_1426515167042357789_n.jpg'),
        ),
        Container(),
        Expanded(
          child: ListTile(
            title: Text( 'Marcos Elías',
              style: font.FontStyle(context).headerBlackBold,
            ),
            subtitle: Text( 'Editar perfil',
              style: font.FontStyle(context).subtitleBlack,
            ),
            trailing: Icon( Icons.arrow_forward_ios ),
          ),
        )
      ],
    ),
  );

}

Widget _body( BuildContext context ) {

  final themeService = Provider.of<AppTheme>( context, listen: false );

  return Container(
    padding: EdgeInsets.symmetric( horizontal: 30.0 ),
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text( 'Buscar',
            style: font.FontStyle(context).bodyBlack,
          ),
          dense: true,
          leading: Icon( Icons.search ),
          trailing: Icon( Icons.arrow_forward_ios ),
        ),
        ListTile(
          title: Text( 'Notificaciones',
            style: font.FontStyle(context).bodyBlack,
          ),
          dense: true,
          leading: Icon( Icons.notifications ),
          trailing: Icon( Icons.arrow_forward_ios ),
        ),
        ListTile(
          title: Text( 'Mis direcciónes',
            style: font.FontStyle(context).bodyBlack,
          ),
          dense: true,
          leading: Icon( Icons.map ),
          trailing: Icon( Icons.arrow_forward_ios ),
        ),
        ListTile(
          title: Text( 'Scan Qr Tienda',
            style: font.FontStyle(context).bodyBlack,
          ),
          dense: true,
          leading: Icon( Icons.center_focus_strong ),
          trailing: Icon( Icons.arrow_forward_ios ),
        ),
        ListTile(
          title: Text( 'Abrir Tienda',
            style: font.FontStyle(context).bodyBlack,
          ),
          dense: true,
          leading: Icon( Icons.store ),
          trailing: Icon( Icons.arrow_forward_ios ),
        ),
        Divider(),
        ListTile(
          title: Text( 'Configuraciones',
            style: font.FontStyle(context).bodyBlack,
          ),
          dense: true,
          leading: Icon( Icons.settings ),
          trailing: Icon( Icons.arrow_forward_ios ),
        ),
        ListTile(
          title: Text( 'Invita a un amigo',
            style: font.FontStyle(context).bodyBlack,
          ),
          dense: true,
          leading: Icon( Icons.person_add ),
          trailing: Icon( Icons.arrow_forward_ios ),
        ),
        ListTile(
          title: Text( 'Ayuda',
            style: font.FontStyle(context).bodyBlack,
          ),
          dense: true,
          leading: Icon( Icons.help ),
          trailing: Icon( Icons.arrow_forward_ios ),
        ),
        SwitchListTile(
          value: themeService.darkTheme,
          activeColor: theme.ColorApp(context).btnTabsIConColor,
          secondary: Icon( Icons.brightness_2 ),
          title: Text( 'Modo oscuro',
            style: font.FontStyle(context).bodyBlack,
          ),
          onChanged: ( value ) {
            themeService.darkTheme = value;
          }
        )
      ],
    ),
  );
}