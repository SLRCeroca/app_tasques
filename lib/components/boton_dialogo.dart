import 'package:app_tasques/colores_app.dart';
import 'package:flutter/material.dart';

class BotonDialogo extends StatelessWidget {
  final String textoBoton;
  final Color colorBoton;
  final Icon iconoBoton;
  final Function()? accionBoton;
  const BotonDialogo({
    super.key,
    required this.textoBoton,
    required this.colorBoton,
    required this.iconoBoton,
    this.accionBoton,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: accionBoton,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: colorBoton,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(iconoBoton.icon, color: ColoresApp().colorBlanco),
            SizedBox(width: 8),
            Text(textoBoton),
          ],
        ),
      ),
    );
  }
}
