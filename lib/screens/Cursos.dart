
import 'package:flutter/material.dart';
import 'package:materias_app/Data/model/Curso.dart';
import 'package:materias_app/Data/responses/Data.dart';
import 'package:materias_app/Data/responses/PostData.dart';
import 'package:materias_app/components/CursosColumn.dart';
import 'package:materias_app/components/TextFieldCustom.dart';

class Cursos extends StatefulWidget {
  static String routeName = "/CursosScreen";
  Cursos({Key? key}) : super(key: key);

  @override
  State<Cursos> createState() => _CursosState();
}

class _CursosState extends State<Cursos> {
  List<Curso> _lista_cursos = [];
  TextEditingController codigoCurso = TextEditingController();
  TextEditingController abreviaturaCurso = TextEditingController();
  TextEditingController descripcionCurso = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


  void getData()async{

    Data.GetCursos().then((value) => {setState(() {_lista_cursos = value!;})}).whenComplete(() => print(_lista_cursos.length));
  }



  void createData() {
    if (codigoCurso.text.isNotEmpty &&
        descripcionCurso.text.isNotEmpty &&
        abreviaturaCurso.text.isNotEmpty) {
      Curso crs = Curso(codigoCurso: int.parse(codigoCurso.text),
          descripcionCurso: descripcionCurso.text,
          abreviaturaCurso: abreviaturaCurso.text);

      PostData.createCurso(crs);

      descripcionCurso.text = "";
      abreviaturaCurso.text = "";
      codigoCurso.text = "";

      getData();
    }
  }
  void updateData() async{
    if (codigoCurso.text.isNotEmpty &&
        descripcionCurso.text.isNotEmpty &&
        abreviaturaCurso.text.isNotEmpty){
      Curso crs = Curso(codigoCurso:int.parse(codigoCurso.text),
          descripcionCurso: descripcionCurso.text,
          abreviaturaCurso: abreviaturaCurso.text);

      PostData.updateCurso(crs);

      descripcionCurso.text = "";
      abreviaturaCurso.text = "";
      codigoCurso.text = "";
      }
    getData();
  }

  void deleteById(){
    if (codigoCurso.text.isNotEmpty){
        PostData.deleteById(int.parse(codigoCurso.text));
        codigoCurso.text = "";
    }
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          _lista_cursos.isEmpty? CircularProgressIndicator():CursosColumn(_lista_cursos),
          const SizedBox(height: 15.0),
          Divider(color:Color(0xffFF5722), thickness: 2,indent: 10, endIndent: 10,height: 15,),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFieldCustom((p0) => {}, "Codigo Curso", codigoCurso),
                const SizedBox(height: 15.0),
                TextFieldCustom((p0) => {}, "Abreviatura Curso", abreviaturaCurso),
                const SizedBox(height: 15.0),
                TextFieldCustom((p0) => {}, "Descripcion Curso", descripcionCurso),
                const SizedBox(height: 30.0),
              ]
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){createData();},
                  child: Text("Create",
                          style: TextStyle(fontSize: 18.0)),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff00ADB5)))),
              ElevatedButton(onPressed: (){updateData();},
                  child: Text("Update",
                          style: TextStyle(fontSize: 18.0),),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff00ADB5)))),
              ElevatedButton(onPressed: (){deleteById();},
                  child: Text("Delete",
                          style: TextStyle(fontSize: 18.0),),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff00ADB5))))
            ],
          )
        ],
      ),
    );}
  }

