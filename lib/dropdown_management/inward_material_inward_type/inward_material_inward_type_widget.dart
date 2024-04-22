import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/item_management/dropdown_values/dropdown_values_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inward_material_inward_type_model.dart';
export 'inward_material_inward_type_model.dart';

class InwardMaterialInwardTypeWidget extends StatefulWidget {
  const InwardMaterialInwardTypeWidget({
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
  State<InwardMaterialInwardTypeWidget> createState() =>
      _InwardMaterialInwardTypeWidgetState();
}

class _InwardMaterialInwardTypeWidgetState
    extends State<InwardMaterialInwardTypeWidget> {
  late InwardMaterialInwardTypeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InwardMaterialInwardTypeModel());

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

    return FutureBuilder<List<ItemManagementRow>>(
      future: FFAppState().items(
        uniqueQueryKey: widget.authenticatedCompany?.id?.toString(),
        requestFn: () => ItemManagementTable().queryRows(
          queryFn: (q) => q.eq(
            'company',
            widget.authenticatedCompany?.id,
          ),
        ),
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
        List<ItemManagementRow> containerItemManagementRowList = snapshot.data!;
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                          'grki7v4a' /* Define Parameters : */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                            ),
                                        minFontSize: 19.0,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(() {
                                            FFAppState().addToRowsKey(
                                                FFAppState().loopIndex);
                                            FFAppState().loopIndex =
                                                FFAppState().loopIndex + 1;
                                          });
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '2ngj5u30' /* Row */,
                                        ),
                                        icon: Icon(
                                          Icons.add,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
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
                                                          row.length,
                                                          (rowIndex) {
                                                        final rowItem =
                                                            row[rowIndex];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .dropdownValuesModels
                                                                    .getModel(
                                                                  rowItem
                                                                      .toString(),
                                                                  rowIndex,
                                                                ),
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    DropdownValuesWidget(
                                                                  key: Key(
                                                                    'Keyave_${rowItem.toString()}',
                                                                  ),
                                                                  value: widget
                                                                              .dropdown!
                                                                              .dropdownValues
                                                                              .length >
                                                                          rowItem
                                                                      ? (widget
                                                                          .dropdown
                                                                          ?.dropdownValues?[rowItem])
                                                                      : '',
                                                                ),
                                                              ),
                                                            ),
                                                            if (!functions.deleteParameter(
                                                                containerItemManagementRowList
                                                                    .map((e) => e
                                                                        .parameters)
                                                                    .toList(),
                                                                widget.dropdown!.dropdownValues
                                                                            .length >
                                                                        rowItem
                                                                    ? widget
                                                                        .dropdown!
                                                                        .dropdownValues[rowItem]
                                                                    : ''))
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  setState(() {
                                                                    FFAppState()
                                                                        .removeFromRowsKey(
                                                                            rowItem);
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .delete_outline,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 7.0)),
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
                                                'rl8logzk' /* Cancel */,
                                              ),
                                              options: FFButtonOptions(
                                                width: 240.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
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
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (_model.dropdownValuesModels
                                                    .getValues(
                                                      (m) =>
                                                          m.textController.text,
                                                    )
                                                    .contains('')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Enter parameter value'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  if (FFAppState()
                                                          .rowsKey
                                                          .length >
                                                      0) {
                                                    await DropdownManagementTable()
                                                        .update(
                                                      data: {
                                                        'dropdownValues': _model
                                                            .dropdownValuesModels
                                                            .getValues(
                                                          (m) => m
                                                              .textController
                                                              .text,
                                                        ),
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows
                                                              .eq(
                                                                'company',
                                                                widget.dropdown
                                                                    ?.company,
                                                              )
                                                              .eq(
                                                                'module',
                                                                widget.dropdown
                                                                    ?.module,
                                                              )
                                                              .eq(
                                                                'dropdownName',
                                                                widget.dropdown
                                                                    ?.dropdownName,
                                                              ),
                                                    );
                                                  } else {
                                                    await DropdownManagementTable()
                                                        .update(
                                                      data: {
                                                        'dropdownValues':
                                                            FFAppState()
                                                                .emptyList,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows
                                                              .eq(
                                                                'company',
                                                                widget.dropdown
                                                                    ?.company,
                                                              )
                                                              .eq(
                                                                'module',
                                                                widget.dropdown
                                                                    ?.module,
                                                              )
                                                              .eq(
                                                                'dropdownName',
                                                                widget.dropdown
                                                                    ?.dropdownName,
                                                              ),
                                                    );
                                                  }

                                                  _model.authenticatedCompanyDropdown =
                                                      await DropdownManagementTable()
                                                          .queryRows(
                                                    queryFn: (q) => q.eq(
                                                      'company',
                                                      widget
                                                          .authenticatedCompany
                                                          ?.id,
                                                    ),
                                                  );

                                                  context.pushNamed(
                                                    'DropdownPage',
                                                    queryParameters: {
                                                      'authenticatedUser':
                                                          serializeParam(
                                                        widget
                                                            .authenticatedUser,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                      'authenticatedCompany':
                                                          serializeParam(
                                                        widget
                                                            .authenticatedCompany,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                      'authenticatedCompanyDropdown':
                                                          serializeParam(
                                                        _model
                                                            .authenticatedCompanyDropdown,
                                                        ParamType.SupabaseRow,
                                                        true,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                }

                                                setState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'dwqawfxf' /* Save Parameters */,
                                              ),
                                              options: FFButtonOptions(
                                                width: 240.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
      },
    );
  }
}
