import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:materias_app/Data/model/Curso.dart';

class PostData{

 static Future<http.Response> createCurso(Curso crs) {
    return http.post(
      Uri.parse('http://192.168.1.141:8085/cursos/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'codigoCurso': crs.codigoCurso,
        "abreviaturaCurso": crs.abreviaturaCurso,
        "descripcionCurso": crs.descripcionCurso
      }),
    );
  }

   static Future<http.Response> updateCurso(Curso crs) {
    return http.put(
      Uri.parse('http://192.168.1.141:8085/cursos/update'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'codigoCurso': crs.codigoCurso,
        "abreviaturaCurso": crs.abreviaturaCurso,
        "descripcionCurso": crs.descripcionCurso
      }),
    );
  }
  static Future<http.Response> deleteById(int id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://192.168.1.141:8085/cursos/delete/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }

}