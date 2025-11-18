import 'package:app_tasques/colores_app.dart';
import 'package:app_tasques/components/item_tarea.dart';
import 'package:flutter/material.dart';

class PantallaTasquesPetita extends StatelessWidget {
  const PantallaTasquesPetita({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresApp().colorBackground,
      appBar: AppBar(
        backgroundColor: ColoresApp().colorPrincipal,
        title: const Text('Pantalla Pequeña'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: ColoresApp().colorSecundario),
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
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ItemTarea(textoCheckbox: index.toString(),);
            },
          ),
        ),
      ],),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
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
}
