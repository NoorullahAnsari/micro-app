import '/backend/supabase/supabase.dart';
import '/components/dropdown_values_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/item_management/define_parameter_inventory/define_parameter_inventory_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_master_parameter_model.dart';
export 'item_master_parameter_model.dart';

class ItemMasterParameterWidget extends StatefulWidget {
  const ItemMasterParameterWidget({
    super.key,
    required this.authenticatedUser,
    required this.authenticatedCompany,
    required this.authenticatedCompanyDropdown,
    required this.dropdown,
  });

  final UserManagementRow? authenticatedUser;
  final CompanyManagementRow? authenticatedCompany;
  final List<DropdownManagementRow>? authenticatedCompanyDropdown;
  final DropdownManagementRow? dropdown;

  @override
  State<ItemMasterParameterWidget> createState() =>
      _ItemMasterParameterWidgetState();
}

class _ItemMasterParameterWidgetState extends State<ItemMasterParameterWidget> {
  late ItemMasterParameterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemMasterParameterModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().loopIndex = 0;
        FFAppState().rowsKey = [];
      });
      while (FFAppState().loopIndex < widget.dropdown!.dropdownValues.length) {
        setState(() {
          FFAppState().addToRowsKey(FFAppState().loopIndex);
          FFAppState().loopIndex = FFAppState().loopIndex + 1;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 15.0),
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      'qnpthlhm' /* Define Parameters : */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                    minFontSize: 19.0,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                final row = FFAppState()
                                                    .rowsKey
                                                    .toList();
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      row.length, (rowIndex) {
                                                    final rowItem =
                                                        row[rowIndex];
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .dropdownValuesCopyModels
                                                                .getModel(
                                                              rowItem
                                                                  .toString(),
                                                              rowIndex,
                                                            ),
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                DropdownValuesCopyWidget(
                                                              key: Key(
                                                                'Keys20_${rowItem.toString()}',
                                                              ),
                                                              value: widget
                                                                          .dropdown!
                                                                          .dropdownValues
                                                                          .length >
                                                                      rowItem
                                                                  ? (widget
                                                                          .dropdown
                                                                          ?.dropdownValues?[
                                                                      rowItem])
                                                                  : '',
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              FFAppState()
                                                                  .removeFromRowsKey(
                                                                      rowItem);
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .delete_outline,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    );
                                                  }).divide(
                                                      SizedBox(height: 7.0)),
                                                );
                                              },
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.05),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '1rka1sr9' /* Cancel */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 240.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.05),
                                        child: Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child:
                                                        DefineParameterInventoryWidget(
                                                      authenticatedUser: widget
                                                          .authenticatedUser!,
                                                      authenticatedCompany: widget
                                                          .authenticatedCompany!,
                                                      authenticatedCompanyDropdown:
                                                          widget
                                                              .authenticatedCompanyDropdown!,
                                                      dropdown:
                                                          widget.dropdown!,
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '6k4pqhgz' /* Add */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 240.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 10.0))
                                      .around(SizedBox(width: 10.0)),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 10.0))
                                .addToStart(SizedBox(height: 15.0))
                                .addToEnd(SizedBox(height: 15.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
