import 'package:app_tasques/paginas/paginas_principales/pantalla_tasques_gran.dart';
import 'package:app_tasques/paginas/paginas_principales/pantalla_tasques_mediana.dart';
import 'package:app_tasques/paginas/paginas_principales/pantalla_tasques_petita.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*
Lo que queremos: Cargar 3 pantallas diferents segun la pantalla del dispositivo
- Pantalla pequeña: mobil (anchura < 600)
- Pantalla mediana: tablet (anchura < 1200)
- Pantalla grande: escritorio (anchura => 1200)

MediaQuery.of(context).size.width nos da la anchura

If ternario: condición ? valor_cierto : valor_falso

Saber Orientacion dispositivo:
MediaQuery.of(context).orientation
- Dice la orientacion Orientation.portrait (mobil vertical) o Orientation.landscape (mobil horizontal)

Saber tipo de dispositivo:
kisWeb: true si es web false si es mobil o escritorio
Platform.isAndroid/IOS/Windows/Linux/MacOS

*/

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dispositivoWeb = kIsWeb;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaQuery.of(context).size.width < 600
          ? PantallaTasquesPetita()
          : MediaQuery.of(context).size.width < 1200
          ? PantallaTasquesMediana()
          : PantallaTasquesGran(),
    );
  }
}
