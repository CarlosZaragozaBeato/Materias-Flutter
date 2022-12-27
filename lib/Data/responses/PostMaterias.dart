import 'package:http/http.dart' as http;
import 'package:materias_app/Data/model/Curso.dart';
import 'dart:convert';
import 'package:materias_app/Data/model/Materia.dart';
import 'package:materias_app/Data/responses/Data.dart';

class PostMaterias{

  static Future<http.Response> createMateria (
      String clave,
      String nombre,
      String departamento,
      String Iso,
      String codigo_curso) async{

    Curso? crs = null;
    Data.GetCurso(int.parse(codigo_curso))
        .then((value) => {crs = value!})
        .whenComplete(() => {print(crs?.descripcionCurso)});
    return http.post(
      Uri.parse('http://192.168.1.141:8085/materias/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "clave": clave,
        "nombre": nombre,
        "curso": {
          "codigoCurso": crs?.codigoCurso,
          "abreviaturaCurso": crs?.abreviaturaCurso,
          "descripcionCurso": crs?.descripcionCurso
        },
        "departamento": departamento,
        "iso": Iso
      }),
    );

  }

  static Future<http.Response?> updateMateria(
      String clave,
      String nombre,
      String departamento,
      String Iso,
      String codigo_curso) {
    Curso? crs = null;
    Data.GetCurso(int.parse(codigo_curso))
        .then((value) => {crs = value!})
        .whenComplete(() => {print(crs?.codigoCurso)});
    if(crs != null){
    return http.put(
      Uri.parse('http://192.168.1.141:8085/materias/update'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "clave": clave,
        "nombre": nombre,
        "curso": {
          "codigoCurso": crs!.codigoCurso,
          "abreviaturaCurso": crs!.abreviaturaCurso,
          "descripcionCurso": crs!.descripcionCurso
        },
        "departamento": departamento,
        "iso": Iso
      }),
    );
    }
    return Future(() => null);
  }
  static Future<http.Response> deleteById(int id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://192.168.1.141:8085/materias/delete/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }
}