import 'package:app_tasques/colores_app.dart';
import 'package:flutter/material.dart';

class TextfieldPersonalizado extends StatelessWidget {
  final TextEditingController controlerTitulo;
  const TextfieldPersonalizado({super.key, required this.controlerTitulo});

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controlerTitulo,

      cursorColor: ColoresApp().colorSecundarioFuerte,
      cursorWidth: 1,
      style: TextStyle(
        color: ColoresApp().colorSecundarioFuerte,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),

      decoration: InputDecoration(
        hint: Row(
          children: [
            Icon(Icons.edit, color: ColoresApp().colorSecundario,),
            Text("Introduze tu nueva tarea",
            style: TextStyle(
            color: ColoresApp().colorSecundarioFuerte,
            fontSize: 18,
            fontStyle: FontStyle.italic
                  ),
            ),
          ],
        ),
        filled: true,
        fillColor: ColoresApp().colorPrincipal,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColoresApp().colorSecundario
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColoresApp().colorSecundario
          ),
        ),
      ),
    );
  }
}