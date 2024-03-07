import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "doc" field.
  DocumentReference? _doc;
  DocumentReference? get doc => _doc;
  bool hasDoc() => _doc != null;

  // "aulaSub" field.
  int? _aulaSub;
  int get aulaSub => _aulaSub ?? 0;
  bool hasAulaSub() => _aulaSub != null;

  // "oficinaSub" field.
  int? _oficinaSub;
  int get oficinaSub => _oficinaSub ?? 0;
  bool hasOficinaSub() => _oficinaSub != null;

  // "aulaPresenca" field.
  int? _aulaPresenca;
  int get aulaPresenca => _aulaPresenca ?? 0;
  bool hasAulaPresenca() => _aulaPresenca != null;

  // "oficinaPresenca" field.
  int? _oficinaPresenca;
  int get oficinaPresenca => _oficinaPresenca ?? 0;
  bool hasOficinaPresenca() => _oficinaPresenca != null;

  // "turmaEducacao" field.
  DocumentReference? _turmaEducacao;
  DocumentReference? get turmaEducacao => _turmaEducacao;
  bool hasTurmaEducacao() => _turmaEducacao != null;

  // "turmaOficinestra" field.
  DocumentReference? _turmaOficinestra;
  DocumentReference? get turmaOficinestra => _turmaOficinestra;
  bool hasTurmaOficinestra() => _turmaOficinestra != null;

  // "instituicao" field.
  String? _instituicao;
  String get instituicao => _instituicao ?? '';
  bool hasInstituicao() => _instituicao != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "completoOficinestra" field.
  bool? _completoOficinestra;
  bool get completoOficinestra => _completoOficinestra ?? false;
  bool hasCompletoOficinestra() => _completoOficinestra != null;

  // "completoCurso" field.
  bool? _completoCurso;
  bool get completoCurso => _completoCurso ?? false;
  bool hasCompletoCurso() => _completoCurso != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _cpf = snapshotData['cpf'] as String?;
    _doc = snapshotData['doc'] as DocumentReference?;
    _aulaSub = castToType<int>(snapshotData['aulaSub']);
    _oficinaSub = castToType<int>(snapshotData['oficinaSub']);
    _aulaPresenca = castToType<int>(snapshotData['aulaPresenca']);
    _oficinaPresenca = castToType<int>(snapshotData['oficinaPresenca']);
    _turmaEducacao = snapshotData['turmaEducacao'] as DocumentReference?;
    _turmaOficinestra = snapshotData['turmaOficinestra'] as DocumentReference?;
    _instituicao = snapshotData['instituicao'] as String?;
    _cidade = snapshotData['cidade'] as String?;
    _completoOficinestra = snapshotData['completoOficinestra'] as bool?;
    _completoCurso = snapshotData['completoCurso'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  String? phoneNumber,
  String? photoUrl,
  DateTime? createdTime,
  String? cpf,
  DocumentReference? doc,
  int? aulaSub,
  int? oficinaSub,
  int? aulaPresenca,
  int? oficinaPresenca,
  DocumentReference? turmaEducacao,
  DocumentReference? turmaOficinestra,
  String? instituicao,
  String? cidade,
  bool? completoOficinestra,
  bool? completoCurso,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'cpf': cpf,
      'doc': doc,
      'aulaSub': aulaSub,
      'oficinaSub': oficinaSub,
      'aulaPresenca': aulaPresenca,
      'oficinaPresenca': oficinaPresenca,
      'turmaEducacao': turmaEducacao,
      'turmaOficinestra': turmaOficinestra,
      'instituicao': instituicao,
      'cidade': cidade,
      'completoOficinestra': completoOficinestra,
      'completoCurso': completoCurso,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.cpf == e2?.cpf &&
        e1?.doc == e2?.doc &&
        e1?.aulaSub == e2?.aulaSub &&
        e1?.oficinaSub == e2?.oficinaSub &&
        e1?.aulaPresenca == e2?.aulaPresenca &&
        e1?.oficinaPresenca == e2?.oficinaPresenca &&
        e1?.turmaEducacao == e2?.turmaEducacao &&
        e1?.turmaOficinestra == e2?.turmaOficinestra &&
        e1?.instituicao == e2?.instituicao &&
        e1?.cidade == e2?.cidade &&
        e1?.completoOficinestra == e2?.completoOficinestra &&
        e1?.completoCurso == e2?.completoCurso;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.phoneNumber,
        e?.photoUrl,
        e?.createdTime,
        e?.cpf,
        e?.doc,
        e?.aulaSub,
        e?.oficinaSub,
        e?.aulaPresenca,
        e?.oficinaPresenca,
        e?.turmaEducacao,
        e?.turmaOficinestra,
        e?.instituicao,
        e?.cidade,
        e?.completoOficinestra,
        e?.completoCurso
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
