import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'saibamais1_model.dart';
export 'saibamais1_model.dart';

class Saibamais1Widget extends StatefulWidget {
  const Saibamais1Widget({super.key});

  @override
  State<Saibamais1Widget> createState() => _Saibamais1WidgetState();
}

class _Saibamais1WidgetState extends State<Saibamais1Widget> {
  late Saibamais1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Saibamais1Model());

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
            width: 360.0,
            height: 680.0,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Text(
                            'Curso de Educação Ambiental aos Educadores:',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF423B3B),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: Color(0xFF9CA4AD),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Text(
                            '- Público-Alvo: Educadores.\n- Principal objetivo: Sensibilizar educadores e a sociedade acerca  da importância da manutenção da sustentabilidade do Parque Nacional de Brasília.\n- Metodologia: O curso utiliza uma abordagem dialógica, reflexiva, participativa e protagonista, estimulando o comprometimento e envolvimento dos participantes. Inclui técnicas diversificadas e planejamento coletivo de atividades.\n- Duração: Realizado em dois dias (terças e quintas-feiras) no Centro de Educação Ambiental (CEA-CV) do Parque Nacional de Brasília.\n- Conteúdo: Aborda questões ambientais e de sustentabilidade, reconhecimento dos Circuitos Pedagógicos do PNB, atividades lúdico-pedagógicas, socialização de planejamentos e experiências entre as escolas, e práticas de sensopercepção.\n- Certificado: Ao finalizar, os participantes recebem um certificado de 30 horas/aula.\n- Agendamento: Após a conclusão do curso, os educadores ficam aptos a agendar visitas com seus estudantes.\n- Custo: Gratuito.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF423B3B),
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
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
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
            ),
          ),
        ),
      ],
    );
  }
}
