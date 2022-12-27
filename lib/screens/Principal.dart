import 'package:flutter/material.dart';
import 'package:materias_app/Data/model/Curso.dart';
import 'package:materias_app/Data/model/Grupo.dart';
import 'package:materias_app/Data/model/Materia.dart';
import 'package:materias_app/Data/responses/Data.dart';
import 'package:materias_app/components/CursosColumn.dart';
import 'package:materias_app/components/GruposColumn.dart';
import 'package:materias_app/components/MateriasColumn.dart';


class Principal extends StatefulWidget {



  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();


}

class _PrincipalState extends State<Principal> {
  List<Materia> _lista_materias = [];
  List<Curso> _lista_cursos = [];
  List<Grupo> _lista_grupos = [];

  @override
  void initState() {
    super.initState();
    getData();
  }



  void getData() async{
      Data.GetMaterias().then((value) => {setState(() {_lista_materias = value!;})}).whenComplete(() => print(_lista_materias.length));
      Data.GetGrupos().then((value) => {setState(()=>{_lista_grupos = value!})}).whenComplete(() => print(_lista_grupos.length));
      Data.GetCursos().then((value) => {setState(() {_lista_cursos = value!;})}).whenComplete(() => print(_lista_cursos.length));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:[
          _lista_cursos.isEmpty? CircularProgressIndicator():CursosColumn(_lista_cursos),
          const  SizedBox(height: 15.0),
          Divider(color:Color(0xffFF5722), thickness: 2,indent: 10, endIndent: 10,height: 15,),
          const SizedBox(height: 15.0),
          _lista_grupos.isEmpty? CircularProgressIndicator():GruposColumn(_lista_grupos),
          Divider(color:Color(0xffFF5722), thickness: 2,indent: 10, endIndent: 10,height: 15,),
          const SizedBox(height: 15.0),
          _lista_materias.isEmpty? CircularProgressIndicator():MateriasColumn(_lista_materias),
        ]
      ),
    );
  }
}

