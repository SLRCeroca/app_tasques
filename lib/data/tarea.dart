/*
Usamos BD Hive.
Es no SQL

Instalamos las dev_dependencies
hive_generator
build_runner

  flutter pub add --dev hive_generator
  flutter pub add --dev build_rummer

Despuesde haver creado la classe generamos el .g.dart

Despues escribimos part 'tarea.g.dart'
y ejecutamos a la terminal:
  flutter pub run build_runner build.
  La cual nos genera tarea.g.dart automaticamente.

  El nombre del archivo tarea.dart tiene que ser igual que 
  el nombre de la clase en minisculas.

*/

import 'package:hive/hive.dart';

part 'tarea.g.dart';

@HiveType(typeId: 0) //De 0 a 255
class Tarea extends HiveObject{
  
  @HiveField(0)
  String titulo;

  @HiveField(1)
  bool completada;
  

  Tarea({
    required this.titulo,
    this.completada = false, //Se crea un checkbox no marcado
  });
}