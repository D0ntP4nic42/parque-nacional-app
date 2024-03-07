import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/popups/help/help_widget.dart';
import 'calendario_widget.dart' show CalendarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarioModel extends FlutterFlowModel<CalendarioWidget> {
  ///  Local state fields for this page.

  ReservasRecord? varReservaClicada;

  List<DocumentReference> refAgendados = [];
  void addToRefAgendados(DocumentReference item) => refAgendados.add(item);
  void removeFromRefAgendados(DocumentReference item) =>
      refAgendados.remove(item);
  void removeAtIndexFromRefAgendados(int index) => refAgendados.removeAt(index);
  void insertAtIndexInRefAgendados(int index, DocumentReference item) =>
      refAgendados.insert(index, item);
  void updateRefAgendadosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      refAgendados[index] = updateFn(refAgendados[index]);

  bool indisponivel = true;

  bool sundayClicked = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future buscarAgendadas(BuildContext context) async {
    List<AgendamentoRecord>? outAgendadas;

    outAgendadas = await queryAgendamentoRecordOnce(
      queryBuilder: (agendamentoRecord) => agendamentoRecord.where(
        'data',
        isEqualTo: calendarSelectedDay?.start,
      ),
    );
    refAgendados = outAgendadas!
        .map((e) => e.refreserva)
        .withoutNulls
        .toList()
        .toList()
        .cast<DocumentReference>();
  }

  /// Additional helper methods are added here.
}
