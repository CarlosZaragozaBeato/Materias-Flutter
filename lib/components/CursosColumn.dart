import 'package:flutter/material.dart';
import 'package:materias_app/Data/model/Curso.dart';
import 'package:materias_app/components/TextFieldCustom.dart';



class CursosColumn extends StatefulWidget {
  List<Curso> lista = [];


  CursosColumn(this.lista, {Key? key}) : super(key: key);

  @override
  State<CursosColumn> createState() => _CursosColumnState();
}

class _CursosColumnState extends State<CursosColumn> {
  final CursoController = TextEditingController();
  List<Curso> lista_filtrada = [];

  void filtrarLista(String valor) {
    setState(() {
      lista_filtrada = widget.lista.where((element) => element.codigoCurso.toString().contains(valor)).toList();
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
            child: TextFieldCustom(filtrarLista,"Cursos", CursoController),
          ))
      ],
    ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            height: 250.0,
            child: ListView.builder(
                itemCount: lista_filtrada.isEmpty? widget.lista.length:lista_filtrada.length,
                itemBuilder: (_, index) =>CursoItem(lista_filtrada.isEmpty?widget.lista[index]:lista_filtrada[index])),
          ),
      ],
    );
  }
}

class CursoItem extends StatelessWidget {
  Curso? crs;

  CursoItem(this.crs,{Key? key}) : super(key: key);

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
              Text(crs!.codigoCurso.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(crs!.descripcionCurso.toString(),overflow: TextOverflow.ellipsis,),
                  Text(crs!.abreviaturaCurso.toString())],
              )
            ]
          ),
        ),
      ),
    );
  }
}





