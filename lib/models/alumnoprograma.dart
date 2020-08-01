import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class AlumnoPrograma {
  final String codAlumno;
  final String apePaterno;
  final String apeMaterno;
  final String nomAlumno;
  final String codEspecialidad;
  final String codTipIngreso;
  final String codSitu;
  final String codPerm;
  final String anioIngreso;
  final String dniM;
  final int idPrograma;
  final String nom_programa;
  final String siglaProg;

  AlumnoPrograma(
      {this.codAlumno,
      this.apePaterno,
      this.apeMaterno,
      this.nomAlumno,
      this.codEspecialidad,
      this.codTipIngreso,
      this.codSitu,
      this.codPerm,
      this.anioIngreso,
      this.dniM,
      this.idPrograma,
      this.nom_programa,
      this.siglaProg});

  factory AlumnoPrograma.fromJson(Map<String, dynamic> json) {
    return AlumnoPrograma(
      codAlumno: json['codAlumno'] as String,
      apePaterno: json['apePaterno'] as String,
      apeMaterno: json['apeMaterno'] as String,
      nomAlumno: json['nomAlumno'] as String,
      codEspecialidad: json['codEspecialidad'] as String,
      codTipIngreso: json['codTipIngreso'] as String,
      codSitu: json['codSitu'] as String,
      codPerm: json['codPerm'] as String,
      anioIngreso: json['anioIngreso'] as String,
      dniM: json['dniM'] as String,
      idPrograma: json['idPrograma'] as int,
      nom_programa: json['nom_programa'] as String,
      siglaProg: json['siglaProg'] as String,
    );
  }
}

Future<List<AlumnoPrograma>> fetchVouchers(
    http.Client client, String dniAlumno) async {
  final response = await client.get(
      'https://sigapdev2-consultarecibos-back.herokuapp.com/alumnoprograma/buscard/$dniAlumno');
  // Use the compute function to run parsePhotos in a separate isolate.

  return compute(parseAlumnoPrograma, response.body);
}

List<AlumnoPrograma> parseAlumnoPrograma(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<AlumnoPrograma>((json) => AlumnoPrograma.fromJson(json))
      .toList();
}
