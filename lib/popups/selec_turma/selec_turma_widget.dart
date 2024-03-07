import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selec_turma_model.dart';
export 'selec_turma_model.dart';

class SelecTurmaWidget extends StatefulWidget {
  const SelecTurmaWidget({
    super.key,
    required this.curso,
    String? instituicao,
    required this.cidade,
  }) : this.instituicao = instituicao ?? 'Nenhuma';

  final String? curso;
  final String instituicao;
  final String? cidade;

  @override
  State<SelecTurmaWidget> createState() => _SelecTurmaWidgetState();
}

class _SelecTurmaWidgetState extends State<SelecTurmaWidget> {
  late SelecTurmaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelecTurmaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Material(
          color: Colors.transparent,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Color(0xFFF1F4F8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Color(0xFF3D3939),
                width: 1.0,
              ),
            ),
            child: StreamBuilder<List<DadosGeraisRecord>>(
              stream: queryDadosGeraisRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<DadosGeraisRecord> columnDadosGeraisRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnDadosGeraisRecord =
                    columnDadosGeraisRecordList.isNotEmpty
                        ? columnDadosGeraisRecordList.first
                        : null;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: StreamBuilder<List<TurmasRecord>>(
                          stream: queryTurmasRecord(
                            queryBuilder: (turmasRecord) => turmasRecord
                                .where(
                                  'turmaCurso',
                                  isEqualTo: widget.curso,
                                )
                                .orderBy('turmaNome'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<TurmasRecord> listViewTurmasRecordList =
                                snapshot.data!;
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewTurmasRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 4.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewTurmasRecord =
                                    listViewTurmasRecordList[listViewIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (listViewTurmasRecord.turmaCurso ==
                                        'Oficinestra de Percepção Ambiental - Prof Genebaldo Freire Dias') {
                                      // Caso Oficinestra

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        turmaOficinestra:
                                            listViewTurmasRecord.reference,
                                      ));

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        oficinaSub: 1,
                                        oficinaPresenca: 0,
                                        completoOficinestra: false,
                                      ));

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        cidade: widget.cidade,
                                      ));
                                    } else {
                                      // Caso Aula

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        turmaEducacao:
                                            listViewTurmasRecord.reference,
                                      ));

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        aulaSub: 1,
                                        aulaPresenca: 0,
                                        completoCurso: false,
                                      ));

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        instituicao: widget.instituicao,
                                        cidade: widget.cidade,
                                      ));
                                    }

                                    context.pushNamed('Screen_cursos');
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        listViewTurmasRecord.turmaNome,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                            ),
                                      ),
                                      Text(
                                        dateTimeFormat(
                                          'd/M',
                                          listViewTurmasRecord.dataAula!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                            ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: 'Voltar',
                            icon: Icon(
                              Icons.keyboard_backspace,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: 260.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF975D65),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
