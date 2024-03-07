import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'presenca_teste_model.dart';
export 'presenca_teste_model.dart';

class PresencaTesteWidget extends StatefulWidget {
  const PresencaTesteWidget({
    super.key,
    required this.turmaRef,
  });

  final DocumentReference? turmaRef;

  @override
  State<PresencaTesteWidget> createState() => _PresencaTesteWidgetState();
}

class _PresencaTesteWidgetState extends State<PresencaTesteWidget> {
  late PresencaTesteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PresencaTesteModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return StreamBuilder<TurmasRecord>(
      stream: TurmasRecord.getDocument(widget.turmaRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final presencaTesteTurmasRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.4,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Color(0xFFC7A99E)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 8.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Color(0xFFD9D9D9),
                                borderRadius: 20.0,
                                borderWidth: 0.0,
                                buttonSize: 40.0,
                                fillColor: Color(0xFFD9D9D9),
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Color(0xFF121618),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.2,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 90.0,
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF62272D),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.9,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.person,
                                    color: Color(0xFF975D65),
                                    size: 80.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 3.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                currentUserDisplayName,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF0D0F11),
                                      fontSize: 25.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 40.0, 16.0, 32.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 7.0,
                                  color: Color(0x2F1D2429),
                                  offset: Offset(0.0, 3.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: ListView(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF1F4F8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 8.0,
                                                                12.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Dia ${dateTimeFormat(
                                                                        'd/M',
                                                                        presencaTesteTurmasRecord
                                                                            .dataAula,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            color:
                                                                                Color(0xFF14181B),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Theme(
                                                            data: ThemeData(
                                                              checkboxTheme:
                                                                  CheckboxThemeData(
                                                                visualDensity:
                                                                    VisualDensity
                                                                        .compact,
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                              ),
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                            ),
                                                            child: Checkbox(
                                                              value: _model
                                                                  .checkboxValue1 ??= presencaTesteTurmasRecord.turmaCurso ==
                                                                      'Oficinestra de Percepção Ambiental - Prof Genebaldo Freire Dias'
                                                                  ? (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.oficinaPresenca,
                                                                          0) ==
                                                                      1)
                                                                  : ((valueOrDefault(currentUserDocument?.aulaPresenca, 0) == 1) ||
                                                                      (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.aulaPresenca,
                                                                              0) ==
                                                                          4) ||
                                                                      (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.aulaPresenca,
                                                                              0) ==
                                                                          5) ||
                                                                      (valueOrDefault(
                                                                              currentUserDocument?.aulaPresenca,
                                                                              0) ==
                                                                          7)),
                                                              onChanged: (!functions.dataCompare(
                                                                          presencaTesteTurmasRecord
                                                                              .dataAula!,
                                                                          getCurrentTimestamp)! ||
                                                                      (functions.geoDistance(
                                                                              currentUserLocationValue!,
                                                                              FFAppState()
                                                                                  .locPresenca!) >
                                                                          100.0) ||
                                                                      (presencaTesteTurmasRecord.turmaCurso ==
                                                                              FFAppConstants
                                                                                  .oficinestra
                                                                          ? (valueOrDefault(currentUserDocument?.oficinaPresenca, 0) ==
                                                                              1)
                                                                          : ((valueOrDefault(currentUserDocument?.aulaPresenca, 0) == 1) ||
                                                                              (valueOrDefault(currentUserDocument?.aulaPresenca, 0) == 4) ||
                                                                              (valueOrDefault(currentUserDocument?.aulaPresenca, 0) == 5) ||
                                                                              (valueOrDefault(currentUserDocument?.aulaPresenca, 0) == 7))))
                                                                  ? null
                                                                  : (newValue) async {
                                                                      setState(() =>
                                                                          _model.checkboxValue1 =
                                                                              newValue!);
                                                                    },
                                                              activeColor: Color(
                                                                  0x9362272D),
                                                              checkColor: (!functions.dataCompare(
                                                                          presencaTesteTurmasRecord
                                                                              .dataAula!,
                                                                          getCurrentTimestamp)! ||
                                                                      (functions.geoDistance(
                                                                              currentUserLocationValue!,
                                                                              FFAppState()
                                                                                  .locPresenca!) >
                                                                          100.0) ||
                                                                      (presencaTesteTurmasRecord.turmaCurso ==
                                                                              FFAppConstants
                                                                                  .oficinestra
                                                                          ? (valueOrDefault(currentUserDocument?.oficinaPresenca, 0) ==
                                                                              1)
                                                                          : ((valueOrDefault(currentUserDocument?.aulaPresenca, 0) == 1) ||
                                                                              (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                  4) ||
                                                                              (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                  5) ||
                                                                              (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                  7))))
                                                                  ? null
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (presencaTesteTurmasRecord
                                                      .dataAula2 !=
                                                  null)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF1F4F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  12.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Dia ${dateTimeFormat(
                                                                          'd/M',
                                                                          presencaTesteTurmasRecord
                                                                              .dataAula2,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: Color(0xFF14181B),
                                                                              fontSize: 18.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .compact,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                              ),
                                                              child: Checkbox(
                                                                value: _model
                                                                    .checkboxValue2 ??= (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.aulaPresenca,
                                                                            0) ==
                                                                        2) ||
                                                                    (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.aulaPresenca,
                                                                            0) ==
                                                                        4) ||
                                                                    (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.aulaPresenca,
                                                                            0) ==
                                                                        6) ||
                                                                    (valueOrDefault(
                                                                            currentUserDocument?.aulaPresenca,
                                                                            0) ==
                                                                        7),
                                                                onChanged: (!functions.dataCompare(
                                                                            presencaTesteTurmasRecord
                                                                                .dataAula2!,
                                                                            getCurrentTimestamp)! ||
                                                                        (functions.geoDistance(currentUserLocationValue!, FFAppState().locPresenca!) >
                                                                            100.0) ||
                                                                        ((valueOrDefault(currentUserDocument?.aulaPresenca, 0) == 2) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                4) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                6) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                7)))
                                                                    ? null
                                                                    : (newValue) async {
                                                                        setState(() =>
                                                                            _model.checkboxValue2 =
                                                                                newValue!);
                                                                      },
                                                                activeColor: Color(
                                                                    0x9362272D),
                                                                checkColor: (!functions.dataCompare(
                                                                            presencaTesteTurmasRecord
                                                                                .dataAula2!,
                                                                            getCurrentTimestamp)! ||
                                                                        (functions.geoDistance(currentUserLocationValue!, FFAppState().locPresenca!) >
                                                                            100.0) ||
                                                                        ((valueOrDefault(currentUserDocument?.aulaPresenca, 0) == 2) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                4) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                6) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                7)))
                                                                    ? null
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (presencaTesteTurmasRecord
                                                      .dataAula3 !=
                                                  null)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF1F4F8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  12.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Dia ${dateTimeFormat(
                                                                          'd/M',
                                                                          presencaTesteTurmasRecord
                                                                              .dataAula3,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: Color(0xFF14181B),
                                                                              fontSize: 18.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .compact,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                              ),
                                                              child: Checkbox(
                                                                value: _model
                                                                    .checkboxValue3 ??= (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.aulaPresenca,
                                                                            0) ==
                                                                        3) ||
                                                                    (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.aulaPresenca,
                                                                            0) ==
                                                                        5) ||
                                                                    (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.aulaPresenca,
                                                                            0) ==
                                                                        6) ||
                                                                    (valueOrDefault(
                                                                            currentUserDocument?.aulaPresenca,
                                                                            0) ==
                                                                        7),
                                                                onChanged: (!functions.dataCompare(
                                                                            presencaTesteTurmasRecord
                                                                                .dataAula2!,
                                                                            getCurrentTimestamp)! ||
                                                                        (functions.geoDistance(currentUserLocationValue!, FFAppState().locPresenca!) >
                                                                            100.0) ||
                                                                        ((valueOrDefault(currentUserDocument?.aulaPresenca, 0) == 3) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                5) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                6) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                7)))
                                                                    ? null
                                                                    : (newValue) async {
                                                                        setState(() =>
                                                                            _model.checkboxValue3 =
                                                                                newValue!);
                                                                      },
                                                                activeColor: Color(
                                                                    0x9362272D),
                                                                checkColor: (!functions.dataCompare(
                                                                            presencaTesteTurmasRecord
                                                                                .dataAula2!,
                                                                            getCurrentTimestamp)! ||
                                                                        (functions.geoDistance(currentUserLocationValue!, FFAppState().locPresenca!) >
                                                                            100.0) ||
                                                                        ((valueOrDefault(currentUserDocument?.aulaPresenca, 0) == 3) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                5) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                6) ||
                                                                            (valueOrDefault(currentUserDocument?.aulaPresenca, 0) ==
                                                                                7)))
                                                                    ? null
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 70.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final firestoreBatch =
                                  FirebaseFirestore.instance.batch();
                              try {
                                if (presencaTesteTurmasRecord.turmaCurso ==
                                    'Oficinestra de Percepção Ambiental - Prof Genebaldo Freire Dias') {
                                  if (_model.checkboxValue1!) {
                                    firestoreBatch.update(
                                        currentUserReference!,
                                        createUsersRecordData(
                                          oficinaPresenca: 1,
                                          completoOficinestra: true,
                                        ));
                                  }
                                } else {
                                  if (presencaTesteTurmasRecord.dataAula2 ==
                                      null) {
                                    if (_model.checkboxValue1!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 1,
                                            completoCurso: true,
                                          ));
                                    }
                                  } else if (presencaTesteTurmasRecord
                                          .dataAula3 ==
                                      null) {
                                    if (_model.checkboxValue1! &&
                                        _model.checkboxValue2!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 4,
                                            completoCurso: true,
                                          ));
                                    } else if (_model.checkboxValue1!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 1,
                                          ));
                                    } else if (_model.checkboxValue2!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 2,
                                          ));
                                    }
                                  } else {
                                    if (_model.checkboxValue1! &&
                                        _model.checkboxValue2! &&
                                        _model.checkboxValue3!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 7,
                                            completoCurso: true,
                                          ));
                                    } else if (_model.checkboxValue1! &&
                                        _model.checkboxValue2!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 4,
                                          ));
                                    } else if (_model.checkboxValue1! &&
                                        _model.checkboxValue3!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 5,
                                          ));
                                    } else if (_model.checkboxValue2! &&
                                        _model.checkboxValue3!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 6,
                                          ));
                                    } else if (_model.checkboxValue1!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 1,
                                          ));
                                    } else if (_model.checkboxValue2!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 2,
                                          ));
                                    } else if (_model.checkboxValue3!) {
                                      firestoreBatch.update(
                                          currentUserReference!,
                                          createUsersRecordData(
                                            aulaPresenca: 3,
                                          ));
                                    }
                                  }
                                }

                                context.pushNamed('Screen_cursos');
                              } finally {
                                await firestoreBatch.commit();
                              }
                            },
                            text: 'Salvar mudanças',
                            options: FFButtonOptions(
                              height: 50.0,
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
                                    fontSize: 18.0,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 46.0, 5.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 257.0,
                                  height: 75.0,
                                  decoration: BoxDecoration(),
                                  child: Opacity(
                                    opacity: 0.7,
                                    child: Text(
                                      'Obs.: Para que seja possível marcar presença, é necessário permitir a solicitação de acesso à sua localização.',
                                      textAlign: TextAlign.justify,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF121718),
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/WhatsApp_Image_2023-09-15_at_16.42.21-removebg-preview.png',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 10.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/WhatsApp_Image_2023-09-15_at_16.42.21__1_-removebg-preview_(1).png',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
