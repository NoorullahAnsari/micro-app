import '/backend/supabase/supabase.dart';
import '/components/side_nav_widget.dart';
import '/dropdown_management/inward_material_inward_location/inward_material_inward_location_widget.dart';
import '/dropdown_management/inward_material_inward_type/inward_material_inward_type_widget.dart';
import '/dropdown_management/outward_material_issue_to/outward_material_issue_to_widget.dart';
import '/dropdown_management/outward_material_outward_type/outward_material_outward_type_widget.dart';
import '/dropdown_management/outward_material_outward_warehouse/outward_material_outward_warehouse_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_page_model.dart';
export 'dropdown_page_model.dart';

class DropdownPageWidget extends StatefulWidget {
  const DropdownPageWidget({
    super.key,
    required this.authenticatedUser,
    required this.authenticatedCompany,
    required this.authenticatedCompanyDropdown,
  });

  final UserManagementRow? authenticatedUser;
  final CompanyManagementRow? authenticatedCompany;
  final List<DropdownManagementRow>? authenticatedCompanyDropdown;

  @override
  State<DropdownPageWidget> createState() => _DropdownPageWidgetState();
}

class _DropdownPageWidgetState extends State<DropdownPageWidget> {
  late DropdownPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed(
                'Home',
                queryParameters: {
                  'authenticatedUser': serializeParam(
                    widget.authenticatedUser,
                    ParamType.SupabaseRow,
                  ),
                  'authenticatedCompany': serializeParam(
                    widget.authenticatedCompany,
                    ParamType.SupabaseRow,
                  ),
                  'authenticatedCompanyDropdown': serializeParam(
                    widget.authenticatedCompanyDropdown,
                    ParamType.SupabaseRow,
                    true,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'ix2wrf6w' /* Dropdown Management */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'Home',
                    queryParameters: {
                      'authenticatedUser': serializeParam(
                        widget.authenticatedUser,
                        ParamType.SupabaseRow,
                      ),
                      'authenticatedCompany': serializeParam(
                        widget.authenticatedCompany,
                        ParamType.SupabaseRow,
                      ),
                      'authenticatedCompanyDropdown': serializeParam(
                        widget.authenticatedCompanyDropdown,
                        ParamType.SupabaseRow,
                        true,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Icon(
                  Icons.home,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                wrapWithModel(
                  model: _model.sideNavModel,
                  updateCallback: () => setState(() {}),
                  child: SideNavWidget(
                    navSelected: 7,
                    authenticatedUser: widget.authenticatedUser,
                    authenticatedCompany: widget.authenticatedCompany,
                    authenticatedCompanyDropdwon:
                        widget.authenticatedCompanyDropdown,
                  ),
                ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 970.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                                Container(
                                  width: double.infinity,
                                  height: 24.0,
                                  decoration: BoxDecoration(),
                                ),
                              TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'gsavxbdd' /* Search .... */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (widget.authenticatedUser!.isSuperAdmin ||
                                      (widget.authenticatedUser
                                              ?.inventoryModule ==
                                          'Admin'))
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child:
                                                      InwardMaterialInwardTypeWidget(
                                                    authenticatedUser: widget
                                                        .authenticatedUser!,
                                                    authenticatedCompany: widget
                                                        .authenticatedCompany!,
                                                    authenticatedCompanyDropdown:
                                                        widget
                                                            .authenticatedCompanyDropdown!,
                                                    dropdown: widget
                                                        .authenticatedCompanyDropdown!
                                                        .where((e) =>
                                                            (e.module ==
                                                                'Inventory') &&
                                                            (e.dropdownName ==
                                                                'Inward Material - Inward Type'))
                                                        .toList()
                                                        .first,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: ListTile(
                                          title: Text(
                                            FFLocalizations.of(context).getText(
                                              'rbdhma4i' /* Inward Material - Inward Type */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          subtitle: Text(
                                            FFLocalizations.of(context).getText(
                                              '361xelhf' /* Inventory */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                          tileColor: Color(0xFFFDFBFB),
                                          dense: false,
                                        ),
                                      ),
                                    ),
                                  Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child:
                                                    InwardMaterialInwardLocationWidget(
                                                  authenticatedUser:
                                                      widget.authenticatedUser!,
                                                  authenticatedCompany: widget
                                                      .authenticatedCompany!,
                                                  authenticatedCompanyDropdown:
                                                      widget
                                                          .authenticatedCompanyDropdown!,
                                                  dropdown: widget
                                                      .authenticatedCompanyDropdown!
                                                      .where((e) =>
                                                          (e.module ==
                                                              'Inventory') &&
                                                          (e.dropdownName ==
                                                              'Inward Material - Inward Location'))
                                                      .toList()
                                                      .first,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: ListTile(
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'psgqj4te' /* Inward Material - Inward Locat... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        subtitle: Text(
                                          FFLocalizations.of(context).getText(
                                            '6qo0brzr' /* Inventory */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                        tileColor: Color(0xFFFDFBFB),
                                        dense: false,
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child:
                                                    OutwardMaterialOutwardTypeWidget(
                                                  authenticatedUser:
                                                      widget.authenticatedUser!,
                                                  authenticatedCompany: widget
                                                      .authenticatedCompany!,
                                                  authenticatedCompanyDropdown:
                                                      widget
                                                          .authenticatedCompanyDropdown!,
                                                  dropdown: widget
                                                      .authenticatedCompanyDropdown!
                                                      .where((e) =>
                                                          (e.module ==
                                                              'Inventory') &&
                                                          (e.dropdownName ==
                                                              'Outward Material - Outward Type'))
                                                      .toList()
                                                      .first,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: ListTile(
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'kw771xwx' /* Outward Material - Outward Typ... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        subtitle: Text(
                                          FFLocalizations.of(context).getText(
                                            't60hpp5f' /* Inventory */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                        tileColor: Color(0xFFFDFBFB),
                                        dense: false,
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child:
                                                    OutwardMaterialOutwardWarehouseWidget(
                                                  authenticatedUser:
                                                      widget.authenticatedUser!,
                                                  authenticatedCompany: widget
                                                      .authenticatedCompany!,
                                                  authenticatedCompanyDropdown:
                                                      widget
                                                          .authenticatedCompanyDropdown!,
                                                  dropdown: widget
                                                      .authenticatedCompanyDropdown!
                                                      .where((e) =>
                                                          (e.module ==
                                                              'Inventory') &&
                                                          (e.dropdownName ==
                                                              'Outward Material - Outward Location'))
                                                      .toList()
                                                      .first,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: ListTile(
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'lxhuybwy' /* Outward Material - Outward War... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        subtitle: Text(
                                          FFLocalizations.of(context).getText(
                                            'b45iansz' /* Inventory */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                        tileColor: Color(0xFFFDFBFB),
                                        dense: false,
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child:
                                                    OutwardMaterialIssueToWidget(
                                                  authenticatedUser:
                                                      widget.authenticatedUser!,
                                                  authenticatedCompany: widget
                                                      .authenticatedCompany!,
                                                  authenticatedCompanyDropdown:
                                                      widget
                                                          .authenticatedCompanyDropdown!,
                                                  dropdown: widget
                                                      .authenticatedCompanyDropdown!
                                                      .where((e) =>
                                                          (e.module ==
                                                              'Inventory') &&
                                                          (e.dropdownName ==
                                                              'Outward Material - Issue To'))
                                                      .toList()
                                                      .first,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: ListTile(
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'gkkpnu45' /* Outward Material - Issue To */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        subtitle: Text(
                                          FFLocalizations.of(context).getText(
                                            '00uaikh3' /* Inventory */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                        tileColor: Color(0xFFFDFBFB),
                                        dense: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 10.0)),
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
      ),
    );
  }
}
