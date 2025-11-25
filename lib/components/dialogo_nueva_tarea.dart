import 'package:app_tasques/colores_app.dart';
import 'package:app_tasques/components/boton_dialogo.dart';
import 'package:flutter/material.dart';

class DialogoNuevaTarea extends StatelessWidget {
  const DialogoNuevaTarea({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColoresApp().colorPrincipal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
      title: Text(
        "Que nueva tarea quieres añadir?",
        style: TextStyle(color: ColoresApp().colorPrincipalFuerte),
      ),
      content: Container(
        child: Column(
          children: [
            TextField(),
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
                    guardarTarea(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void guardarTarea(BuildContext context) {
    Navigator.of(context).pop();
  }

  void cerrarTarea(BuildContext context) {
    Navigator.of(context).pop();
  }
}
