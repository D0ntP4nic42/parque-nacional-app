import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nova_turma_widget.dart' show NovaTurmaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NovaTurmaModel extends FlutterFlowModel<NovaTurmaWidget> {
  ///  Local state fields for this component.

  List<String> cursos = [];
  void addToCursos(String item) => cursos.add(item);
  void removeFromCursos(String item) => cursos.remove(item);
  void removeAtIndexFromCursos(int index) => cursos.removeAt(index);
  void insertAtIndexInCursos(int index, String item) =>
      cursos.insert(index, item);
  void updateCursosAtIndex(int index, Function(String) updateFn) =>
      cursos[index] = updateFn(cursos[index]);

  int aulas = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
