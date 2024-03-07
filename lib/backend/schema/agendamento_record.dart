import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendamentoRecord extends FirestoreRecord {
  AgendamentoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reserva" field.
  String? _reserva;
  String get reserva => _reserva ?? '';
  bool hasReserva() => _reserva != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "refreserva" field.
  DocumentReference? _refreserva;
  DocumentReference? get refreserva => _refreserva;
  bool hasRefreserva() => _refreserva != null;

  void _initializeFields() {
    _reserva = snapshotData['reserva'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _refreserva = snapshotData['refreserva'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('agendamento');

  static Stream<AgendamentoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgendamentoRecord.fromSnapshot(s));

  static Future<AgendamentoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgendamentoRecord.fromSnapshot(s));

  static AgendamentoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AgendamentoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgendamentoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgendamentoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgendamentoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgendamentoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgendamentoRecordData({
  String? reserva,
  DateTime? data,
  DocumentReference? refreserva,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reserva': reserva,
      'data': data,
      'refreserva': refreserva,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgendamentoRecordDocumentEquality implements Equality<AgendamentoRecord> {
  const AgendamentoRecordDocumentEquality();

  @override
  bool equals(AgendamentoRecord? e1, AgendamentoRecord? e2) {
    return e1?.reserva == e2?.reserva &&
        e1?.data == e2?.data &&
        e1?.refreserva == e2?.refreserva;
  }

  @override
  int hash(AgendamentoRecord? e) =>
      const ListEquality().hash([e?.reserva, e?.data, e?.refreserva]);

  @override
  bool isValidKey(Object? o) => o is AgendamentoRecord;
}
