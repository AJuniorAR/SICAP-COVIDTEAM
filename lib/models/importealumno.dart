import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class ImporteAlumno {
  final String cod_alumno;
  final int cod_programa;
  final int cod_concepto;
  final int importe;
  final int id_tipo_recaudacion;
  final String id_moneda;

  ImporteAlumno(
      {this.cod_alumno,
      this.cod_programa,
      this.cod_concepto,
      this.importe,
      this.id_tipo_recaudacion,
      this.id_moneda});

  factory ImporteAlumno.fromJson(Map<String, dynamic> json) {
    return ImporteAlumno(
      cod_alumno: json['cod_alumno'] as String,
      cod_programa: json['cod_programa'] as int,
      cod_concepto: json['cod_concepto'] as int,
      importe: json['importe'] as int,
      id_tipo_recaudacion: json['id_tipo_recaudacion'] as int,
      id_moneda: json['id_moneda'] as String,
    );
  }
}

Future<List<ImporteAlumno>> fetchVouchers(http.Client client, String idAlumno,
    int idPrograma, int idConcepto, idTipoRec) async {
  final response = await client.get(
      'https://sigapdev2-consultarecibos-back.herokuapp.com/alumnoprograma/buscard/$idAlumno/$idPrograma/$idConcepto/$idTipoRec');

  // Use the compute function to run parsePhotos in a separate isolate.

  return compute(parseImporteAlumno, response.body);
}

List<ImporteAlumno> parseImporteAlumno(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<ImporteAlumno>((json) => ImporteAlumno.fromJson(json))
      .toList();
}
