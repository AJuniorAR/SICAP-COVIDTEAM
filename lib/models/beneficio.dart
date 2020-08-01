import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Beneficio {
  final String cod_alumno;
  final int id_beneficio;
  final int benef_otrogado;
  final String benef_max;
  final String tipo;
  final String autorizacion;
  final String resolucion;
  final String id_bc;
  final String condicion;
  final String fecha;
  final int id_abp;
  final String criterio;
  final String observacion;

  Beneficio(
      {this.cod_alumno,
      this.id_beneficio,
      this.benef_otrogado,
      this.benef_max,
      this.tipo,
      this.autorizacion,
      this.resolucion,
      this.id_bc,
      this.condicion,
      this.fecha,
      this.id_abp,
      this.criterio,
      this.observacion});

  factory Beneficio.fromJson(Map<String, dynamic> json) {
    return Beneficio(
      cod_alumno: json['cod_alumno'] as String,
      id_beneficio: json['id_beneficio'] as int,
      benef_otrogado: json['benef_otrogado'] as int,
      benef_max: json['benef_max'] as String,
      tipo: json['tipo'] as String,
      autorizacion: json['autorizacion'] as String,
      id_bc: json['id_bc'] as String,
      condicion: json['condicion'] as String,
      fecha: json['fecha'] as String,
      id_abp: json['id_abp'] as int,
      criterio: json['criterio'] as String,
      observacion: json['observacion'] as String,
    );
  }
}

Future<List<Beneficio>> fetchVouchers(
    http.Client client, String idAlumno) async {
  final response = await client.get(
      'https://sigapdev2-consultarecibos-back.herokuapp.com/beneficio/listar/$idAlumno');

  // Use the compute function to run parsePhotos in a separate isolate.

  return compute(parseBeneficio, response.body);
}

List<Beneficio> parseBeneficio(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Beneficio>((json) => Beneficio.fromJson(json)).toList();
}
