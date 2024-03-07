import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _locPresenca =
          latLngFromString(prefs.getString('ff_locPresenca')) ?? _locPresenca;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _locPresenca = LatLng(-16.058029, -47.987448);
  LatLng? get locPresenca => _locPresenca;
  set locPresenca(LatLng? _value) {
    _locPresenca = _value;
    _value != null
        ? prefs.setString('ff_locPresenca', _value.serialize())
        : prefs.remove('ff_locPresenca');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
