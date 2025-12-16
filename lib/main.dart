import 'package:app_tasques/data/repositorio_tarea.dart';
import 'package:app_tasques/data/tarea.dart';
import 'package:app_tasques/paginas/paginas_principales/pantalla_tasques_gran.dart';
import 'package:app_tasques/paginas/paginas_principales/pantalla_tasques_mediana.dart';
import 'package:app_tasques/paginas/paginas_principales/pantalla_tasques_petita.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  //Para probar Hive en web se tiene que abrir siempre en el mismo puerto
  //flutter run -d chrome --web-port 52975
  runApp(const MainApp());

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TareaAdapter());

  await Hive.openBox<List<dynamic>>(RepositorioTarea.nombreBoxTareas);
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

Dependencias:
Se añaden al pubspec dentro de "dependencies".
En una terminal hacemos: flutter pub add <nombre>
Instalamos: flutter_slidable, hive y hive_flutter
  Si por ejemplo hive_flutter nos da error que necesitamos añadir scripts l ordenador
  lo escribimos otra vez y ya esta.

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
