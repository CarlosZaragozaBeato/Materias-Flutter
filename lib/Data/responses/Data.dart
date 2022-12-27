import 'package:http/http.dart' as http;
import 'package:materias_app/Data/model/Curso.dart';
import 'package:materias_app/Data/model/Grupo.dart';
import 'package:materias_app/Data/model/Materia.dart';
import 'dart:convert' as convert;




class Data{


  static Future<List<Curso>?> GetCursos() async{
      Future<List<Curso>?> lista_cursos = Future(() => null);
      var url =
      Uri.http('192.168.1.141:8085', '/cursos', {'q': '{http}'});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse =
        convert.jsonDecode(response.body);
        lista_cursos = Future(() => _recuperarCursos(jsonResponse));
      } else {print(response);}
      return lista_cursos;
  }
  static Future<Curso?> GetCurso(int id) async {
    Future<Curso?> crs_future = Future(() => null);
    var url =
    Uri.http('192.168.1.141:8085', '/cursos/$id', {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body);
      Curso crs = Curso(codigoCurso: jsonResponse['codigoCurso'],
          abreviaturaCurso: jsonResponse['abreviaturaCurso'],
          descripcionCurso: jsonResponse['descripcionCurso']);
      crs_future = Future(() => crs);
    } else {print(response);}
    return crs_future;
  }
  static List<Curso> _recuperarCursos(List<dynamic> lista_string){
    List<Curso> lista_cursos = [];
     lista_string.forEach((element) {
      Curso crs = Curso(codigoCurso: element['codigoCurso'],
                            abreviaturaCurso: element['abreviaturaCurso'],
                            descripcionCurso: element['descripcionCurso']);
      lista_cursos.add(crs);
    });
    return lista_cursos;
  }
  /**
   * Recupero Las Materias
   */
  static Future<List<Materia>?> GetMaterias() async{
    Future<List<Materia>?>  _lista_materias = Future(() => null);
    var url =
    Uri.http('192.168.1.141:8085', '/materias', {'q': '{http}'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as List<dynamic>;
      _lista_materias =  Future(() => _recuperarMaterias(jsonResponse));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return _lista_materias;
  }
  static List<Materia> _recuperarMaterias(List<dynamic> lista_string){
    List<Materia> lista_materias = [];
    lista_string.forEach((element) {
      Materia mtr = Materia(
          departamento: element['departamento'],
          crs: Curso(codigoCurso: element['curso']['codigoCurso'],
              abreviaturaCurso:  element['curso']['abreviaturaCurso'],
              descripcionCurso:  element['curso']['descripcionCurso']),
          clave: element['clave'],
          nombre: element['nombre'],
          ISO: element['iso']);
      lista_materias.add(mtr);
    });
    return lista_materias;
  }
  /**
   * Recupero Los Grupos
   */
  static Future<List<Grupo>?> GetGrupos() async{

    Future<List<Grupo>?> _lista_grupos = Future(() => null);
    var url =
    Uri.http('192.168.1.141:8085', '/grupos', {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as List<dynamic>;
      _lista_grupos = Future(() => _recuperarGrupos(jsonResponse));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return _lista_grupos;
  }
  static List<Grupo> _recuperarGrupos(List<dynamic> lista_string){
    List<Grupo> lista_grupos = [];
    lista_string.forEach((element) {
      Grupo grp = Grupo(
          crs: Curso(codigoCurso: element['codigoCurso']['codigoCurso'],
              abreviaturaCurso:  element['codigoCurso']['abreviaturaCurso'],
              descripcionCurso:  element['codigoCurso']['descripcionCurso']),
          clave: element['clave'],
          nombre: element['nombre']);
      lista_grupos.add(grp);
    });
    return lista_grupos;
  }
}