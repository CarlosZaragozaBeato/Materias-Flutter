import 'package:flutter/material.dart';
import 'package:materias_app/Data/model/Materia.dart';
import 'package:materias_app/Data/responses/Data.dart';
import 'package:materias_app/Data/responses/PostMaterias.dart';
import 'package:materias_app/components/MateriasColumn.dart';
import 'package:materias_app/components/TextFieldCustom.dart';

class Materias extends StatefulWidget {
  static String routeName = "/CursosScreen";
  Materias({Key? key}) : super(key: key);

  @override
  State<Materias> createState() => _MateriasState();
}

class _MateriasState extends State<Materias> {
  List<Materia> _lista_materias = [];
  TextEditingController clave = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController departamento = TextEditingController();
  TextEditingController Iso = TextEditingController();
  TextEditingController codigo_curso = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


  void getData()async{
    Data.GetMaterias().then((value) => {setState(() {_lista_materias = value!;})}).whenComplete(() => print(_lista_materias.length));
  }



  void createData() {
    if (clave.text.isNotEmpty &&
        nombre.text.isNotEmpty &&
        departamento.text.isNotEmpty &&
        Iso.text.isNotEmpty &&
        codigo_curso.text.isNotEmpty) {


      PostMaterias.createMateria(clave.text,
          nombre.text,
          departamento.text,
          Iso.text,
          codigo_curso.text);

          clave.text ="";
          nombre.text =="";
          departamento.text ="";
          Iso.text ="";
          codigo_curso.text ="";

      getData();
    }
  }
  void updateData() async{
    if (clave.text.isNotEmpty &&
        nombre.text.isNotEmpty &&
        departamento.text.isNotEmpty &&
        Iso.text.isNotEmpty &&
        codigo_curso.text.isNotEmpty) {


    }
    getData();
  }

  void deleteById(){
    if (clave.text.isNotEmpty &&
        nombre.text.isNotEmpty &&
        departamento.text.isNotEmpty &&
        Iso.text.isNotEmpty &&
        codigo_curso.text.isNotEmpty) {
      getData();
    }
    }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          _lista_materias.isEmpty? CircularProgressIndicator():MateriasColumn(_lista_materias),
          const SizedBox(height: 15.0),
          Divider(color:Color(0xffFF5722), thickness: 2,indent: 10, endIndent: 10,height: 15,),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                children: [
                  TextFieldCustom((p0) => {}, "Clave", clave),
                  const SizedBox(height: 15.0),
                  TextFieldCustom((p0) => {}, "Nombre Curso", nombre),
                  const SizedBox(height: 15.0),
                  TextFieldCustom((p0) => {}, "Departamento", departamento),
                  const SizedBox(height: 15.0),
                  TextFieldCustom((p0) => {}, "Iso", Iso),
                  const SizedBox(height: 15.0),
                  TextFieldCustom((p0) => {}, "Codigo Curso", codigo_curso),
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

