import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/inventory_management/add_item/add_item_widget.dart';
import '/inventory_management/add_item_copy/add_item_copy_widget.dart';
import '/item_management/itemparameter/itemparameter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inward_back_model.dart';
export 'inward_back_model.dart';

class InwardBackWidget extends StatefulWidget {
  const InwardBackWidget({
    super.key,
    required this.authenticatedUser,
    required this.authenticatedCompany,
    required this.authenticatedCompanyDropdown,
    required this.purchaseOrderNumber,
    required this.inwardedBy,
    required this.inwardNumber,
    required this.inward,
    required this.inwardType,
    required this.inwardedOn,
    required this.inwardLocation,
    required this.materialSubContractNo,
    required this.materialReceivedFrom,
    required this.referenceNumber,
    required this.remark,
    required this.attachment,
    required this.conclusion,
    required this.approvalRemark,
    required this.sendToApproval,
    required this.inwardTypeDropdowm,
    required this.inwardLocationDropdown,
    required this.itemMasterParameters,
    required this.inventoryParameters,
  });

  final UserManagementRow? authenticatedUser;
  final CompanyManagementRow? authenticatedCompany;
  final List<DropdownManagementRow>? authenticatedCompanyDropdown;
  final String? purchaseOrderNumber;
  final int? inwardedBy;
  final String? inwardNumber;
  final int? inward;
  final String? inwardType;
  final DateTime? inwardedOn;
  final String? inwardLocation;
  final String? materialSubContractNo;
  final String? materialReceivedFrom;
  final String? referenceNumber;
  final String? remark;
  final List<String>? attachment;
  final String? conclusion;
  final String? approvalRemark;
  final int? sendToApproval;
  final DropdownManagementRow? inwardTypeDropdowm;
  final DropdownManagementRow? inwardLocationDropdown;
  final DropdownManagementRow? itemMasterParameters;
  final DropdownManagementRow? inventoryParameters;

  @override
  State<InwardBackWidget> createState() => _InwardBackWidgetState();
}

