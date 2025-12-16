import 'package:app_tasques/colores_app.dart';
import 'package:app_tasques/components/dialogo_nueva_tarea.dart';
import 'package:app_tasques/data/repositorio_tarea.dart';
import 'package:app_tasques/data/tarea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTarea extends StatefulWidget {
  final bool valorInicialCheckbox;
  final String textoCheckbox;
  final int indexTarea;
  const ItemTarea({
    super.key,
    this.valorInicialCheckbox = false,
    this.textoCheckbox = "",
    this.indexTarea = 1,
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
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), 
      children: [
        SlidableAction(icon: Icons.edit,
        backgroundColor: ColoresApp().colorSecundario,
        borderRadius: BorderRadius.circular(10),
        onPressed:  (context) {

        },),
        SlidableAction(icon: Icons.delete,
        backgroundColor: ColoresApp().colorRechazar,
        borderRadius: BorderRadius.circular(10),
        onPressed:  (context) {
          RepositorioTarea repositorioTarea = RepositorioTarea();
          repositorioTarea.borrarTarea(widget.indexTarea);
        },),
      ]),
      child: Container(
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
                    //??: si valor es null, ponlo falso.
                  });
                  RepositorioTarea repositorioTarea = RepositorioTarea();
                  Tarea tareaEditada = Tarea(titulo: widget.textoCheckbox, completada: valorCheckbox);
                  repositorioTarea.editarTarea(widget.indexTarea, tareaEditada);
                },
              ),
            ),
            //Text.
            Text(
              widget.textoCheckbox,
              style: TextStyle(
                color: ColoresApp().colorBlanco,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void abrirDialogoEditarTarea(BuildContext context, int indexTarea){
    //showDialog es una funcion de flutter que abre un Dialog que hayamos creado/definido.
    showDialog(
      context: context, 
      builder: (context){
        return DialogoNuevaTarea(textoTarea: widget.textoCheckbox, indexTarea: widget.indexTarea,);
      },
      );
  }
}
