
import 'package:materias_app/Data/model/Curso.dart';

class Grupo{
  final int? clave;
  final String? nombre;
  final String? descripcionCurso;
  final Curso? crs;

  Grupo( {this.clave,this.descripcionCurso,this.nombre, this.crs});
}