class _InwardBackWidgetState extends State<InwardBackWidget> {
  late InwardBackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InwardBackModel());

    _model.inwardNumberTextController ??=
        TextEditingController(text: widget.inwardNumber);
    _model.inwardNumberFocusNode ??= FocusNode();

    _model.inwardedOnTextController ??= TextEditingController();
    _model.inwardedOnFocusNode ??= FocusNode();

    _model.inwardedbyFocusNode1 ??= FocusNode();

    _model.inwardedbyFocusNode2 ??= FocusNode();

    _model.inwardedbyTextController3 ??= TextEditingController();
    _model.inwardedbyFocusNode3 ??= FocusNode();

    _model.materialReceivedfromTextController ??=
        TextEditingController(text: widget.materialReceivedFrom);
    _model.materialReceivedfromFocusNode ??= FocusNode();

    _model.referenceNumberTextController ??=
        TextEditingController(text: widget.referenceNumber);
    _model.referenceNumberFocusNode ??= FocusNode();

    _model.remarkTextController ??= TextEditingController(text: widget.remark);
    _model.remarkFocusNode ??= FocusNode();

    _model.textController9 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController10 ??=
        TextEditingController(text: widget.approvalRemark);
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.inwardedOnTextController?.text = dateTimeFormat(
            'yMMMd',
            widget.inwardedOn,
            locale: FFLocalizations.of(context).languageCode,
          );
          _model.inwardedbyTextController3?.text =
              FFLocalizations.of(context).getText(
            's1643jbj' /* In Progress */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

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
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<ItemManagementRow> inwardBackItemManagementRowList =
            snapshot.data!;
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
              leading: Visibility(
                visible: responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'InventoryDashBoard',
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
                        'itemParameters': serializeParam(
                          widget.authenticatedCompanyDropdown
                              ?.where((e) =>
                                  (e.module == 'Item Master') &&
                                  (e.dropdownName == 'Item Master Parameter'))
                              .toList()
                              ?.first,
                          ParamType.SupabaseRow,
                        ),
                        'inventoryParameters': serializeParam(
                          widget.authenticatedCompanyDropdown
                              ?.where((e) =>
                                  (e.module == 'Inventory') &&
                                  (e.dropdownName == 'Inventory Parameter'))
                              .toList()
                              ?.first,
                          ParamType.SupabaseRow,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                ),
              ),
              title: Visibility(
                visible: responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'x3dgpy93' /* Approval Inward Material */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                        ),
                  ),
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
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    wrapWithModel(
                      model: _model.sideNavModel,
                      updateCallback: () => setState(() {}),
                      child: SideNavWidget(
                        navSelected: 5,
                        authenticatedUser: widget.authenticatedUser,
                        authenticatedCompany: widget.authenticatedCompany,
                        authenticatedCompanyDropdwon:
                            widget.authenticatedCompanyDropdown,
                      ),
                    ),
                  Flexible(
                    flex: 2,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FutureBuilder<List<UserManagementRow>>(
                        future: FFAppState().companyUsers(
                          uniqueQueryKey:
                              widget.authenticatedCompany?.id?.toString(),
                          requestFn: () => UserManagementTable().queryRows(
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
                          List<UserManagementRow>
                              containerUserManagementRowList = snapshot.data!;
                          return Container(
                            decoration: BoxDecoration(),
                            child: FutureBuilder<
                                List<InwardInventoryTableManagementRow>>(
                              future: FFAppState().inward(
                                uniqueQueryKey: widget.inward?.toString(),
                                requestFn: () =>
                                    InwardInventoryTableManagementTable()
                                        .queryRows(
                                  queryFn: (q) => q.eq(
                                    'inward',
                                    widget.inward,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<InwardInventoryTableManagementRow>
                                    containerInwardInventoryTableManagementRowList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    minWidth: 350.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                          Container(
                                            width: double.infinity,
                                            constraints: BoxConstraints(
                                              maxWidth: 800.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
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
                                                            onTap: () async {
                                                              setState(() {
                                                                FFAppState()
                                                                        .choiceChips =
                                                                    'Assigned To Me';
                                                              });

                                                              context.pushNamed(
                                                                'InventoryDashBoard',
                                                                queryParameters:
                                                                    {
                                                                  'authenticatedUser':
                                                                      serializeParam(
                                                                    widget
                                                                        .authenticatedUser,
                                                                    ParamType
                                                                        .SupabaseRow,
                                                                  ),
                                                                  'authenticatedCompany':
                                                                      serializeParam(
                                                                    widget
                                                                        .authenticatedCompany,
                                                                    ParamType
                                                                        .SupabaseRow,
                                                                  ),
                                                                  'authenticatedCompanyDropdown':
                                                                      serializeParam(
                                                                    widget
                                                                        .authenticatedCompanyDropdown,
                                                                    ParamType
                                                                        .SupabaseRow,
                                                                    true,
                                                                  ),
                                                                  'itemParameters':
                                                                      serializeParam(
                                                                    widget
                                                                        .authenticatedCompanyDropdown
                                                                        ?.where((e) =>
                                                                            (e.module ==
                                                                                'Item Master') &&
                                                                            (e.dropdownName ==
                                                                                'Item Master Parameter'))
                                                                        .toList()
                                                                        ?.first,
                                                                    ParamType
                                                                        .SupabaseRow,
                                                                  ),
                                                                  'inventoryParameters':
                                                                      serializeParam(
                                                                    widget
                                                                        .authenticatedCompanyDropdown
                                                                        ?.where((e) =>
                                                                            (e.module ==
                                                                                'Inventory') &&
                                                                            (e.dropdownName ==
                                                                                'Inventory Parameter'))
                                                                        .toList()
                                                                        ?.first,
                                                                    ParamType
                                                                        .SupabaseRow,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_back_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '91isknrp' /* Approval Inward Material */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 30.0)),
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      primary: false,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'HistoryCardsInward',
                                                                            queryParameters:
                                                                                {
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
                                                                              'inward': serializeParam(
                                                                                widget.inward,
                                                                                ParamType.int,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          '9zekkzmw' /* Workflow History */,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Form(
                                                                    key: _model
                                                                        .formKey,
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .disabled,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              20.0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        primary:
                                                                            false,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'ajtc2t9n' /* Purchase Order Number : */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: FlutterFlowDropDown<String>(
                                                                                          controller: _model.inwardTypeValueController1 ??= FormFieldController<String>(null),
                                                                                          options: <String>[],
                                                                                          onChanged: (val) => setState(() => _model.inwardTypeValue1 = val),
                                                                                          width: 300.0,
                                                                                          height: 50.0,
                                                                                          searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            '0t7wexhg' /* Select ... */,
                                                                                          ),
                                                                                          searchHintText: FFLocalizations.of(context).getText(
                                                                                            '7usq5nt2' /* Search for an item... */,
                                                                                          ),
                                                                                          icon: Icon(
                                                                                            Icons.keyboard_arrow_down_rounded,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          elevation: 2.0,
                                                                                          borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                          borderWidth: 2.0,
                                                                                          borderRadius: 8.0,
                                                                                          margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                          hidesUnderline: true,
                                                                                          isOverButton: true,
                                                                                          isSearchable: true,
                                                                                          isMultiSelect: false,
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 7.0)),
                                                                              ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 120.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.inwardNumberTextController,
                                                                                      focusNode: _model.inwardNumberFocusNode,
                                                                                      autofocus: false,
                                                                                      readOnly: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                          'ozid3hs4' /* Inward Number */,
                                                                                        ),
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'ylba1l7p' /* Enter Here.. */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
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
                                                                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      validator: _model.inwardNumberTextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 120.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.inwardedOnTextController,
                                                                                      focusNode: _model.inwardedOnFocusNode,
                                                                                      autofocus: false,
                                                                                      readOnly: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                          '6uwddh7e' /* Inwarded On */,
                                                                                        ),
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'b4hkfe2e' /* Enter Here.. */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
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
                                                                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      validator: _model.inwardedOnTextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 120.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.inwardedbyTextController1 ??= TextEditingController(
                                                                                        text: containerUserManagementRowList.where((e) => e.id == widget.inwardedBy).toList().first.fullName,
                                                                                      ),
                                                                                      focusNode: _model.inwardedbyFocusNode1,
                                                                                      autofocus: false,
                                                                                      readOnly: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                          'bcszzdhb' /* Inwarded by */,
                                                                                        ),
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'd8n6xs7p' /* Enter Here.. */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
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
                                                                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      validator: _model.inwardedbyTextController1Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 120.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.inwardedbyTextController2 ??= TextEditingController(
                                                                                        text: containerUserManagementRowList.where((e) => e.id == widget.sendToApproval).toList().first.fullName,
                                                                                      ),
                                                                                      focusNode: _model.inwardedbyFocusNode2,
                                                                                      autofocus: false,
                                                                                      readOnly: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                          'gk6fmit0' /* Send Apprroval To */,
                                                                                        ),
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'cyxm0mbb' /* Enter Here.. */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
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
                                                                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      validator: _model.inwardedbyTextController2Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 120.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.inwardedbyTextController3,
                                                                                      focusNode: _model.inwardedbyFocusNode3,
                                                                                      autofocus: false,
                                                                                      readOnly: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                          'arnrimy7' /* Workflow Status */,
                                                                                        ),
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'wo5mtu5z' /* Enter Here.. */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
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
                                                                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      validator: _model.inwardedbyTextController3Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'o7sqe93d' /* Inward Type : */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: FlutterFlowDropDown<String>(
                                                                                        controller: _model.inwardTypeValueController2 ??= FormFieldController<String>(
                                                                                          _model.inwardTypeValue2 ??= widget.inwardType,
                                                                                        ),
                                                                                        options: widget.inwardTypeDropdowm!.dropdownValues,
                                                                                        onChanged: (val) => setState(() => _model.inwardTypeValue2 = val),
                                                                                        width: 300.0,
                                                                                        height: 50.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'hnyp1ulq' /* Select Inward Type */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          'tdh723yv' /* Search for an item... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: true,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                              ].divide(SizedBox(height: 7.0)),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '5saqr1o0' /* Inward location : */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: FlutterFlowDropDown<String>(
                                                                                        controller: _model.inwardTypeValueController3 ??= FormFieldController<String>(
                                                                                          _model.inwardTypeValue3 ??= widget.inwardLocation,
                                                                                        ),
                                                                                        options: widget.inwardLocationDropdown!.dropdownValues,
                                                                                        onChanged: (val) => setState(() => _model.inwardTypeValue3 = val),
                                                                                        width: 300.0,
                                                                                        height: 50.0,
                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'tkagqrng' /* Select Inward Location */,
                                                                                        ),
                                                                                        searchHintText: FFLocalizations.of(context).getText(
                                                                                          '6x4vf88a' /* Search for an item... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: true,
                                                                                        isSearchable: true,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                              ].divide(SizedBox(height: 7.0)),
                                                                            ),
                                                                            Wrap(
                                                                              spacing: 10.0,
                                                                              runSpacing: 10.0,
                                                                              alignment: WrapAlignment.start,
                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                              direction: Axis.horizontal,
                                                                              runAlignment: WrapAlignment.start,
                                                                              verticalDirection: VerticalDirection.down,
                                                                              clipBehavior: Clip.none,
                                                                              children: [
                                                                                SwitchListTile.adaptive(
                                                                                  value: _model.switchListTileValue ??= false,
                                                                                  onChanged: (newValue) async {
                                                                                    setState(() => _model.switchListTileValue = newValue!);
                                                                                  },
                                                                                  title: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '8lhgji91' /* Is this received from 'Issued ... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                  activeTrackColor: FlutterFlowTheme.of(context).accent1,
                                                                                  dense: true,
                                                                                  controlAffinity: ListTileControlAffinity.trailing,
                                                                                ),
                                                                                if (_model.switchListTileValue ?? true)
                                                                                  FlutterFlowDropDown<String>(
                                                                                    controller: _model.materialOutwardNumberValueController ??= FormFieldController<String>(null),
                                                                                    options: <String>[],
                                                                                    onChanged: (val) => setState(() => _model.materialOutwardNumberValue = val),
                                                                                    width: 300.0,
                                                                                    height: 50.0,
                                                                                    searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      'kha9nute' /* Select Material Outward Number */,
                                                                                    ),
                                                                                    searchHintText: FFLocalizations.of(context).getText(
                                                                                      'gcv5z4yd' /* Search for an item... */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 2.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                    borderWidth: 2.0,
                                                                                    borderRadius: 8.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                    hidesUnderline: true,
                                                                                    isOverButton: true,
                                                                                    isSearchable: true,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: TextFormField(
                                                                                    controller: _model.materialReceivedfromTextController,
                                                                                    focusNode: _model.materialReceivedfromFocusNode,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                        '1dq9lc2h' /* Material Received From */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'dcy8atsw' /* Enter Here.... */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
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
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    maxLines: null,
                                                                                    minLines: 1,
                                                                                    validator: _model.materialReceivedfromTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: TextFormField(
                                                                                    controller: _model.referenceNumberTextController,
                                                                                    focusNode: _model.referenceNumberFocusNode,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                        'fxdexgb7' /* Reference Number */,
                                                                                      ),
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'lhwzg82e' /* Enter Here.... */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
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
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    maxLines: null,
                                                                                    minLines: 1,
                                                                                    validator: _model.referenceNumberTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 15.0)),
                                                                            ),
                                                                            TextFormField(
                                                                              controller: _model.remarkTextController,
                                                                              focusNode: _model.remarkFocusNode,
                                                                              autofocus: false,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'a6twr8al' /* User Remarks  */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  '13spvmru' /* Enter Here.... */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primary,
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
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              maxLines: null,
                                                                              minLines: 1,
                                                                              validator: _model.remarkTextControllerValidator.asValidator(context),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'dlhps1ua' /* QR scanner : */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
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
                                                                                      _model.scanItem = await FlutterBarcodeScanner.scanBarcode(
                                                                                        '#C62828', // scanning line color
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '8sze4fn9' /* Cancel */,
                                                                                        ), // cancel button text
                                                                                        true, // whether to show the flash icon
                                                                                        ScanMode.QR,
                                                                                      );

                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (dialogContext) {
                                                                                          return Dialog(
                                                                                            elevation: 0,
                                                                                            insetPadding: EdgeInsets.zero,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                            child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: AddItemCopyWidget(
                                                                                                authenticatedUser: widget.authenticatedUser!,
                                                                                                authenticatedCompany: widget.authenticatedCompany!,
                                                                                                authenticatedCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                                itemMasterParameters: widget.itemMasterParameters!,
                                                                                                inventoryParameters: widget.inventoryParameters!,
                                                                                                itemName: functions.scanItem('#', _model.scanItem!, 3),
                                                                                                lotNo: functions.scanItem('#', _model.scanItem!, 1),
                                                                                                requireQuantity: functions.scanItem('#', _model.scanItem!, 7),
                                                                                                remark: functions.scanItem('#', _model.scanItem!, 8),
                                                                                                coilNumber: functions.scanItem('#', _model.scanItem!, 0),
                                                                                                finish: functions.scanItem('#', _model.scanItem!, 4),
                                                                                                edge: functions.scanItem('#', _model.scanItem!, 5),
                                                                                                pcs: functions.scanItem('#', _model.scanItem!, 6),
                                                                                                grade: functions.scanItem('#', _model.scanItem!, 2),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));

                                                                                      setState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.qr_code_scanner_outlined,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 32.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'nek9xnxi' /* Inward Table : */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 24.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  height: 32.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    child: Text(
                                                                                      FFAppState().item.length.toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (dialogContext) {
                                                                                          return Dialog(
                                                                                            elevation: 0,
                                                                                            insetPadding: EdgeInsets.zero,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                            child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: AddItemWidget(
                                                                                                authenticatedUser: widget.authenticatedUser!,
                                                                                                authenticatedCompany: widget.authenticatedCompany!,
                                                                                                authenticatedCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                                itemMasterParameters: widget.itemMasterParameters!,
                                                                                                inventoryParameters: widget.inventoryParameters!,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'y5jmtyw7' /* Add Item */,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            color: Colors.white,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      elevation: 3.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                              tabletLandscape: false,
                                                                              desktop: false,
                                                                            ))
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'oyd7q9k8' /* Card Header */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                    tablet: false,
                                                                                    tabletLandscape: false,
                                                                                  ))
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                      child: FFButtonWidget(
                                                                                        onPressed: () {
                                                                                          print('Button pressed ...');
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          '1kq8vpl8' /* Filter */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.filter_alt_outlined,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 15.0,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 40.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                    tablet: false,
                                                                                  ))
                                                                                    Container(
                                                                                      width: 270.0,
                                                                                      child: TextFormField(
                                                                                        controller: _model.textController9,
                                                                                        focusNode: _model.textFieldFocusNode1,
                                                                                        autofocus: false,
                                                                                        textCapitalization: TextCapitalization.sentences,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'j94w73n5' /* Search users... */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 2.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          prefixIcon: Icon(
                                                                                            Icons.search_rounded,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 20.0,
                                                                                          ),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        validator: _model.textController9Validator.asValidator(context),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Container(
                                                                                            height: 50.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                              borderRadius: BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(0.0),
                                                                                                bottomRight: Radius.circular(0.0),
                                                                                                topLeft: Radius.circular(16.0),
                                                                                                topRight: Radius.circular(16.0),
                                                                                              ),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 50.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 150.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '6v2xq04c' /* Item Details */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 150.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'c0gyc5kh' /* Item Category */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 120.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'l9a1agyx' /* UoM */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 120.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '6i6wcdnk' /* Required Qty
(Po qty) */
                                                                                                            ,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 100.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Align(
                                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '77dgj3en' /* Lot No */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 100.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'gvdl1px3' /* Received Quantity */,
                                                                                                          ),
                                                                                                          textAlign: TextAlign.start,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 120.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'u3rhp1n0' /* rate/unit */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Builder(
                                                                                                    builder: (context) {
                                                                                                      final itemParameters = widget.itemMasterParameters?.dropdownValues?.toList() ?? [];
                                                                                                      return Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: List.generate(itemParameters.length, (itemParametersIndex) {
                                                                                                          final itemParametersItem = itemParameters[itemParametersIndex];
                                                                                                          return Container(
                                                                                                            width: 120.0,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  itemParametersItem,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Readex Pro',
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          );
                                                                                                        }).divide(SizedBox(width: 5.0)),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                  Builder(
                                                                                                    builder: (context) {
                                                                                                      final inventoryParameter = widget.inventoryParameters?.dropdownValues?.toList() ?? [];
                                                                                                      return Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: List.generate(inventoryParameter.length, (inventoryParameterIndex) {
                                                                                                          final inventoryParameterItem = inventoryParameter[inventoryParameterIndex];
                                                                                                          return Container(
                                                                                                            width: 120.0,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  inventoryParameterItem,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Readex Pro',
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          );
                                                                                                        }).divide(SizedBox(width: 5.0)),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 120.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'oq768nzx' /* Remarks */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 120.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'qlpigmzg' /* QR Verified */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 12.0)).around(SizedBox(width: 12.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Builder(
                                                                                          builder: (context) {
                                                                                            final item = FFAppState().item.toList();
                                                                                            return SingleChildScrollView(
                                                                                              primary: false,
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: List.generate(item.length, (itemIndex) {
                                                                                                  final itemItem = item[itemIndex];
                                                                                                  return Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 50.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Icon(
                                                                                                                Icons.delete_outlined,
                                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                                size: 30.0,
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 150.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                inwardBackItemManagementRowList.where((e) => e.id == itemItem.itemId).toList().first.itemCategory,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                inwardBackItemManagementRowList.where((e) => e.id == itemItem.itemId).toList().first.measurementUnit,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: 120.0,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                    child: Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: wrapWithModel(
                                                                                                                        model: _model.requiredquantityModels.getModel(
                                                                                                                          itemItem.itemId.toString(),
                                                                                                                          itemIndex,
                                                                                                                        ),
                                                                                                                        updateCallback: () => setState(() {}),
                                                                                                                        child: ItemparameterWidget(
                                                                                                                          key: Key(
                                                                                                                            'Keydg6_${itemItem.itemId.toString()}',
                                                                                                                          ),
                                                                                                                          value: itemItem.requireQuantity.toString(),
                                                                                                                          readOnly: false,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                itemItem.lotNo,
                                                                                                                maxLines: 3,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: wrapWithModel(
                                                                                                                  model: _model.receivequantityModels.getModel(
                                                                                                                    itemItem.itemId.toString(),
                                                                                                                    itemIndex,
                                                                                                                  ),
                                                                                                                  updateCallback: () => setState(() {}),
                                                                                                                  child: ItemparameterWidget(
                                                                                                                    key: Key(
                                                                                                                      'Keyo3a_${itemItem.itemId.toString()}',
                                                                                                                    ),
                                                                                                                    value: itemItem.receiveQuantity.toString(),
                                                                                                                    readOnly: false,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Align(
                                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                  child: wrapWithModel(
                                                                                                                    model: _model.rateModels.getModel(
                                                                                                                      itemItem.itemId.toString(),
                                                                                                                      itemIndex,
                                                                                                                    ),
                                                                                                                    updateCallback: () => setState(() {}),
                                                                                                                    child: ItemparameterWidget(
                                                                                                                      key: Key(
                                                                                                                        'Keyzgg_${itemItem.itemId.toString()}',
                                                                                                                      ),
                                                                                                                      value: itemItem.rate.toString(),
                                                                                                                      readOnly: false,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Builder(
                                                                                                          builder: (context) {
                                                                                                            final itemParameter = widget.itemMasterParameters?.dropdownValues?.toList() ?? [];
                                                                                                            return Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: List.generate(itemParameter.length, (itemParameterIndex) {
                                                                                                                final itemParameterItem = itemParameter[itemParameterIndex];
                                                                                                                return Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        functions.fetchValueFromJson(inwardBackItemManagementRowList.where((e) => e.id == itemItem.itemId).toList().first.parameters, itemParameterItem),
                                                                                                                        maxLines: 3,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                );
                                                                                                              }).divide(SizedBox(width: 5.0)),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                        Builder(
                                                                                                          builder: (context) {
                                                                                                            final inventoryParameters = widget.inventoryParameters?.dropdownValues?.toList() ?? [];
                                                                                                            return Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: List.generate(inventoryParameters.length, (inventoryParametersIndex) {
                                                                                                                final inventoryParametersItem = inventoryParameters[inventoryParametersIndex];
                                                                                                                return Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        functions.fetchValueFromJson(FFAppState().ineventoryParameters[itemIndex], inventoryParametersItem),
                                                                                                                        maxLines: 3,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                );
                                                                                                              }).divide(SizedBox(width: 5.0)),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: wrapWithModel(
                                                                                                                  model: _model.remarkModels.getModel(
                                                                                                                    itemItem.itemId.toString(),
                                                                                                                    itemIndex,
                                                                                                                  ),
                                                                                                                  updateCallback: () => setState(() {}),
                                                                                                                  child: ItemparameterWidget(
                                                                                                                    key: Key(
                                                                                                                      'Keyy2r_${itemItem.itemId.toString()}',
                                                                                                                    ),
                                                                                                                    value: itemItem.remark,
                                                                                                                    readOnly: itemItem.qrVerified,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                itemItem.qrVerified.toString(),
                                                                                                                maxLines: 3,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 12.0)).around(SizedBox(width: 12.0)),
                                                                                                    ),
                                                                                                  );
                                                                                                }),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'tkni6dzn' /* Incoming Quality Report : */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 15.0)),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              constraints: BoxConstraints(
                                                                                minHeight: 100.0,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: Color(0xFFFBFBFB),
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(10.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Visibility(
                                                                                        visible: widget.attachment != null && (widget.attachment)!.isNotEmpty,
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final uploadedFiles = functions.stringListToImagePathList(widget.attachment!.toList()).toList();
                                                                                            if (uploadedFiles.isEmpty) {
                                                                                              return EmptyWidget();
                                                                                            }
                                                                                            return Wrap(
                                                                                              spacing: 10.0,
                                                                                              runSpacing: 10.0,
                                                                                              alignment: WrapAlignment.start,
                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: List.generate(uploadedFiles.length, (uploadedFilesIndex) {
                                                                                                final uploadedFilesItem = uploadedFiles[uploadedFilesIndex];
                                                                                                return ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  child: Image.network(
                                                                                                    uploadedFilesItem,
                                                                                                    width: 300.0,
                                                                                                    height: 200.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                );
                                                                                              }),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '50m9sfpw' /* Report Conclusion: */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropDownValueController ??= FormFieldController<String>(
                                                                                      _model.dropDownValue ??= widget.conclusion,
                                                                                    ),
                                                                                    options: [
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'wcpq04nz' /* Approved */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'gf2h1lfz' /* Rejected */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '6j83h9ne' /* Send Back */,
                                                                                      )
                                                                                    ],
                                                                                    onChanged: (val) => setState(() => _model.dropDownValue = val),
                                                                                    width: 120.0,
                                                                                    height: 50.0,
                                                                                    searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      '58qy09df' /* Select Report conclusion... */,
                                                                                    ),
                                                                                    searchHintText: FFLocalizations.of(context).getText(
                                                                                      'uqbq56ss' /* Search for an item... */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 2.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                    borderWidth: 2.0,
                                                                                    borderRadius: 8.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                    hidesUnderline: true,
                                                                                    disabled: true,
                                                                                    isOverButton: true,
                                                                                    isSearchable: true,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                            TextFormField(
                                                                              controller: _model.textController10,
                                                                              focusNode: _model.textFieldFocusNode2,
                                                                              autofocus: false,
                                                                              readOnly: true,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'y0xxksfz' /* Approver Remarks  */,
                                                                                ),
                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  '80pdlbsc' /* Enter Here.... */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primary,
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
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              maxLines: null,
                                                                              minLines: 1,
                                                                              validator: _model.textController10Validator.asValidator(context),
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]
                                                                    .addToStart(
                                                                        SizedBox(
                                                                            height:
                                                                                10.0))
                                                                    .addToEnd(SizedBox(
                                                                        height:
                                                                            10.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .inwardTypeValue2 ==
                                                              null) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Select Inward Type'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            return;
                                                          }
                                                          if (_model
                                                                  .inwardTypeValue3 ==
                                                              null) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Select Inward Location'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            return;
                                                          }
                                                          await InwardInventoryManagementTable()
                                                              .update(
                                                            data: {
                                                              'purchaseOrderNumber':
                                                                  _model
                                                                      .inwardTypeValue1,
                                                              'inwardType': _model
                                                                  .inwardTypeValue2,
                                                              'inwardLocation':
                                                                  _model
                                                                      .inwardTypeValue3,
                                                              'subcontractMaterialOutwardNumber':
                                                                  _model
                                                                      .materialOutwardNumberValue,
                                                              'materialReceivedFrom':
                                                                  _model
                                                                      .materialReceivedfromTextController
                                                                      .text,
                                                              'referenceNumber':
                                                                  _model
                                                                      .referenceNumberTextController
                                                                      .text,
                                                              'inwardRemarks':
                                                                  _model
                                                                      .remarkTextController
                                                                      .text,
                                                              'company': widget
                                                                  .authenticatedCompany
                                                                  ?.id,
                                                              'currentlyAssignedTo':
                                                                  widget
                                                                      .sendToApproval,
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'id',
                                                              widget.inward,
                                                            ),
                                                          );
                                                          setState(() {
                                                            FFAppState()
                                                                .loopIndex = 0;
                                                            FFAppState()
                                                                .inventoryTabIndex = 0;
                                                          });
                                                          await InwardInventoryTableManagementTable()
                                                              .delete(
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'inward',
                                                              widget.inward,
                                                            ),
                                                          );
                                                          while (FFAppState()
                                                                  .loopIndex <
                                                              FFAppState()
                                                                  .item
                                                                  .length) {
                                                            await InwardInventoryTableManagementTable()
                                                                .insert({
                                                              'item': FFAppState()
                                                                  .item[FFAppState()
                                                                      .loopIndex]
                                                                  .itemId,
                                                              'lotNo': FFAppState()
                                                                  .item[FFAppState()
                                                                      .loopIndex]
                                                                  .lotNo,
                                                              'receivedQuantity':
                                                                  double.tryParse(
                                                                      _model.receivequantityModels
                                                                              .getValueForKey(
                                                                            FFAppState().item[FFAppState().loopIndex].itemId.toString(),
                                                                            (m) =>
                                                                                m.textController.text,
                                                                          ) ??
                                                                          ''),
                                                              'remarks': _model
                                                                  .remarkModels
                                                                  .getValueForKey(
                                                                FFAppState()
                                                                    .item[FFAppState()
                                                                        .loopIndex]
                                                                    .itemId
                                                                    .toString(),
                                                                (m) => m
                                                                    .textController
                                                                    .text,
                                                              ),
                                                              'qrVerified': FFAppState()
                                                                  .item[FFAppState()
                                                                      .loopIndex]
                                                                  .qrVerified,
                                                              'inventoryParameters':
                                                                  FFAppState()
                                                                          .ineventoryParameters[
                                                                      FFAppState()
                                                                          .loopIndex],
                                                              'inward':
                                                                  widget.inward,
                                                              'requireQuantity':
                                                                  double.tryParse(
                                                                      _model.requiredquantityModels
                                                                              .getValueForKey(
                                                                            FFAppState().item[FFAppState().loopIndex].itemId.toString(),
                                                                            (m) =>
                                                                                m.textController.text,
                                                                          ) ??
                                                                          ''),
                                                              'rate': double
                                                                  .tryParse(_model
                                                                          .rateModels
                                                                          .getValueForKey(
                                                                        FFAppState()
                                                                            .item[FFAppState().loopIndex]
                                                                            .itemId
                                                                            .toString(),
                                                                        (m) => m
                                                                            .textController
                                                                            .text,
                                                                      ) ??
                                                                      ''),
                                                              'company': widget
                                                                  .authenticatedCompany
                                                                  ?.id,
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                      .loopIndex =
                                                                  FFAppState()
                                                                          .loopIndex +
                                                                      1;
                                                            });
                                                          }
                                                          await InwardInventoryHistoryManagementTable()
                                                              .insert({
                                                            'company': widget
                                                                .authenticatedCompany
                                                                ?.id,
                                                            'stepName': 'Start',
                                                            'submittedBy': widget
                                                                .authenticatedUser
                                                                ?.id,
                                                            'submittedOn':
                                                                supaSerialize<
                                                                        DateTime>(
                                                                    getCurrentTimestamp),
                                                            'remark': _model
                                                                .remarkTextController
                                                                .text,
                                                            'inward':
                                                                widget.inward,
                                                          });
                                                          FFAppState()
                                                              .clearInwardHistoryCacheKey(
                                                                  widget.inward
                                                                      ?.toString());
                                                          FFAppState()
                                                              .clearInwardsCacheKey(
                                                                  widget.inward
                                                                      ?.toString());
                                                          FFAppState()
                                                              .clearInwardCacheKey(
                                                                  widget.inward
                                                                      ?.toString());

                                                          context.pushNamed(
                                                            'InventoryDashBoard',
                                                            queryParameters: {
                                                              'authenticatedUser':
                                                                  serializeParam(
                                                                widget
                                                                    .authenticatedUser,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                              'authenticatedCompany':
                                                                  serializeParam(
                                                                widget
                                                                    .authenticatedCompany,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                              'authenticatedCompanyDropdown':
                                                                  serializeParam(
                                                                widget
                                                                    .authenticatedCompanyDropdown,
                                                                ParamType
                                                                    .SupabaseRow,
                                                                true,
                                                              ),
                                                              'itemParameters':
                                                                  serializeParam(
                                                                widget
                                                                    .itemMasterParameters,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                              'inventoryParameters':
                                                                  serializeParam(
                                                                widget
                                                                    .inventoryParameters,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'jsz16bx4' /* Sent for approval */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 270.0,
                                                          height: 50.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .addToStart(
                                                        SizedBox(height: 10.0))
                                                    .addToEnd(
                                                        SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                        ].addToEnd(SizedBox(height: 72.0)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
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
