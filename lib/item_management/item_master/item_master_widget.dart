import '/backend/supabase/supabase.dart';
import '/components/empty_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/item_management/create_item/create_item_widget.dart';
import '/item_management/define_parameter_inventory/define_parameter_inventory_widget.dart';
import '/item_management/delete_option_copy3/delete_option_copy3_widget.dart';
import '/item_management/edit_item/edit_item_widget.dart';
import '/item_management/view_item/view_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_master_model.dart';
export 'item_master_model.dart';

class ItemMasterWidget extends StatefulWidget {
  const ItemMasterWidget({
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
  State<ItemMasterWidget> createState() => _ItemMasterWidgetState();
}

class _ItemMasterWidgetState extends State<ItemMasterWidget> {
  late ItemMasterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemMasterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        List<ItemManagementRow> itemMasterItemManagementRowList =
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
                  's0cs75p5' /* Item Master */,
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
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
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
                        navSelected: 2,
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
                          maxWidth: 1470.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (widget.authenticatedUser!.isSuperAdmin ||
                                    (widget.authenticatedUser
                                            ?.itemMasterModule ==
                                        'Admin') ||
                                    (widget.authenticatedUser
                                            ?.itemMasterModule ==
                                        'Support'))
                                  Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
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
                                                    DefineParameterInventoryWidget(
                                                  authenticatedUser:
                                                      widget.authenticatedUser!,
                                                  authenticatedCompany: widget
                                                      .authenticatedCompany!,
                                                  authenticatedCompanyDropdown:
                                                      widget
                                                          .authenticatedCompanyDropdown!,
                                                  dropdown: widget.dropdown!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'tnw7kpqn' /* Define Paramaeter */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                if (widget.authenticatedUser!.isSuperAdmin ||
                                    (widget.authenticatedUser
                                            ?.itemMasterModule ==
                                        'Admin') ||
                                    (widget.authenticatedUser
                                            ?.itemMasterModule ==
                                        'Operate') ||
                                    (widget.authenticatedUser
                                            ?.itemMasterModule ==
                                        'Support'))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
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
                                                    child: CreateItemWidget(
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
                                                              (e.dropdownName ==
                                                                  'Item Master Parameter') &&
                                                              (e.module ==
                                                                  'Item Master'))
                                                          .toList()
                                                          .first,
                                                      inventoryParameters: widget
                                                          .authenticatedCompanyDropdown!
                                                          .where((e) =>
                                                              (e.dropdownName ==
                                                                  'Inventory Parameter') &&
                                                              (e.module ==
                                                                  'Inventory'))
                                                          .toList()
                                                          .first,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'p7g38k5u' /* New */,
                                          ),
                                          icon: Icon(
                                            Icons.add,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
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
                                  ),
                              ].divide(SizedBox(width: 5.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final standardParameter =
                                            itemMasterItemManagementRowList
                                                .toList();
                                        if (standardParameter.isEmpty) {
                                          return EmptyWidget();
                                        }
                                        return FlutterFlowDataTable<
                                            ItemManagementRow>(
                                          controller: _model
                                              .paginatedDataTableController1,
                                          data: standardParameter,
                                          columnsBuilder: (onSortChanged) => [
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'lzh5aw6k' /* Item Code */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'aqkuqtvt' /* Item Name */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  minFontSize: 14.0,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'hh9tq0lp' /* Item Category */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mpjxgr4r' /* UoM */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5pdtmll5' /* Remarks */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                            ),
                                          ],
                                          dataRowBuilder:
                                              (standardParameterItem,
                                                      standardParameterIndex,
                                                      selected,
                                                      onSelectChanged) =>
                                                  DataRow(
                                            color: MaterialStateProperty.all(
                                              standardParameterIndex % 2 == 0
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            cells: [
                                              Text(
                                                standardParameterItem.itemCode,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                              Text(
                                                standardParameterItem.itemName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                standardParameterItem
                                                    .itemCategory,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                standardParameterItem
                                                    .measurementUnit,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                standardParameterItem.remarks,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (widget.authenticatedUser!
                                                          .isSuperAdmin ||
                                                      (widget.authenticatedUser
                                                              ?.itemMasterModule ==
                                                          'Admin') ||
                                                      (widget.authenticatedUser
                                                              ?.itemMasterModule ==
                                                          'Operate') ||
                                                      (widget.authenticatedUser
                                                              ?.itemMasterModule ==
                                                          'Support'))
                                                    Builder(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      EditItemWidget(
                                                                    authenticatedUser:
                                                                        widget
                                                                            .authenticatedUser!,
                                                                    authenticatedCompany:
                                                                        widget
                                                                            .authenticatedCompany!,
                                                                    authenticatedCompanyDropdown:
                                                                        widget
                                                                            .authenticatedCompanyDropdown!,
                                                                    dropdown: widget
                                                                        .dropdown!,
                                                                    item:
                                                                        standardParameterItem,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Icon(
                                                          Icons.edit,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (widget.authenticatedUser!
                                                          .isSuperAdmin ||
                                                      (widget.authenticatedUser
                                                              ?.itemMasterModule ==
                                                          'Admin') ||
                                                      (widget.authenticatedUser
                                                              ?.itemMasterModule ==
                                                          'Operate') ||
                                                      (widget.authenticatedUser
                                                              ?.itemMasterModule ==
                                                          'View') ||
                                                      (widget.authenticatedUser
                                                              ?.itemMasterModule ==
                                                          'Support'))
                                                    Builder(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      ViewItemWidget(
                                                                    authenticatedUser:
                                                                        widget
                                                                            .authenticatedUser!,
                                                                    authenticatedCompany:
                                                                        widget
                                                                            .authenticatedCompany!,
                                                                    authenticatedCompanyDropdown:
                                                                        widget
                                                                            .authenticatedCompanyDropdown!,
                                                                    dropdown: widget
                                                                        .dropdown!,
                                                                    item:
                                                                        standardParameterItem,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Icon(
                                                          Icons.remove_red_eye,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (widget.authenticatedUser!
                                                          .isSuperAdmin ||
                                                      (widget.authenticatedUser
                                                              ?.itemMasterModule ==
                                                          'Admin') ||
                                                      (widget.authenticatedUser
                                                              ?.itemMasterModule ==
                                                          'Operate') ||
                                                      (widget.authenticatedUser
                                                              ?.itemMasterModule ==
                                                          'Support'))
                                                    Builder(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      DeleteOptionCopy3Widget(
                                                                    itemId:
                                                                        standardParameterItem
                                                                            .id,
                                                                    companyId:
                                                                        widget
                                                                            .authenticatedCompany!
                                                                            .id,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Icon(
                                                          Icons.delete_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ].map((c) => DataCell(c)).toList(),
                                          ),
                                          emptyBuilder: () => EmptyWidget(),
                                          paginated: false,
                                          selectable: false,
                                          height: 200.0,
                                          minWidth: 700.0,
                                          headingRowHeight: 56.0,
                                          dataRowHeight: 70.0,
                                          columnSpacing: 10.0,
                                          headingRowColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          addHorizontalDivider: true,
                                          addTopAndBottomDivider: true,
                                          hideDefaultHorizontalDivider: true,
                                          horizontalDividerColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          horizontalDividerThickness: 1.0,
                                          addVerticalDivider: true,
                                          verticalDividerColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          verticalDividerThickness: 1.0,
                                        );
                                      },
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final additionalParameter =
                                            itemMasterItemManagementRowList
                                                .toList();
                                        if (additionalParameter.isEmpty) {
                                          return EmptyWidget();
                                        }
                                        return FlutterFlowDataTable<
                                            ItemManagementRow>(
                                          controller: _model
                                              .paginatedDataTableController2,
                                          data: additionalParameter,
                                          columnsBuilder: (onSortChanged) =>
                                              List.generate(
                                            widget.dropdown!.dropdownValues
                                                .length,
                                            (columnIndex) => DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  widget.dropdown!
                                                          .dropdownValues[
                                                      columnIndex],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          dataRowBuilder:
                                              (additionalParameterItem,
                                                      additionalParameterIndex,
                                                      selected,
                                                      onSelectChanged) =>
                                                  DataRow(
                                            color: MaterialStateProperty.all(
                                              additionalParameterIndex % 2 == 0
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            cells: List.generate(
                                              widget.dropdown!.dropdownValues
                                                  .length,
                                              (columnIndex) => DataCell(
                                                Text(
                                                  functions.fetchValueFromJson(
                                                      additionalParameterItem
                                                          .parameters,
                                                      widget.dropdown!
                                                              .dropdownValues[
                                                          columnIndex]),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          emptyBuilder: () => EmptyWidget(),
                                          paginated: false,
                                          selectable: false,
                                          height: 200.0,
                                          minWidth: 700.0,
                                          headingRowHeight: 56.0,
                                          dataRowHeight: 70.0,
                                          columnSpacing: 10.0,
                                          headingRowColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          addHorizontalDivider: true,
                                          addTopAndBottomDivider: true,
                                          hideDefaultHorizontalDivider: true,
                                          horizontalDividerColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          horizontalDividerThickness: 1.0,
                                          addVerticalDivider: true,
                                          verticalDividerColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          verticalDividerThickness: 1.0,
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Container(
                                              height: 55.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(),
                                                  ),
                                                  Container(
                                                    width: 120.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '2pvb28hl' /* Item Code */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 120.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '3485ie6i' /* Item Name */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'yy7ybvgu' /* Item Category */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'cotedf44' /* UoM */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 120.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'affkdw6y' /* Remarks */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final standardParameters =
                                                            widget.dropdown
                                                                    ?.dropdownValues
                                                                    ?.toList() ??
                                                                [];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: List.generate(
                                                              standardParameters
                                                                  .length,
                                                              (standardParametersIndex) {
                                                            final standardParametersItem =
                                                                standardParameters[
                                                                    standardParametersIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 150.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        standardParametersItem,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }).divide(SizedBox(
                                                              width: 10.0)),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(width: 10.0))
                                                    .around(
                                                        SizedBox(width: 10.0)),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(5.0),
                                                  bottomRight:
                                                      Radius.circular(5.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final standardParamete =
                                                              itemMasterItemManagementRowList
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: List.generate(
                                                                standardParamete
                                                                    .length,
                                                                (standardParameteIndex) {
                                                              final standardParameteItem =
                                                                  standardParamete[
                                                                      standardParameteIndex];
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (widget
                                                                          .authenticatedUser!
                                                                          .isSuperAdmin ||
                                                                      (widget.authenticatedUser
                                                                              ?.itemMasterModule ==
                                                                          'Admin') ||
                                                                      (widget.authenticatedUser
                                                                              ?.itemMasterModule ==
                                                                          'Operate') ||
                                                                      (widget.authenticatedUser
                                                                              ?.itemMasterModule ==
                                                                          'Support'))
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: EditItemWidget(
                                                                                    authenticatedUser: widget.authenticatedUser!,
                                                                                    authenticatedCompany: widget.authenticatedCompany!,
                                                                                    authenticatedCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                    dropdown: widget.dropdown!,
                                                                                    item: standardParameteItem,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (widget
                                                                          .authenticatedUser!
                                                                          .isSuperAdmin ||
                                                                      (widget.authenticatedUser?.itemMasterModule ==
                                                                          'Admin') ||
                                                                      (widget.authenticatedUser
                                                                              ?.itemMasterModule ==
                                                                          'Operate') ||
                                                                      (widget.authenticatedUser
                                                                              ?.itemMasterModule ==
                                                                          'View') ||
                                                                      (widget.authenticatedUser
                                                                              ?.itemMasterModule ==
                                                                          'Support'))
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: ViewItemWidget(
                                                                                    authenticatedUser: widget.authenticatedUser!,
                                                                                    authenticatedCompany: widget.authenticatedCompany!,
                                                                                    authenticatedCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                    dropdown: widget.dropdown!,
                                                                                    item: standardParameteItem,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .remove_red_eye,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (widget
                                                                          .authenticatedUser!
                                                                          .isSuperAdmin ||
                                                                      (widget.authenticatedUser
                                                                              ?.itemMasterModule ==
                                                                          'Admin') ||
                                                                      (widget.authenticatedUser
                                                                              ?.itemMasterModule ==
                                                                          'Operate') ||
                                                                      (widget.authenticatedUser
                                                                              ?.itemMasterModule ==
                                                                          'Support'))
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: DeleteOptionCopy3Widget(
                                                                                    itemId: standardParameteItem.id,
                                                                                    companyId: widget.authenticatedCompany!.id,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .delete_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final itemname =
                                                              itemMasterItemManagementRowList
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: List.generate(
                                                                itemname.length,
                                                                (itemnameIndex) {
                                                              final itemnameItem =
                                                                  itemname[
                                                                      itemnameIndex];
                                                              return Text(
                                                                itemnameItem
                                                                    .itemCode,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              );
                                                            }).divide(SizedBox(
                                                                height: 7.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final itemname =
                                                              itemMasterItemManagementRowList
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: List.generate(
                                                                itemname.length,
                                                                (itemnameIndex) {
                                                              final itemnameItem =
                                                                  itemname[
                                                                      itemnameIndex];
                                                              return Text(
                                                                itemnameItem
                                                                    .itemName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              );
                                                            }).divide(SizedBox(
                                                                height: 7.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final itemCategory =
                                                              itemMasterItemManagementRowList
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: List.generate(
                                                                itemCategory
                                                                    .length,
                                                                (itemCategoryIndex) {
                                                              final itemCategoryItem =
                                                                  itemCategory[
                                                                      itemCategoryIndex];
                                                              return Text(
                                                                itemCategoryItem
                                                                    .itemCategory,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              );
                                                            }).divide(SizedBox(
                                                                height: 7.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final uoM =
                                                              itemMasterItemManagementRowList
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children:
                                                                List.generate(
                                                                    uoM.length,
                                                                    (uoMIndex) {
                                                              final uoMItem =
                                                                  uoM[uoMIndex];
                                                              return Text(
                                                                uoMItem
                                                                    .measurementUnit,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              );
                                                            }).divide(SizedBox(
                                                                    height:
                                                                        7.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final remarks =
                                                              itemMasterItemManagementRowList
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: List.generate(
                                                                remarks.length,
                                                                (remarksIndex) {
                                                              final remarksItem =
                                                                  remarks[
                                                                      remarksIndex];
                                                              return Text(
                                                                remarksItem
                                                                    .remarks,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              );
                                                            }).divide(SizedBox(
                                                                height: 7.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final parameters = widget
                                                                .dropdown
                                                                ?.dropdownValues
                                                                ?.toList() ??
                                                            [];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              parameters.length,
                                                              (parametersIndex) {
                                                            final parametersItem =
                                                                parameters[
                                                                    parametersIndex];
                                                            return Container(
                                                              width: 150.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final columnParameters =
                                                                      itemMasterItemManagementRowList
                                                                          .toList();
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: List.generate(
                                                                        columnParameters
                                                                            .length,
                                                                        (columnParametersIndex) {
                                                                      final columnParametersItem =
                                                                          columnParameters[
                                                                              columnParametersIndex];
                                                                      return Text(
                                                                        functions.fetchValueFromJson(
                                                                            columnParametersItem.parameters,
                                                                            parametersItem),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        height:
                                                                            7.0)),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          }).divide(SizedBox(
                                                              width: 10.0)),
                                                        );
                                                      },
                                                    ),
                                                  ]
                                                      .divide(
                                                          SizedBox(width: 10.0))
                                                      .around(SizedBox(
                                                          width: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]
                                        .addToStart(SizedBox(width: 10.0))
                                        .addToEnd(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Container(
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(12.0),
                                                topRight: Radius.circular(12.0),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 120.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'pd6od0g3' /* Item Code */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 130.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'poofbqlu' /* Item Name */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '2trgwnt1' /* Item Category */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 120.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'kpympqdl' /* UoM */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 130.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '2i9lod7l' /* Remarks */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final standardParameters =
                                                          widget.dropdown
                                                                  ?.dropdownValues
                                                                  ?.toList() ??
                                                              [];
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: List.generate(
                                                            standardParameters
                                                                .length,
                                                            (standardParametersIndex) {
                                                          final standardParametersItem =
                                                              standardParameters[
                                                                  standardParametersIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 150.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      standardParametersItem,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(SizedBox(
                                                            width: 10.0)),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 10.0))
                                                  .around(
                                                      SizedBox(width: 10.0)),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final values =
                                                itemMasterItemManagementRowList
                                                    .toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  values.length, (valuesIndex) {
                                                final valuesItem =
                                                    values[valuesIndex];
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      minHeight: 70.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                5.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                5.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 120.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (widget
                                                                        .authenticatedUser!
                                                                        .isSuperAdmin ||
                                                                    (widget.authenticatedUser
                                                                            ?.itemMasterModule ==
                                                                        'Admin') ||
                                                                    (widget.authenticatedUser
                                                                            ?.itemMasterModule ==
                                                                        'Operate') ||
                                                                    (widget.authenticatedUser
                                                                            ?.itemMasterModule ==
                                                                        'Support'))
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: EditItemWidget(
                                                                                  authenticatedUser: widget.authenticatedUser!,
                                                                                  authenticatedCompany: widget.authenticatedCompany!,
                                                                                  authenticatedCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                  dropdown: widget.dropdown!,
                                                                                  item: valuesItem,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .edit,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (widget
                                                                        .authenticatedUser!
                                                                        .isSuperAdmin ||
                                                                    (widget.authenticatedUser?.itemMasterModule ==
                                                                        'Admin') ||
                                                                    (widget.authenticatedUser
                                                                            ?.itemMasterModule ==
                                                                        'Operate') ||
                                                                    (widget.authenticatedUser
                                                                            ?.itemMasterModule ==
                                                                        'View') ||
                                                                    (widget.authenticatedUser
                                                                            ?.itemMasterModule ==
                                                                        'Support'))
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: ViewItemWidget(
                                                                                  authenticatedUser: widget.authenticatedUser!,
                                                                                  authenticatedCompany: widget.authenticatedCompany!,
                                                                                  authenticatedCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                  dropdown: widget.dropdown!,
                                                                                  item: valuesItem,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .remove_red_eye,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (widget
                                                                        .authenticatedUser!
                                                                        .isSuperAdmin ||
                                                                    (widget.authenticatedUser
                                                                            ?.itemMasterModule ==
                                                                        'Admin') ||
                                                                    (widget.authenticatedUser
                                                                            ?.itemMasterModule ==
                                                                        'Operate') ||
                                                                    (widget.authenticatedUser
                                                                            ?.itemMasterModule ==
                                                                        'Support'))
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: DeleteOptionCopy3Widget(
                                                                                  itemId: valuesItem.id,
                                                                                  companyId: widget.authenticatedCompany!.id,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .delete_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valuesItem
                                                                      .itemCode,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 7.0)),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 130.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valuesItem
                                                                      .itemName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 7.0)),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valuesItem
                                                                      .itemCategory,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 7.0)),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valuesItem
                                                                      .measurementUnit,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 7.0)),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 130.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valuesItem
                                                                      .remarks,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 7.0)),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final parameter = widget
                                                                        .dropdown
                                                                        ?.dropdownValues
                                                                        ?.toList() ??
                                                                    [];
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: List.generate(
                                                                      parameter
                                                                          .length,
                                                                      (parameterIndex) {
                                                                    final parameterItem =
                                                                        parameter[
                                                                            parameterIndex];
                                                                    return Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                functions.fetchValueFromJson(valuesItem.parameters, parameterItem),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }).divide(
                                                                      SizedBox(
                                                                          width:
                                                                              10.0)),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                width: 10.0))
                                                            .around(SizedBox(
                                                                width: 10.0)),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ]
                                      .addToStart(SizedBox(width: 10.0))
                                      .addToEnd(SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 20.0))
                              .around(SizedBox(height: 20.0)),
                        ),
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
