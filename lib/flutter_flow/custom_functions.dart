import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? search(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.contains(textSearchFor);
}

double geoDistance(
  LatLng currentLocation,
  LatLng targetLocation,
) {
  // get the distance between two latlong values and return in miles as a string
  final double earthRadius = 3958.8; // in miles
  final double lat1 = math.pi / 180.0 * currentLocation.latitude;
  final double lon1 = math.pi / 180.0 * currentLocation.longitude;
  final double lat2 = math.pi / 180.0 * targetLocation.latitude;
  final double lon2 = math.pi / 180.0 * targetLocation.longitude;
  final double dLat = lat2 - lat1;
  final double dLon = lon2 - lon1;
  final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1) * math.cos(lat2) * math.sin(dLon / 2) * math.sin(dLon / 2);
  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  final double distance = earthRadius * c;
  return double.parse(distance.toStringAsFixed(1));
}

DateTime data2(DateTime dataAula1) {
  DateTime dataAula2 = dataAula1.add(const Duration(days: 1));

  return dataAula2;
}

bool? dataCompare(
  DateTime data1,
  DateTime data2,
) {
  bool falsoVerdadeiro = false;

  if (data1.day == data2.day &&
      data1.month == data2.month &&
      data1.year == data2.year) {
    falsoVerdadeiro = true;
  }

  return falsoVerdadeiro;
}

String dataMostrar(
  int aula,
  int presenca,
  DateTime dataAula,
) {
  String resultado =
      dataAula.day.toString() + "/" + dataAula.month.toString() + ", Ausente";

  if (aula == 1) {
    if (presenca == 1 || presenca == 4 || presenca == 5 || presenca == 7) {
      resultado = dataAula.day.toString() +
          "/" +
          dataAula.month.toString() +
          ", Presente";
    }
  } else if (aula == 2) {
    if (presenca == 2 || presenca == 4 || presenca == 6 || presenca == 7) {
      resultado = dataAula.day.toString() +
          "/" +
          dataAula.month.toString() +
          ", Presente";
    }
  } else if (aula == 3) {
    if (presenca == 3 || presenca == 5 || presenca == 6 || presenca == 7) {
      resultado = dataAula.day.toString() +
          "/" +
          dataAula.month.toString() +
          ", Presente";
    }
  }

  return resultado;
}

String? salvarPresenca(
  bool check1,
  bool check2,
  bool check3,
) {
  return "oi";
}
