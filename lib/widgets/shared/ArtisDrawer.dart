import 'package:artis_app/blocs/blocLogin.dart';
import 'package:artis_app/locale/AppLang.dart';
import 'package:artis_app/models/UserModel.dart';
import 'package:flutter/material.dart';


/// Clase que crea un Drawer para reutilizar en todos los Scaffold de la app
class ArtisDrawer extends StatelessWidget {
  String accountName = '';
  String accountEmail = '';
  String currentAccountPicture = '';
  List<String> items = ['Mi Perfil', 'Noticias', 'Mensajes', 'Eventos', 'La Ruta del Café'];

  ArtisDrawer() {
    blocLogin.userLogged.listen((data) {
      accountName = '${data.nombre} ${data.apellido}';
      accountEmail = data.email;
      currentAccountPicture = '';
    });
  }

  /// Función que crea los items del Drawer para el usuario logueado
  /// 
  /// Función privada que crea los items a los que el usuario logueado puede acceder
  Widget _buildListAccessLogged(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            AppLang.of(context).trans('landingItemsProfile'), 
            style: TextStyle(color: Theme.of(context).primaryColor)
          ),
          leading: Icon(Icons.person, color: Theme.of(context).primaryColor,),
        ),
        ListTile(
          title: Text(
            AppLang.of(context).trans('landingItemsNews'), 
            style: TextStyle(color: Theme.of(context).primaryColor)
          ),
          leading: Icon(Icons.new_releases, color: Theme.of(context).primaryColor),
        ),
        ListTile(
          title: Text(
            AppLang.of(context).trans('landingItemsMessages'), 
            style: TextStyle(color: Theme.of(context).primaryColor)
          ),
          leading: Icon(Icons.sms, color: Theme.of(context).primaryColor),
        ),
        ListTile(
          title: Text(
            AppLang.of(context).trans('landingItemsEvents'), 
            style: TextStyle(color: Theme.of(context).primaryColor)
          ),
          leading: Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
        ),
        ListTile(
          title: Text(
            AppLang.of(context).trans('landingItemsTheCoffeeRoute'), 
            style: TextStyle(color: Theme.of(context).primaryColor)
          ),
          leading: Icon(Icons.wrap_text, color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }


  /// Función que crea los items del Drawer para el usuario no logueado
  /// 
  /// Función privada que crea los items a los que el usuario no logueado puede acceder
  Widget _buildListAccessNoLogged(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            AppLang.of(context).trans('landingItemsEvents'), 
            style: TextStyle(color: Theme.of(context).primaryColor)
          ),
          leading: Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
        ),
        ListTile(
          title: Text(
            AppLang.of(context).trans('landingItemsTheCoffeeRoute'),  
            style: TextStyle(color: Theme.of(context).primaryColor)
          ),
          leading: Icon(Icons.wrap_text, color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final drawerHeader = UserAccountsDrawerHeader(
      accountEmail: Text(accountEmail),
      accountName: Text(accountName),
      currentAccountPicture: ClipRRect(        
        borderRadius: BorderRadius.circular(200),
        child: FadeInImage( 
          fit: BoxFit.cover,
          placeholder:  AssetImage('assets/images/placeholder_user.png'),
          image: NetworkImage(''),
        ),
      ),
    );
    final drawerItems = Column(
      children: <Widget>[
        drawerHeader,
        accountEmail.isNotEmpty
        ? _buildListAccessLogged(context) 
        : _buildListAccessNoLogged(context),
        Expanded(child: Container()),
        ListTile(title: 
          Text(
            AppLang.of(context).trans('drawerSignOff'),  
            style: TextStyle(color: Theme.of(context).primaryColor)
          ),
          leading: Icon(Icons.exit_to_app, color: Theme.of(context).primaryColor),
          onTap: () {
            blocLogin.changeLogged(false);
            blocLogin.changeUser(UserModel(id: '', origen: '', nombre: '', apellido: '', email: ''));
          },
        )
      ],
    );

    return Drawer(
      child: drawerItems,
    );
  }
}
