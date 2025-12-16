
import 'package:app_tasques/data/tarea.dart';
import 'package:hive/hive.dart';

class RepositorioTarea {

  static const String claveListaTareas = "ListaTareas";
  static const String nombreBoxTareas = "BoxTareas_app_tareas";

  //Metodo get.
  Box<List<dynamic>> _getBox() {
    //Devuelva la box donde esta la lista con todas las tareas
    return Hive.box<List<dynamic>>(nombreBoxTareas);
  }

  //Metodo set.
  Future<void> setBox(List<dynamic> listaTareas) async {
    //Para operaciones que tienen un tiempo de espera,
    //podemos utilizar el async y el await
    await _getBox().put(claveListaTareas, listaTareas);
  }

  List<dynamic>? getListaTareas(){
    //Retorna la lista de tareas, la box de tareas nos es devuelta con el metodo _getBox().
    //Con esta box que nos devuelve, utilizamos el metodo get() de las box, para obtener la lista de tareas.
    return _getBox().get(
      claveListaTareas,
      defaultValue: <Tarea>[Tarea(titulo: "Tarea ejemplo")]
    );
  }

  Future<void> ponerTarea(Tarea tareaPorPoner) async {
    final List<dynamic>? listaTareas = getListaTareas();
    listaTareas?.add(tareaPorPoner);

    await setBox(listaTareas!);
  }

  Future<void> borrarTarea(int index) async{
    
    final List? listaTareas = getListaTareas();
    listaTareas?.removeAt(index);

    await setBox(listaTareas!);
  }

  Future<void> editarTarea(int index, Tarea tareaEditada) async{
    
    final List? listaTareas = getListaTareas();
    listaTareas![index] = tareaEditada;

    await setBox(listaTareas);
  }

}