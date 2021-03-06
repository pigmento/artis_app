import 'package:artis_app/locale/AppLang.dart';
import 'package:flutter/material.dart';
import 'package:artis_app/widgets/pages/Login/FacebookSignInButton.dart';
import 'package:artis_app/widgets/pages/Login/GoogleSignInButton.dart';
// import 'package:artis_app/widgets/pages/Login/InstagramSignInButton.dart';
import 'package:artis_app/widgets/pages/Login/UserPassSignIn.dart';
import 'package:artis_app/widgets/shared/ArtisLogo.dart';
import 'package:artis_app/widgets/shared/ArtisIso.dart';


/// Clase que crea la pantalla de login de la App
class Login extends StatelessWidget {
  

 @override
 Widget build(BuildContext context) {
  double _paddingHorizontal = MediaQuery.of(context).size.width * 0.15;

  return Scaffold(
    // appBar: AppBar(      
    //   title: Text('Login'),
    // ),
    body: ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: _paddingHorizontal),
          child: Column(            
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: ArtisLogo(aWidth: 100),
              ),
              ArtisIso(aFontSize: 20),
              SizedBox(height: 10,),
              UserPassSignIn(),
              SizedBox(height: 30,),
              GoogleSignInButton(),
              SizedBox(height: 15,),
              FacebookSignInButton(), 
              SizedBox(height: 15,),
              // InstagramSignInButton(),
              // SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  print('Ingresar como no registrado');
                  Navigator.pushNamed(context, '/landingNoLogged');
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 60),
                  child: Text(AppLang.of(context).trans('loginEnterAsAGuest'), style: TextStyle(color: Theme.of(context).primaryColor))
                ),
              )
            ],
          ),
        )
      ]
    ),
  );
 }
}