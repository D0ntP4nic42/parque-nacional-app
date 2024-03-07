import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DadosGeraisRecord extends FirestoreRecord {
  DadosGeraisRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "saibaMais1" field.
  String? _saibaMais1;
  String get saibaMais1 => _saibaMais1 ?? '';
  bool hasSaibaMais1() => _saibaMais1 != null;

  // "saibaMais2" field.
  String? _saibaMais2;
  String get saibaMais2 => _saibaMais2 ?? '';
  bool hasSaibaMais2() => _saibaMais2 != null;

  // "local" field.
  LatLng? _local;
  LatLng? get local => _local;
  bool hasLocal() => _local != null;

  // "saibaMaisGeral" field.
  String? _saibaMaisGeral;
  String get saibaMaisGeral => _saibaMaisGeral ?? '';
  bool hasSaibaMaisGeral() => _saibaMaisGeral != null;

  void _initializeFields() {
    _saibaMais1 = snapshotData['saibaMais1'] as String?;
    _saibaMais2 = snapshotData['saibaMais2'] as String?;
    _local = snapshotData['local'] as LatLng?;
    _saibaMaisGeral = snapshotData['saibaMaisGeral'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dadosGerais');

  static Stream<DadosGeraisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DadosGeraisRecord.fromSnapshot(s));

  static Future<DadosGeraisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DadosGeraisRecord.fromSnapshot(s));

  static DadosGeraisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DadosGeraisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DadosGeraisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DadosGeraisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DadosGeraisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DadosGeraisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDadosGeraisRecordData({
  String? saibaMais1,
  String? saibaMais2,
  LatLng? local,
  String? saibaMaisGeral,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'saibaMais1': saibaMais1,
      'saibaMais2': saibaMais2,
      'local': local,
      'saibaMaisGeral': saibaMaisGeral,
    }.withoutNulls,
  );

  return firestoreData;
}

class DadosGeraisRecordDocumentEquality implements Equality<DadosGeraisRecord> {
  const DadosGeraisRecordDocumentEquality();

  @override
  bool equals(DadosGeraisRecord? e1, DadosGeraisRecord? e2) {
    return e1?.saibaMais1 == e2?.saibaMais1 &&
        e1?.saibaMais2 == e2?.saibaMais2 &&
        e1?.local == e2?.local &&
        e1?.saibaMaisGeral == e2?.saibaMaisGeral;
  }

  @override
  int hash(DadosGeraisRecord? e) => const ListEquality()
      .hash([e?.saibaMais1, e?.saibaMais2, e?.local, e?.saibaMaisGeral]);

  @override
  bool isValidKey(Object? o) => o is DadosGeraisRecord;
}
