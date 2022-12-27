import 'package:flutter/material.dart';
import 'package:materias_app/Data/model/Materia.dart';
import 'package:materias_app/components/TextFieldCustom.dart';

class MateriasColumn extends StatefulWidget {
  List<Materia> lista = [];


  MateriasColumn(this.lista, {Key? key}) : super(key: key);

  @override
  State<MateriasColumn> createState() => _MateriasColumnState();
}

class _MateriasColumnState extends State<MateriasColumn> {
  final MateriasController = TextEditingController();
  List<Materia> lista_filtrada = [];

  void filtrarLista(String valor) {
    setState(() {
      lista_filtrada = widget.lista.where((element) => element.clave.toString().contains(valor)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: TextFieldCustom(filtrarLista,"Materias", MateriasController),
            ))
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          width: double.infinity,
          height: 250.0,
          child: ListView.builder(
              itemCount: lista_filtrada.isEmpty? widget.lista.length:lista_filtrada.length,
              itemBuilder: (_, index) =>MateriasItem(lista_filtrada.isEmpty?widget.lista[index]:lista_filtrada[index])),
        ),
      ],
    );
  }
}

class MateriasItem extends StatelessWidget {
  Materia? mtr;

  MateriasItem(this.mtr,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 150.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mtr!.clave.toString(),
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    Text(mtr!.ISO.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mtr!.crs!.codigoCurso.toString(),overflow: TextOverflow.ellipsis,),
                    Text(mtr!.nombre.toString()),
                    Text(mtr!.departamento.toString()),
                   ],
                )


              ]
          ),
        ),
      ),
    );
  }
}