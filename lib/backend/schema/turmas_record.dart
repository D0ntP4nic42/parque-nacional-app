import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TurmasRecord extends FirestoreRecord {
  TurmasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "turmaNome" field.
  String? _turmaNome;
  String get turmaNome => _turmaNome ?? '';
  bool hasTurmaNome() => _turmaNome != null;

  // "turmaCurso" field.
  String? _turmaCurso;
  String get turmaCurso => _turmaCurso ?? '';
  bool hasTurmaCurso() => _turmaCurso != null;

  // "dataAula" field.
  DateTime? _dataAula;
  DateTime? get dataAula => _dataAula;
  bool hasDataAula() => _dataAula != null;

  // "dataAula2" field.
  DateTime? _dataAula2;
  DateTime? get dataAula2 => _dataAula2;
  bool hasDataAula2() => _dataAula2 != null;

  // "dataAula3" field.
  DateTime? _dataAula3;
  DateTime? get dataAula3 => _dataAula3;
  bool hasDataAula3() => _dataAula3 != null;

  void _initializeFields() {
    _turmaNome = snapshotData['turmaNome'] as String?;
    _turmaCurso = snapshotData['turmaCurso'] as String?;
    _dataAula = snapshotData['dataAula'] as DateTime?;
    _dataAula2 = snapshotData['dataAula2'] as DateTime?;
    _dataAula3 = snapshotData['dataAula3'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('turmas');

  static Stream<TurmasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TurmasRecord.fromSnapshot(s));

  static Future<TurmasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TurmasRecord.fromSnapshot(s));

  static TurmasRecord fromSnapshot(DocumentSnapshot snapshot) => TurmasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TurmasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TurmasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TurmasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TurmasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTurmasRecordData({
  String? turmaNome,
  String? turmaCurso,
  DateTime? dataAula,
  DateTime? dataAula2,
  DateTime? dataAula3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'turmaNome': turmaNome,
      'turmaCurso': turmaCurso,
      'dataAula': dataAula,
      'dataAula2': dataAula2,
      'dataAula3': dataAula3,
    }.withoutNulls,
  );

  return firestoreData;
}

class TurmasRecordDocumentEquality implements Equality<TurmasRecord> {
  const TurmasRecordDocumentEquality();

  @override
  bool equals(TurmasRecord? e1, TurmasRecord? e2) {
    return e1?.turmaNome == e2?.turmaNome &&
        e1?.turmaCurso == e2?.turmaCurso &&
        e1?.dataAula == e2?.dataAula &&
        e1?.dataAula2 == e2?.dataAula2 &&
        e1?.dataAula3 == e2?.dataAula3;
  }

  @override
  int hash(TurmasRecord? e) => const ListEquality().hash(
      [e?.turmaNome, e?.turmaCurso, e?.dataAula, e?.dataAula2, e?.dataAula3]);

  @override
  bool isValidKey(Object? o) => o is TurmasRecord;
}
