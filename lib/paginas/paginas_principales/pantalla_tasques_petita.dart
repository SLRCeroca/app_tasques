import 'package:app_tasques/colores_app.dart';
import 'package:app_tasques/components/dialogo_nueva_tarea.dart';
import 'package:app_tasques/components/item_tarea.dart';
import 'package:app_tasques/data/repositorio_tarea.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class PantallaTasquesPetita extends StatefulWidget {
  const PantallaTasquesPetita({super.key});

  @override
  State<PantallaTasquesPetita> createState() => _PantallaTasquesPetitaState();
}

class _PantallaTasquesPetitaState extends State<PantallaTasquesPetita> {
  @override
  Widget build(BuildContext context) {

    RepositorioTarea repositorioTarea = RepositorioTarea();

    return Scaffold(
      backgroundColor: ColoresApp().colorBackground,
      appBar: AppBar(
        backgroundColor: ColoresApp().colorPrincipal,
        title: const Text('Pantalla Pequeña'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward, color: ColoresApp().colorSecundario),
          ),
        ],
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 2,
          decoration: BoxDecoration(
            color: ColoresApp().colorBlanco,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
              )
            ]
            ),
        ),
        Expanded(

          child: ValueListenableBuilder( 
            //Como todo listener, se ejecuta solo cuando "siente" ("listen") que pasa algo.
            // En este caso ese algo es algun cambio en la box.
            valueListenable: Hive.box<List<dynamic>>(RepositorioTarea.nombreBoxTareas).listenable(), 
            builder: (context, Box<List<dynamic>> boxTareas, _) {
              final listaTareas = repositorioTarea.getListaTareas();
              return ListView.builder(
                itemCount: listaTareas?.length,
                itemBuilder: (context, index){
                  return ItemTarea(textoCheckbox: listaTareas![index].titulo, indexTarea: index,);
                }
                );
            }
            ),

          /*child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ItemTarea(textoCheckbox: index.toString(),);
            },
          ),*/
        ),
      ],),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              abrirDialogoNuevaTarea(context);
            },
            shape: CircleBorder(side: BorderSide(color: ColoresApp().colorSecundario)),
            backgroundColor:ColoresApp().colorPrincipal,
            child: Icon(Icons.add, color: ColoresApp().colorSecundario),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: () {},
            shape: CircleBorder(side: BorderSide(color: ColoresApp().colorSecundario)),
            backgroundColor:ColoresApp().colorPrincipal,
            child: Icon(Icons.check, color: ColoresApp().colorSecundario),
          ),
        ],
      ),
    );
  }

  void abrirDialogoNuevaTarea(BuildContext context){
    //showDialog es una funcion de flutter que abre un Dialog que hayamos creado/definido.
    showDialog(
      context: context, 
      builder: (context){
        return DialogoNuevaTarea();
      },
      );
  }
}
