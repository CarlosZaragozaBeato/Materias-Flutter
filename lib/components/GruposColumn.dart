import 'package:flutter/material.dart';
import 'package:materias_app/Data/model/Grupo.dart';
import 'package:materias_app/components/TextFieldCustom.dart';
class GruposColumn extends StatefulWidget {
  List<Grupo> lista = [];


  GruposColumn(this.lista, {Key? key}) : super(key: key);

  @override
  State<GruposColumn> createState() => _GruposColumnState();
}

class _GruposColumnState extends State<GruposColumn> {
  final GrupoController = TextEditingController();
  List<Grupo> lista_filtrada = [];

  void filtrarLista(String valor) {
    setState(() {lista_filtrada = widget.lista.where((element) => element.clave.toString().contains(valor)).toList();});
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
              child: TextFieldCustom(filtrarLista,"Grupos", GrupoController),
            ))
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          width: double.infinity,
          height: 250.0,
          child: ListView.builder(
              itemCount: lista_filtrada.isEmpty? widget.lista.length:lista_filtrada.length,
              itemBuilder: (_, index) =>GrupoItem(lista_filtrada.isEmpty?widget.lista[index]:lista_filtrada[index])),
        ),
      ],
    );
  }
}

class GrupoItem extends StatelessWidget {
  Grupo? grp;

  GrupoItem(this.grp,{Key? key}) : super(key: key);

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
                Text(grp!.clave.toString(),
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(grp!.crs!.codigoCurso.toString(),overflow: TextOverflow.ellipsis,),
                    Text(grp!.nombre.toString())],
                )
              ]
          ),
        ),
      ),
    );
  }
}





