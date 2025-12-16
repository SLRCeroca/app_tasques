import 'package:app_tasques/colores_app.dart';
import 'package:app_tasques/components/boton_dialogo.dart';
import 'package:app_tasques/components/textfield_personalizado.dart';
import 'package:app_tasques/data/repositorio_tarea.dart';
import 'package:app_tasques/data/tarea.dart';
import 'package:flutter/material.dart';

class DialogoNuevaTarea extends StatelessWidget {
  final String textoTarea;
  final int indexTarea;

  const DialogoNuevaTarea({super.key, this.textoTarea = " ", this.indexTarea = -1});
  @override
  Widget build(BuildContext context) {

    final TextEditingController controlerTextoTarea = TextEditingController();

    return AlertDialog(
      backgroundColor: ColoresApp().colorPrincipal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10),
      side: BorderSide(
        color: ColoresApp().colorBlanco
      )
      ),
      title: Text(
        "Que nueva tarea quieres añadir?",
        style: TextStyle(color: ColoresApp().colorPrincipalFuerte),
      ),
      content: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextfieldPersonalizado(controlerTitulo: controlerTextoTarea,),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotonDialogo(
                  textoBoton: "Cerrar",
                  colorBoton: ColoresApp().colorRechazar,
                  iconoBoton: Icon(Icons.close),
                  accionBoton: () {
                    cerrarTarea(context);
                  },
                ),
                BotonDialogo(
                  textoBoton: "Guardar",
                  colorBoton: ColoresApp().colorAceptar,
                  iconoBoton: Icon(Icons.save),
                  accionBoton: () {
                    guardarTarea(context, controlerTextoTarea.text);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void editarTarea(BuildContext context, String textoDeLaTarea) {
    RepositorioTarea repositorioTarea = RepositorioTarea();
    repositorioTarea.editarTarea(indexTarea, Tarea(titulo: textoDeLaTarea));
    Navigator.of(context).pop();
  }
  
  void guardarTarea(BuildContext context, String textoDeLaTarea) {
    RepositorioTarea repositorioTarea = RepositorioTarea();
    repositorioTarea.ponerTarea(Tarea(titulo: textoDeLaTarea));
    Navigator.of(context).pop();
  }

  void cerrarTarea(BuildContext context) {
    Navigator.of(context).pop();
  }
}
