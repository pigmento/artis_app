import 'package:flutter/material.dart';


/// Clase que crea el isotipo de Artis
class ArtisIso extends StatelessWidget {
  final double aFontSize;

  ArtisIso({this.aFontSize});
  
  @override
  Widget build(BuildContext context) {
    return Text(
      'Artis Coffee', 
      style: TextStyle(color: Theme.of(context).primaryColor, 
        fontSize: aFontSize,
        fontFamily: 'Nexa',
        fontStyle: FontStyle.italic 
      )      // fontFamily: 'NexaBlac',)
    );
 }
}