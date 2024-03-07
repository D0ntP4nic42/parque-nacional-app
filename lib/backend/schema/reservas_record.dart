import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservasRecord extends FirestoreRecord {
  ReservasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeReserva" field.
  String? _nomeReserva;
  String get nomeReserva => _nomeReserva ?? '';
  bool hasNomeReserva() => _nomeReserva != null;

  void _initializeFields() {
    _nomeReserva = snapshotData['nomeReserva'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservas');

  static Stream<ReservasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservasRecord.fromSnapshot(s));

  static Future<ReservasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservasRecord.fromSnapshot(s));

  static ReservasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservasRecordData({
  String? nomeReserva,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeReserva': nomeReserva,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservasRecordDocumentEquality implements Equality<ReservasRecord> {
  const ReservasRecordDocumentEquality();

  @override
  bool equals(ReservasRecord? e1, ReservasRecord? e2) {
    return e1?.nomeReserva == e2?.nomeReserva;
  }

  @override
  int hash(ReservasRecord? e) => const ListEquality().hash([e?.nomeReserva]);

  @override
  bool isValidKey(Object? o) => o is ReservasRecord;
}
