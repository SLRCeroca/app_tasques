import 'package:app_tasques/colores_app.dart';
import 'package:flutter/material.dart';

class ItemTarea extends StatefulWidget {
  final bool valorInicialCheckbox;
  final String textoCheckbox;
  const ItemTarea({
    super.key,
    this.valorInicialCheckbox = false,
    this.textoCheckbox = "",
  });

  @override
  State<ItemTarea> createState() => _ItemTareaState();
}

class _ItemTareaState extends State<ItemTarea> {
  late bool valorCheckbox;
  //late: Declarar valor pero no sabemos todavia el valor

  @override
  void initState() {
    super.initState();
    valorCheckbox = widget.valorInicialCheckbox;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColoresApp().colorSecundarioFuerte,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          //CheckBox.
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              side: BorderSide(color: ColoresApp().colorBlanco, width: 2),
              shape: CircleBorder(),
              value: valorCheckbox,
              activeColor: ColoresApp().colorPrincipalFuerte,
              checkColor: ColoresApp().colorBlanco,
              onChanged: (valor) {
                setState(() {
                  valorCheckbox = valor ?? false;
                  //??: so valor es null, ponlo falso.
                });
              },
            ),
          ),
          //Text.
          Text(
            widget.textoCheckbox + " - Tarea ha hacer.",
            style: TextStyle(
              color: ColoresApp().colorBlanco,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
