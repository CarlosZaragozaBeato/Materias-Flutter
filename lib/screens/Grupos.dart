
import 'package:flutter/material.dart';
import 'package:materias_app/Data/model/Grupo.dart';
import 'package:materias_app/Data/responses/Data.dart';
import 'package:materias_app/components/GruposColumn.dart';
import 'package:materias_app/components/TextFieldCustom.dart';

class Grupos extends StatefulWidget {
  Grupos({Key? key}) : super(key: key);

  @override
  State<Grupos> createState() => _GruposState();
}

class _GruposState extends State<Grupos> {
  List<Grupo> _lista_grupos = [];
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
    Data.GetGrupos()
        .then((value) => {setState(() {_lista_grupos = value!;})}).whenComplete(() => print(_lista_grupos.length));
  }



  void createData() {
    if (clave.text.isNotEmpty &&
        nombre.text.isNotEmpty &&
        departamento.text.isNotEmpty &&
        Iso.text.isNotEmpty &&
        codigo_curso.text.isNotEmpty) {



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
          _lista_grupos.isEmpty? CircularProgressIndicator():GruposColumn(_lista_grupos
          ),
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

