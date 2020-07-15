import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Recibo {
  final int idRec;
  final int idAlum;
  final String apeNom;
  final int ciclo;
  final String concepto;
  final int idconcepto;
  final String numero;
  final String dni;
  final String nombre;
  final String moneda;
  final String moneda2;
  final double importe;
  final double importe_tc;
  final String fecha;
  final String anio_ingreso;
  final int idPrograma;
  final String nomPrograma;
  final String sigla_programa;
  final String codAlumno;
  final String estado;
  final String descripcion_ubi;
  final String descripcion_tipo;
  final String estado_civil;
  final bool validado;
  final String repitencia;
  //final int id_tip_grado;
  final int id_tipo_recaudacion;
  final String observacion;

  Recibo(
      {this.idRec,
      this.idAlum,
      this.apeNom,
      this.ciclo,
      this.concepto,
      this.idconcepto,
      this.numero,
      this.dni,
      this.nombre,
      this.moneda,
      this.moneda2,
      this.importe,
      this.importe_tc,
      this.fecha,
      this.anio_ingreso,
      this.idPrograma,
      this.nomPrograma,
      this.sigla_programa,
      this.codAlumno,
      this.estado,
      this.descripcion_ubi,
      this.descripcion_tipo,
      this.estado_civil,
      this.validado,
      this.repitencia,
      //this.id_tip_grado,
      this.id_tipo_recaudacion,
      this.observacion});

  factory Recibo.fromJson(Map<String, dynamic> json) {
    return Recibo(
      idRec: json['idRec'] as int,
      idAlum: json['idAlum'] as int,
      apeNom: json['apeNom'] as String,
      ciclo: json['ciclo'] as int,
      concepto: json['concepto'] as String,
      idconcepto: json['idconcepto'] as int,
      numero: json['numero'] as String,
      dni: json['dni'] as String,
      nombre: json['nombre'] as String,
      moneda: json['moneda'] as String,
      moneda2: json['moneda2'] as String,
      importe: json['importe'] as double,
      importe_tc: json['importe_tc'] as double,
      fecha: json['fecha'] as String,
      anio_ingreso: json['anio_ingreso'] as String,
      idPrograma: json['idPrograma'] as int,
      nomPrograma: json['nomPrograma'] as String,
      sigla_programa: json['sigla_programa'] as String,
      codAlumno: json['codAlumno'] as String,
      estado: json['estado'] as String,
      descripcion_ubi: json['descripcion_ubi'] as String,
      descripcion_tipo: json['descripcion_tipo'] as String,
      estado_civil: json['estado_civil'] as String,
      validado: json['validado'] as bool,
      repitencia: json['repitencia'] as String,
      //id_tip_grado: json['id_tip_grado'] as int,
      id_tipo_recaudacion: json['id_tipo_recaudacion'] as int,
      observacion: json['observacion'] as String,
    );
  }
}

// A function that converts a response body into a List<Voucher>.
Future<List<Recibo>> fetchVouchers(http.Client client, String idAlumno) async {
  final response = await client.get(
      'https://sigapdev2-consultarecibos-back.herokuapp.com/recaudaciones/alumno/concepto/listar_cod/$idAlumno');
  // Use the compute function to run parsePhotos in a separate isolate.

  return compute(parseVoucher, response.body);
}

List<Recibo> parseVoucher(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Recibo>((json) => Recibo.fromJson(json)).toList();
}
