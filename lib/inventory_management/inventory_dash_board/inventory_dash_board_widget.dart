import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/remarks_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/inventory_management/assign_user/assign_user_widget.dart';
import '/inventory_management/assign_user_copy/assign_user_copy_widget.dart';
import '/inventory_management/define_parameter_inventory_copy/define_parameter_inventory_copy_widget.dart';
import '/item_management/itemparameter/itemparameter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'inventory_dash_board_model.dart';
export 'inventory_dash_board_model.dart';

class InventoryDashBoardWidget extends StatefulWidget {
  const InventoryDashBoardWidget({
    super.key,
    required this.authenticatedUser,
    required this.authenticatedCompany,
    required this.authenticatedCompanyDropdown,
    required this.itemParameters,
    required this.inventoryParameters,
  });

  final UserManagementRow? authenticatedUser;
  final CompanyManagementRow? authenticatedCompany;
  final List<DropdownManagementRow>? authenticatedCompanyDropdown;
  final DropdownManagementRow? itemParameters;
  final DropdownManagementRow? inventoryParameters;

  @override
  State<InventoryDashBoardWidget> createState() =>
      _InventoryDashBoardWidgetState();
}

class _InventoryDashBoardWidgetState extends State<InventoryDashBoardWidget>
    with TickerProviderStateMixin {
  late InventoryDashBoardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventoryDashBoardModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: min(
          valueOrDefault<int>(
            FFAppState().inventoryTabIndex,
            0,
          ),
          2),
    )..addListener(() => setState(() {}));
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

    return FutureBuilder<List<InwardInventoryManagementRow>>(
      future: FFAppState().inwards(
        uniqueQueryKey: widget.authenticatedCompany?.id.toString(),
        requestFn: () => InwardInventoryManagementTable().queryRows(
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
        List<InwardInventoryManagementRow>
            inventoryDashBoardInwardInventoryManagementRowList = snapshot.data!;
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
                  );
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '5s4jv80h' /* Material Management */,
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
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
                          kTransitionInfoKey: const TransitionInfo(
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
              child: FutureBuilder<List<UserManagementRow>>(
                future: FFAppState().companyUsers(
                  uniqueQueryKey: widget.authenticatedCompany?.id.toString(),
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
                  List<UserManagementRow> containerUserManagementRowList =
                      snapshot.data!;
                  return Container(
                    decoration: const BoxDecoration(),
                    child: FutureBuilder<List<ApprovalUserRow>>(
                      future: FFAppState().approvalUsers(
                        uniqueQueryKey:
                            widget.authenticatedCompany?.id.toString(),
                        requestFn: () => ApprovalUserTable().queryRows(
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
                        List<ApprovalUserRow> containerApprovalUserRowList =
                            snapshot.data!;
                        return Container(
                          decoration: const BoxDecoration(),
                          child: FutureBuilder<
                              List<LotWiseInventoryManagementRow>>(
                            future: FFAppState().lotWiseInventory(
                              uniqueQueryKey:
                                  widget.authenticatedCompany?.id.toString(),
                              requestFn: () =>
                                  LotWiseInventoryManagementTable().queryRows(
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
                              List<LotWiseInventoryManagementRow>
                                  containerLotWiseInventoryManagementRowList =
                                  snapshot.data!;
                              return Container(
                                decoration: const BoxDecoration(),
                                child: FutureBuilder<List<ItemManagementRow>>(
                                  future: FFAppState().items(
                                    uniqueQueryKey: widget
                                        .authenticatedCompany?.id
                                        .toString(),
                                    requestFn: () =>
                                        ItemManagementTable().queryRows(
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ItemManagementRow>
                                        containerItemManagementRowList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: FutureBuilder<
                                          List<
                                              MovingAverageInventoryManagementRow>>(
                                        future:
                                            FFAppState().movingAverageInventory(
                                          uniqueQueryKey: widget
                                              .authenticatedCompany?.id
                                              .toString(),
                                          requestFn: () =>
                                              MovingAverageInventoryManagementTable()
                                                  .queryRows(
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<MovingAverageInventoryManagementRow>
                                              containerMovingAverageInventoryManagementRowList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: FutureBuilder<
                                                List<
                                                    OutwardInventoryManagementRow>>(
                                              future: FFAppState().outwards(
                                                uniqueQueryKey: widget
                                                    .authenticatedCompany?.id
                                                    .toString(),
                                                requestFn: () =>
                                                    OutwardInventoryManagementTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eq(
                                                    'company',
                                                    widget.authenticatedCompany
                                                        ?.id,
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
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<OutwardInventoryManagementRow>
                                                    containerOutwardInventoryManagementRowList =
                                                    snapshot.data!;
                                                return Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                      ))
                                                        wrapWithModel(
                                                          model: _model
                                                              .sideNavModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: SideNavWidget(
                                                            navSelected: 10,
                                                            authenticatedUser:
                                                                widget
                                                                    .authenticatedUser,
                                                            authenticatedCompany:
                                                                widget
                                                                    .authenticatedCompany,
                                                            authenticatedCompanyDropdwon:
                                                                widget
                                                                    .authenticatedCompanyDropdown,
                                                            tabselected:
                                                                FFAppState()
                                                                    .inventoryTabIndex,
                                                          ),
                                                        ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            constraints:
                                                                const BoxConstraints(
                                                              maxWidth: 1470.0,
                                                            ),
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const Alignment(
                                                                          0.0,
                                                                          0),
                                                                  child: TabBar(
                                                                    labelColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    unselectedLabelColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    unselectedLabelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    indicatorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    tabs: [
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'pwwbkm69' /* Inward */,
                                                                        ),
                                                                      ),
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'lt5kyel7' /* Inventory */,
                                                                        ),
                                                                      ),
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'c0smpq6a' /* Outward */,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                    controller:
                                                                        _model
                                                                            .tabBarController,
                                                                    onTap:
                                                                        (i) async {
                                                                      [
                                                                        () async {},
                                                                        () async {},
                                                                        () async {}
                                                                      ][i]();
                                                                    },
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      TabBarView(
                                                                    controller:
                                                                        _model
                                                                            .tabBarController,
                                                                    children: [
                                                                      KeepAliveWidgetWrapper(
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Wrap(
                                                                                    spacing: 10.0,
                                                                                    runSpacing: 10.0,
                                                                                    alignment: WrapAlignment.start,
                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                    direction: Axis.horizontal,
                                                                                    runAlignment: WrapAlignment.start,
                                                                                    verticalDirection: VerticalDirection.down,
                                                                                    clipBehavior: Clip.none,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Builder(
                                                                                                  builder: (context) => FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      await showDialog(
                                                                                                        context: context,
                                                                                                        builder: (dialogContext) {
                                                                                                          return Dialog(
                                                                                                            elevation: 0,
                                                                                                            insetPadding: EdgeInsets.zero,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                            child: GestureDetector(
                                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                              child: DefineParameterInventoryCopyWidget(
                                                                                                                authenticatedUser: widget.authenticatedUser!,
                                                                                                                authenticatedCompany: widget.authenticatedCompany!,
                                                                                                                authenticatedCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                                                dropdown: widget.authenticatedCompanyDropdown!.where((e) => (e.module == 'Inventory') && (e.dropdownName == 'Inventory Parameter')).toList().first,
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => setState(() {}));
                                                                                                    },
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'mdrr4k6l' /* Add Parameter */,
                                                                                                    ),
                                                                                                    options: FFButtonOptions(
                                                                                                      height: 40.0,
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Readex Pro',
                                                                                                            color: Colors.white,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      elevation: 3.0,
                                                                                                      borderSide: const BorderSide(
                                                                                                        color: Colors.transparent,
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              FFButtonWidget(
                                                                                                onPressed: () async {
                                                                                                  setState(() {
                                                                                                    FFAppState().ineventoryParameters = [];
                                                                                                    FFAppState().item = [];
                                                                                                  });

                                                                                                  context.pushNamed(
                                                                                                    'CreateInwardMaterial',
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
                                                                                                      'inwardType': serializeParam(
                                                                                                        widget.authenticatedCompanyDropdown?.where((e) => (e.module == 'Inventory') && (e.dropdownName == 'Inward Material - Inward Type')).toList().first,
                                                                                                        ParamType.SupabaseRow,
                                                                                                      ),
                                                                                                      'inwardLocation': serializeParam(
                                                                                                        widget.authenticatedCompanyDropdown?.where((e) => (e.module == 'Inventory') && (e.dropdownName == 'Inward Material - Inward Location')).toList().first,
                                                                                                        ParamType.SupabaseRow,
                                                                                                      ),
                                                                                                      'inwardNo': serializeParam(
                                                                                                        (inventoryDashBoardInwardInventoryManagementRowList.length + 1).toString(),
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'approvalUser': serializeParam(
                                                                                                        containerUserManagementRowList.where((e) => e.id == containerApprovalUserRowList.where((e) => e.processName == 'Inventory Inward').toList().first.user).toList().first,
                                                                                                        ParamType.SupabaseRow,
                                                                                                      ),
                                                                                                      'itemMasterParameters': serializeParam(
                                                                                                        widget.authenticatedCompanyDropdown?.where((e) => (e.module == 'Item Master') && (e.dropdownName == 'Item Master Parameter')).toList().first,
                                                                                                        ParamType.SupabaseRow,
                                                                                                      ),
                                                                                                      'inventoryParameters': serializeParam(
                                                                                                        widget.authenticatedCompanyDropdown?.where((e) => (e.module == 'Inventory') && (e.dropdownName == 'Inventory Parameter')).toList().first,
                                                                                                        ParamType.SupabaseRow,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      kTransitionInfoKey: const TransitionInfo(
                                                                                                        hasTransition: true,
                                                                                                        transitionType: PageTransitionType.fade,
                                                                                                        duration: Duration(milliseconds: 0),
                                                                                                      ),
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'v1zhnxw0' /* New */,
                                                                                                ),
                                                                                                icon: const Icon(
                                                                                                  Icons.add,
                                                                                                  size: 15.0,
                                                                                                ),
                                                                                                options: FFButtonOptions(
                                                                                                  height: 40.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Readex Pro',
                                                                                                        color: Colors.white,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                  elevation: 3.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Colors.transparent,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(const SizedBox(width: 10.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      FlutterFlowChoiceChips(
                                                                                        options: [
                                                                                          ChipData(FFLocalizations.of(context).getText(
                                                                                            'kdy7ysuc' /* Assigned To Me */,
                                                                                          )),
                                                                                          ChipData(FFLocalizations.of(context).getText(
                                                                                            'urmszwex' /* All */,
                                                                                          ))
                                                                                        ],
                                                                                        onChanged: (val) async {
                                                                                          setState(() => _model.desktopChoiceChipsValue = val?.firstOrNull);
                                                                                          FFAppState().clearInwardsCacheKey(widget.authenticatedCompany?.id.toString());
                                                                                        },
                                                                                        selectedChipStyle: ChipStyle(
                                                                                          backgroundColor: FlutterFlowTheme.of(context).accent1,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 17.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          iconSize: 18.0,
                                                                                          labelPadding: const EdgeInsets.all(5.0),
                                                                                          elevation: 0.0,
                                                                                          borderRadius: BorderRadius.circular(4.0),
                                                                                        ),
                                                                                        unselectedChipStyle: ChipStyle(
                                                                                          backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 18.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          iconSize: 18.0,
                                                                                          labelPadding: const EdgeInsets.all(5.0),
                                                                                          elevation: 0.0,
                                                                                          borderRadius: BorderRadius.circular(4.0),
                                                                                        ),
                                                                                        chipSpacing: 18.0,
                                                                                        rowSpacing: 12.0,
                                                                                        multiselect: false,
                                                                                        initialized: _model.desktopChoiceChipsValue != null,
                                                                                        alignment: WrapAlignment.start,
                                                                                        controller: _model.desktopChoiceChipsValueController ??= FormFieldController<List<String>>(
                                                                                          [
                                                                                            FFAppState().choiceChips
                                                                                          ],
                                                                                        ),
                                                                                        wrapped: false,
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                't1v7sv4h' /* Assign Approvals To : */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Readex Pro',
                                                                                                    letterSpacing: 0.0,
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
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                          child: AssignUserWidget(
                                                                                                            authenticatedUser: widget.authenticatedUser!,
                                                                                                            authenticatedCompany: widget.authenticatedCompany!,
                                                                                                            authenticatetdCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 200.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Container(
                                                                                                    decoration: const BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            containerUserManagementRowList.where((e) => e.id == containerApprovalUserRowList.where((e) => e.processName == 'Inventory Inward').toList().first.user).toList().first.fullName,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            containerUserManagementRowList.where((e) => e.id == containerApprovalUserRowList.where((e) => e.processName == 'Inventory Inward').toList().first.user).toList().first.email,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(const SizedBox(height: 5.0)).around(const SizedBox(height: 5.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(const SizedBox(width: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                      if (responsiveVisibility(
                                                                                        context: context,
                                                                                        phone: false,
                                                                                        tablet: false,
                                                                                        tabletLandscape: false,
                                                                                        desktop: false,
                                                                                      ))
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
                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    child: GestureDetector(
                                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                      child: AssignUserWidget(
                                                                                                        authenticatedUser: widget.authenticatedUser!,
                                                                                                        authenticatedCompany: widget.authenticatedCompany!,
                                                                                                        authenticatetdCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => setState(() {}));
                                                                                            },
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              'dtg3x783' /* Send User for Approval */,
                                                                                            ),
                                                                                            options: FFButtonOptions(
                                                                                              height: 40.0,
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'Readex Pro',
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              borderSide: const BorderSide(
                                                                                                color: Colors.transparent,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                if (_model.desktopChoiceChipsValue == 'Assigned To Me')
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Container(
                                                                                                  height: 55.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(12.0),
                                                                                                      topRight: Radius.circular(12.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 120.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'z7zlllr1' /* Inward No. */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 130.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'z8ua4387' /* Inward Details */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 120.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Align(
                                                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                              child: Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'wz7vqllm' /* Type */,
                                                                                                                ),
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
                                                                                                      Container(
                                                                                                        width: 120.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                '6tok8q9r' /* Location */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 120.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'whnlfhkt' /* Material Received from */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'ir5mf8sx' /* Reference Number */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                '7e42jxdr' /* Remarks */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                '11luah2i' /* Report conclusion */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Builder(
                                                                                                builder: (context) {
                                                                                                  final values = inventoryDashBoardInwardInventoryManagementRowList.where((e) => (e.currentlyAssignedTo == widget.authenticatedUser?.id) && (e.conclusion != 'Approved') && (e.conclusion != 'Rejected')).toList().map((e) => e).toList();
                                                                                                  return SingleChildScrollView(
                                                                                                    primary: false,
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: List.generate(values.length, (valuesIndex) {
                                                                                                        final valuesItem = values[valuesIndex];
                                                                                                        return Align(
                                                                                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Container(
                                                                                                            constraints: const BoxConstraints(
                                                                                                              minHeight: 70.0,
                                                                                                            ),
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                                              borderRadius: const BorderRadius.only(
                                                                                                                bottomLeft: Radius.circular(5.0),
                                                                                                                bottomRight: Radius.circular(5.0),
                                                                                                                topLeft: Radius.circular(0.0),
                                                                                                                topRight: Radius.circular(0.0),
                                                                                                              ),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                width: 1.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  setState(() {
                                                                                                                    FFAppState().ineventoryParameters = [];
                                                                                                                    FFAppState().item = [];
                                                                                                                  });
                                                                                                                  if (valuesItem.sendForApprovalTo == valuesItem.currentlyAssignedTo) {
                                                                                                                    context.pushNamed(
                                                                                                                      'ApprovalInward',
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
                                                                                                                        'purchaseOrderNumber': serializeParam(
                                                                                                                          valuesItem.purchaseOrderNumber,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'inwardedBy': serializeParam(
                                                                                                                          valuesItem.inwardedBy,
                                                                                                                          ParamType.int,
                                                                                                                        ),
                                                                                                                        'inwardNumber': serializeParam(
                                                                                                                          valuesItem.inwardNumber,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'inward': serializeParam(
                                                                                                                          valuesItem.id,
                                                                                                                          ParamType.int,
                                                                                                                        ),
                                                                                                                        'inwardType': serializeParam(
                                                                                                                          valuesItem.inwardType,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'inwardedOn': serializeParam(
                                                                                                                          valuesItem.inwardedOn,
                                                                                                                          ParamType.DateTime,
                                                                                                                        ),
                                                                                                                        'inwardLocation': serializeParam(
                                                                                                                          valuesItem.inwardLocation,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'materialSubContractNo': serializeParam(
                                                                                                                          valuesItem.subcontractMaterialOutwardNumber,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'materialReceivedFrom': serializeParam(
                                                                                                                          valuesItem.materialReceivedFrom,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'referenceNumber': serializeParam(
                                                                                                                          valuesItem.referenceNumber,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'remark': serializeParam(
                                                                                                                          valuesItem.inwardRemarks,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'attachment': serializeParam(
                                                                                                                          valuesItem.attachment,
                                                                                                                          ParamType.String,
                                                                                                                          true,
                                                                                                                        ),
                                                                                                                        'conclusion': serializeParam(
                                                                                                                          valuesItem.conclusion,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'approvalRemark': serializeParam(
                                                                                                                          valuesItem.approvalRemark,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'itemParameters': serializeParam(
                                                                                                                          widget.itemParameters,
                                                                                                                          ParamType.SupabaseRow,
                                                                                                                        ),
                                                                                                                        'inventoryParameters': serializeParam(
                                                                                                                          widget.inventoryParameters,
                                                                                                                          ParamType.SupabaseRow,
                                                                                                                        ),
                                                                                                                        'currentlyAssignedTo': serializeParam(
                                                                                                                          valuesItem.currentlyAssignedTo,
                                                                                                                          ParamType.int,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    _model.item = await InwardInventoryTableManagementTable().queryRows(
                                                                                                                      queryFn: (q) => q
                                                                                                                          .eq(
                                                                                                                            'inward',
                                                                                                                            valuesItem.id,
                                                                                                                          )
                                                                                                                          .eq(
                                                                                                                            'company',
                                                                                                                            widget.authenticatedCompany?.id,
                                                                                                                          ),
                                                                                                                    );
                                                                                                                    setState(() {
                                                                                                                      FFAppState().loopIndex = 0;
                                                                                                                      FFAppState().ineventoryParameters = _model.item!.map((e) => e.inventoryParameters).toList().cast<dynamic>();
                                                                                                                    });
                                                                                                                    while (FFAppState().loopIndex < _model.item!.length) {
                                                                                                                      setState(() {
                                                                                                                        FFAppState().addToItem(InwardDataStruct(
                                                                                                                          remark: _model.item?[FFAppState().loopIndex].remarks,
                                                                                                                          qrVerified: _model.item?[FFAppState().loopIndex].qrVerified,
                                                                                                                          lotNo: _model.item?[FFAppState().loopIndex].lotNo,
                                                                                                                          itemId: _model.item?[FFAppState().loopIndex].item,
                                                                                                                          rate: _model.item?[FFAppState().loopIndex].rate,
                                                                                                                          requireQuantity: _model.item?[FFAppState().loopIndex].requireQuantity,
                                                                                                                          receiveQuantity: _model.item?[FFAppState().loopIndex].receivedQuantity,
                                                                                                                        ));
                                                                                                                        FFAppState().loopIndex = FFAppState().loopIndex + 1;
                                                                                                                      });
                                                                                                                    }

                                                                                                                    context.pushNamed(
                                                                                                                      'InwardBack',
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
                                                                                                                        'purchaseOrderNumber': serializeParam(
                                                                                                                          valuesItem.purchaseOrderNumber,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'inwardedBy': serializeParam(
                                                                                                                          valuesItem.inwardedBy,
                                                                                                                          ParamType.int,
                                                                                                                        ),
                                                                                                                        'inwardNumber': serializeParam(
                                                                                                                          valuesItem.inwardNumber,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'inward': serializeParam(
                                                                                                                          valuesItem.id,
                                                                                                                          ParamType.int,
                                                                                                                        ),
                                                                                                                        'inwardType': serializeParam(
                                                                                                                          valuesItem.inwardType,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'inwardedOn': serializeParam(
                                                                                                                          valuesItem.inwardedOn,
                                                                                                                          ParamType.DateTime,
                                                                                                                        ),
                                                                                                                        'inwardLocation': serializeParam(
                                                                                                                          valuesItem.inwardLocation,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'materialSubContractNo': serializeParam(
                                                                                                                          valuesItem.subcontractMaterialOutwardNumber,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'materialReceivedFrom': serializeParam(
                                                                                                                          valuesItem.materialReceivedFrom,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'referenceNumber': serializeParam(
                                                                                                                          valuesItem.referenceNumber,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'remark': serializeParam(
                                                                                                                          valuesItem.inwardRemarks,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'attachment': serializeParam(
                                                                                                                          valuesItem.attachment,
                                                                                                                          ParamType.String,
                                                                                                                          true,
                                                                                                                        ),
                                                                                                                        'conclusion': serializeParam(
                                                                                                                          valuesItem.conclusion,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'approvalRemark': serializeParam(
                                                                                                                          valuesItem.approvalRemark,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'sendToApproval': serializeParam(
                                                                                                                          valuesItem.sendForApprovalTo,
                                                                                                                          ParamType.int,
                                                                                                                        ),
                                                                                                                        'inwardTypeDropdowm': serializeParam(
                                                                                                                          widget.authenticatedCompanyDropdown?.where((e) => (e.module == 'Inventory') && (e.dropdownName == 'Inward Material - Inward Type')).toList().first,
                                                                                                                          ParamType.SupabaseRow,
                                                                                                                        ),
                                                                                                                        'inwardLocationDropdown': serializeParam(
                                                                                                                          widget.authenticatedCompanyDropdown?.where((e) => (e.module == 'Inventory') && (e.dropdownName == 'Inward Material - Inward Location')).toList().first,
                                                                                                                          ParamType.SupabaseRow,
                                                                                                                        ),
                                                                                                                        'itemMasterParameters': serializeParam(
                                                                                                                          widget.itemParameters,
                                                                                                                          ParamType.SupabaseRow,
                                                                                                                        ),
                                                                                                                        'inventoryParameters': serializeParam(
                                                                                                                          widget.inventoryParameters,
                                                                                                                          ParamType.SupabaseRow,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                    );
                                                                                                                  }

                                                                                                                  setState(() {});
                                                                                                                },
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 120.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Align(
                                                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              valuesItem.inwardNumber,
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    fontSize: 18.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 130.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            containerUserManagementRowList.where((e) => e.id == valuesItem.inwardedBy).toList().first.fullName,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            dateTimeFormat(
                                                                                                                              'yMMMd',
                                                                                                                              valuesItem.inwardedOn,
                                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 120.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.inwardType,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 120.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.inwardLocation,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 120.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.materialReceivedFrom,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.referenceNumber,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.inwardRemarks,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.conclusion,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ].addToStart(const SizedBox(width: 10.0)).addToEnd(const SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (_model.desktopChoiceChipsValue == 'All')
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Container(
                                                                                                  height: 55.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(12.0),
                                                                                                      topRight: Radius.circular(12.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 120.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'yf3navq5' /* Inward No. */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 130.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'fcwmzxnm' /* Inward Details */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 120.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Align(
                                                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                              child: Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'gt69t5a7' /* Type */,
                                                                                                                ),
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
                                                                                                      Container(
                                                                                                        width: 120.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'kfo9sfrz' /* Location */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 120.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'cnvxxwsg' /* Material Received from */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'b4utdqb9' /* Reference Number */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'ikqp6ixy' /* Remarks */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                '7b2n530l' /* Report conclusion */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Builder(
                                                                                                builder: (context) {
                                                                                                  final values = inventoryDashBoardInwardInventoryManagementRowList.toList();
                                                                                                  return SingleChildScrollView(
                                                                                                    primary: false,
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: List.generate(values.length, (valuesIndex) {
                                                                                                        final valuesItem = values[valuesIndex];
                                                                                                        return Align(
                                                                                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Container(
                                                                                                            constraints: const BoxConstraints(
                                                                                                              minHeight: 70.0,
                                                                                                            ),
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                                              borderRadius: const BorderRadius.only(
                                                                                                                bottomLeft: Radius.circular(5.0),
                                                                                                                bottomRight: Radius.circular(5.0),
                                                                                                                topLeft: Radius.circular(0.0),
                                                                                                                topRight: Radius.circular(0.0),
                                                                                                              ),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                width: 1.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  setState(() {
                                                                                                                    _model.desktopChoiceChipsValueController?.value = ['All'];
                                                                                                                  });

                                                                                                                  context.pushNamed(
                                                                                                                    'ViewInward',
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
                                                                                                                      'purchaseOrderNumber': serializeParam(
                                                                                                                        valuesItem.purchaseOrderNumber,
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'inwardedBy': serializeParam(
                                                                                                                        valuesItem.inwardedBy,
                                                                                                                        ParamType.int,
                                                                                                                      ),
                                                                                                                      'inwardNumber': serializeParam(
                                                                                                                        valuesItem.inwardNumber,
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'inward': serializeParam(
                                                                                                                        valuesItem.id,
                                                                                                                        ParamType.int,
                                                                                                                      ),
                                                                                                                      'inwardType': serializeParam(
                                                                                                                        valuesItem.inwardType,
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'inwardedOn': serializeParam(
                                                                                                                        valuesItem.inwardedOn,
                                                                                                                        ParamType.DateTime,
                                                                                                                      ),
                                                                                                                      'inwardLocation': serializeParam(
                                                                                                                        valuesItem.inwardLocation,
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'materialSubContractNo': serializeParam(
                                                                                                                        valuesItem.subcontractMaterialOutwardNumber,
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'materialReceivedFrom': serializeParam(
                                                                                                                        valuesItem.materialReceivedFrom,
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'referenceNumber': serializeParam(
                                                                                                                        valuesItem.referenceNumber,
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'remark': serializeParam(
                                                                                                                        valuesItem.inwardRemarks,
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'attachment': serializeParam(
                                                                                                                        valuesItem.attachment,
                                                                                                                        ParamType.String,
                                                                                                                        true,
                                                                                                                      ),
                                                                                                                      'conclusion': serializeParam(
                                                                                                                        valuesItem.conclusion,
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'approvalRemark': serializeParam(
                                                                                                                        valuesItem.approvalRemark,
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'itemParameters': serializeParam(
                                                                                                                        widget.itemParameters,
                                                                                                                        ParamType.SupabaseRow,
                                                                                                                      ),
                                                                                                                      'inventoryParameters': serializeParam(
                                                                                                                        widget.inventoryParameters,
                                                                                                                        ParamType.SupabaseRow,
                                                                                                                      ),
                                                                                                                      'currentlyAssignedTo': serializeParam(
                                                                                                                        valuesItem.currentlyAssignedTo,
                                                                                                                        ParamType.int,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                  );
                                                                                                                },
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 120.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Align(
                                                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              valuesItem.inwardNumber,
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    fontSize: 18.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 130.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            containerUserManagementRowList.where((e) => e.id == valuesItem.inwardedBy).toList().first.fullName,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            dateTimeFormat(
                                                                                                                              'yMMMd',
                                                                                                                              valuesItem.inwardedOn,
                                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 120.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.inwardType,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 120.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.inwardLocation,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 120.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.materialReceivedFrom,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.referenceNumber,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.inwardRemarks,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valuesItem.conclusion,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(const SizedBox(height: 7.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ].addToStart(const SizedBox(width: 10.0)).addToEnd(const SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ].divide(const SizedBox(height: 10.0)).addToStart(const SizedBox(height: 20.0)).addToEnd(const SizedBox(height: 20.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      KeepAliveWidgetWrapper(
                                                                        builder:
                                                                            (context) =>
                                                                                SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              if (widget.authenticatedUser!.isSuperAdmin || (widget.authenticatedUser?.itemMasterModule == 'Admin') || (widget.authenticatedUser?.itemMasterModule == 'Operate') || (widget.authenticatedUser?.itemMasterModule == 'View') || (widget.authenticatedUser?.itemMasterModule == 'Support'))
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        context.pushNamed(
                                                                                          'ItemMaster',
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
                                                                                            'dropdown': serializeParam(
                                                                                              widget.authenticatedCompanyDropdown?.where((e) => (e.module == 'Item Master') && (e.dropdownName == 'Item Master Parameter')).toList().first,
                                                                                              ParamType.SupabaseRow,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            kTransitionInfoKey: const TransitionInfo(
                                                                                              hasTransition: true,
                                                                                              transitionType: PageTransitionType.fade,
                                                                                              duration: Duration(milliseconds: 0),
                                                                                            ),
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'kwplqpx1' /* Go to Item Master */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: const BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (widget.authenticatedCompany?.inventoryCalculationMethod == 'Lot Wise')
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                  child: SingleChildScrollView(
                                                                                    scrollDirection: Axis.horizontal,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                              child: Container(
                                                                                                height: 55.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                    topLeft: Radius.circular(12.0),
                                                                                                    topRight: Radius.circular(12.0),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'dpffps7m' /* Item Code */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Align(
                                                                                                            alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'v34hzmrp' /* Item Name */,
                                                                                                              ),
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
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '3fiknra9' /* Item Category */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '3hldii6g' /* UoM */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'giv3xdfs' /* Physical Quantity */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'iqgusiv1' /* Lot No */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'qs85qu1w' /* Rate/UoM-Latest */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'itty9qd4' /* Rate/UoM-Moving Avg */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'j69k0buu' /* Total Rate */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'ebkaehi4' /* Allocated Quantity */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '64d895oz' /* Qty available for allocation */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '6fyok127' /*  MoQ */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Builder(
                                                                                                        builder: (context) {
                                                                                                          final itemParameters = widget.itemParameters?.dropdownValues.toList() ?? [];
                                                                                                          return Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                            children: List.generate(itemParameters.length, (itemParametersIndex) {
                                                                                                              final itemParametersItem = itemParameters[itemParametersIndex];
                                                                                                              return Container(
                                                                                                                width: 150.0,
                                                                                                                decoration: const BoxDecoration(),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      itemParametersItem,
                                                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                            fontFamily: 'Readex Pro',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 15.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              );
                                                                                                            }).divide(const SizedBox(width: 10.0)),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Builder(
                                                                                                        builder: (context) {
                                                                                                          final inventoryParameters = widget.inventoryParameters?.dropdownValues.toList() ?? [];
                                                                                                          return Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                            children: List.generate(inventoryParameters.length, (inventoryParametersIndex) {
                                                                                                              final inventoryParametersItem = inventoryParameters[inventoryParametersIndex];
                                                                                                              return Align(
                                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        inventoryParametersItem,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 15.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }).divide(const SizedBox(width: 10.0)),
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
                                                                                                      Container(
                                                                                                        width: 120.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'dy352nbf' /* Remark */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    Container(
                                                                                                      width: 180.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'nmqv8aan' /* Remarks */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'ewkf8hmg' /* Quality Remarks */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) {
                                                                                                final lotWiseInventory = containerLotWiseInventoryManagementRowList.toList();
                                                                                                return SingleChildScrollView(
                                                                                                  primary: false,
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: List.generate(lotWiseInventory.length, (lotWiseInventoryIndex) {
                                                                                                      final lotWiseInventoryItem = lotWiseInventory[lotWiseInventoryIndex];
                                                                                                      return Align(
                                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            borderRadius: const BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(5.0),
                                                                                                              bottomRight: Radius.circular(5.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerItemManagementRowList.where((e) => e.id == lotWiseInventoryItem.item).toList().first.itemCode,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerItemManagementRowList.where((e) => e.id == lotWiseInventoryItem.item).toList().first.itemName,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerItemManagementRowList.where((e) => e.id == lotWiseInventoryItem.item).toList().first.itemCategory,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerItemManagementRowList.where((e) => e.id == lotWiseInventoryItem.item).toList().first.measurementUnit,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        lotWiseInventoryItem.physicalQuantity.toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        lotWiseInventoryItem.lotNo,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        lotWiseInventoryItem.latestRatePerUnit.toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        functions.movingAvg(containerLotWiseInventoryManagementRowList.where((e) => e.item == lotWiseInventoryItem.item).toList().map((e) => e.physicalQuantity).toList(), containerLotWiseInventoryManagementRowList.where((e) => e.item == lotWiseInventoryItem.item).toList().map((e) => e.latestRatePerUnit).toList()).toStringAsFixed(2),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        (lotWiseInventoryItem.physicalQuantity * lotWiseInventoryItem.latestRatePerUnit).toStringAsFixed(2),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        lotWiseInventoryItem.allocatedQuantity.toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        (lotWiseInventoryItem.physicalQuantity - lotWiseInventoryItem.allocatedQuantity).toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerItemManagementRowList.where((e) => e.id == lotWiseInventoryItem.item).toList().first.minimumOrderQuantity.toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Builder(
                                                                                                                  builder: (context) {
                                                                                                                    final itemparameters = widget.itemParameters?.dropdownValues.toList() ?? [];
                                                                                                                    return Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: List.generate(itemparameters.length, (itemparametersIndex) {
                                                                                                                        final itemparametersItem = itemparameters[itemparametersIndex];
                                                                                                                        return Container(
                                                                                                                          width: 150.0,
                                                                                                                          decoration: const BoxDecoration(),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                functions.fetchValueFromJson(containerItemManagementRowList.where((e) => e.id == lotWiseInventoryItem.item).toList().first.parameters, itemparametersItem),
                                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ].divide(const SizedBox(height: 7.0)),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }).divide(const SizedBox(width: 10.0)),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                                Builder(
                                                                                                                  builder: (context) {
                                                                                                                    final inventoryparameters = widget.inventoryParameters?.dropdownValues.toList() ?? [];
                                                                                                                    return Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: List.generate(inventoryparameters.length, (inventoryparametersIndex) {
                                                                                                                        final inventoryparametersItem = inventoryparameters[inventoryparametersIndex];
                                                                                                                        return Container(
                                                                                                                          width: 150.0,
                                                                                                                          decoration: const BoxDecoration(),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                functions.fetchValueFromJson(lotWiseInventoryItem.inventoryParameters, inventoryparametersItem),
                                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ].divide(const SizedBox(height: 7.0)),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }).divide(const SizedBox(width: 10.0)),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 180.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: RemarksWidget(
                                                                                                                          key: Key('Keyo4t_${lotWiseInventoryIndex}_of_${lotWiseInventory.length}'),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Icon(
                                                                                                                        Icons.save_alt_sharp,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(width: 10.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Align(
                                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          lotWiseInventoryItem.qualityRemark,
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].addToStart(const SizedBox(width: 10.0)).addToEnd(const SizedBox(width: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (widget.authenticatedCompany?.inventoryCalculationMethod == 'Moving Average')
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                  child: SingleChildScrollView(
                                                                                    scrollDirection: Axis.horizontal,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                              child: Container(
                                                                                                height: 55.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                    topLeft: Radius.circular(12.0),
                                                                                                    topRight: Radius.circular(12.0),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'j1n22pb8' /* Item Code */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Align(
                                                                                                            alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'w5r1s5uj' /* Item Name */,
                                                                                                              ),
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
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '71rb00ig' /* Item Category */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'ttpomz1m' /* UoM */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'rwp2h0rt' /* Physical Quantity */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'z611jp19' /* Rate/UoM-Latest */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'zk6kg4w5' /* Rate/UoM-Moving Avg */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'fhaekmvg' /* Total Rate */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '5s1ll2f5' /* Allocated Quantity */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'eisuxv1l' /* Qty available for allocation */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'ib7nz7rs' /*  MoQ */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Builder(
                                                                                                        builder: (context) {
                                                                                                          final itemParameter = widget.itemParameters?.dropdownValues.toList() ?? [];
                                                                                                          return Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                            children: List.generate(itemParameter.length, (itemParameterIndex) {
                                                                                                              final itemParameterItem = itemParameter[itemParameterIndex];
                                                                                                              return Align(
                                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          itemParameterItem,
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
                                                                                                            }).divide(const SizedBox(width: 10.0)),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Builder(
                                                                                                        builder: (context) {
                                                                                                          final inventoryParameters = widget.inventoryParameters?.dropdownValues.toList() ?? [];
                                                                                                          return Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                            children: List.generate(inventoryParameters.length, (inventoryParametersIndex) {
                                                                                                              final inventoryParametersItem = inventoryParameters[inventoryParametersIndex];
                                                                                                              return Align(
                                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          inventoryParametersItem,
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
                                                                                                            }).divide(const SizedBox(width: 10.0)),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                    if (responsiveVisibility(
                                                                                                      context: context,
                                                                                                      tabletLandscape: false,
                                                                                                      desktop: false,
                                                                                                    ))
                                                                                                      Container(
                                                                                                        width: 120.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'dkna8oa6' /* Remarks */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    Container(
                                                                                                      width: 180.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '8iee4pvf' /* Remark */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 120.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'fubr1p4l' /* Quality Remark */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) {
                                                                                                final movingAverageInventory = containerMovingAverageInventoryManagementRowList.toList();
                                                                                                return SingleChildScrollView(
                                                                                                  primary: false,
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: List.generate(movingAverageInventory.length, (movingAverageInventoryIndex) {
                                                                                                      final movingAverageInventoryItem = movingAverageInventory[movingAverageInventoryIndex];
                                                                                                      return Align(
                                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            borderRadius: const BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(5.0),
                                                                                                              bottomRight: Radius.circular(5.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerItemManagementRowList.where((e) => e.id == movingAverageInventoryItem.item).toList().first.itemCode,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerItemManagementRowList.where((e) => e.id == movingAverageInventoryItem.item).toList().first.itemName,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerItemManagementRowList.where((e) => e.id == movingAverageInventoryItem.item).toList().first.itemCategory,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerItemManagementRowList.where((e) => e.id == movingAverageInventoryItem.item).toList().first.measurementUnit,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        movingAverageInventoryItem.physicalQuantity.toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        movingAverageInventoryItem.lotWiseRatePerUnit.toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        movingAverageInventoryItem.movingAverageRatePerUnit.toStringAsFixed(2),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        (movingAverageInventoryItem.physicalQuantity * movingAverageInventoryItem.movingAverageRatePerUnit).toStringAsFixed(2),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        movingAverageInventoryItem.allocatedQuantity.toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        (movingAverageInventoryItem.physicalQuantity - movingAverageInventoryItem.allocatedQuantity).toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerItemManagementRowList.where((e) => e.id == movingAverageInventoryItem.item).toList().first.minimumOrderQuantity.toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Builder(
                                                                                                                  builder: (context) {
                                                                                                                    final itemparameter = widget.itemParameters?.dropdownValues.toList() ?? [];
                                                                                                                    return Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: List.generate(itemparameter.length, (itemparameterIndex) {
                                                                                                                        final itemparameterItem = itemparameter[itemparameterIndex];
                                                                                                                        return Container(
                                                                                                                          width: 150.0,
                                                                                                                          decoration: const BoxDecoration(),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                functions.fetchValueFromJson(containerItemManagementRowList.where((e) => e.id == movingAverageInventoryItem.item).toList().first.parameters, itemparameterItem),
                                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ].divide(const SizedBox(height: 7.0)),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }).divide(const SizedBox(width: 10.0)),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                                Builder(
                                                                                                                  builder: (context) {
                                                                                                                    final inventoryparameter = widget.inventoryParameters?.dropdownValues.toList() ?? [];
                                                                                                                    return Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: List.generate(inventoryparameter.length, (inventoryparameterIndex) {
                                                                                                                        final inventoryparameterItem = inventoryparameter[inventoryparameterIndex];
                                                                                                                        return Container(
                                                                                                                          width: 150.0,
                                                                                                                          decoration: const BoxDecoration(),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                functions.fetchValueFromJson(movingAverageInventoryItem.inventoryParameters, inventoryparameterItem),
                                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      fontSize: 14.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ].divide(const SizedBox(height: 7.0)),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }).divide(const SizedBox(width: 10.0)),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                                if (responsiveVisibility(
                                                                                                                  context: context,
                                                                                                                  phone: false,
                                                                                                                  tablet: false,
                                                                                                                  tabletLandscape: false,
                                                                                                                  desktop: false,
                                                                                                                ))
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          movingAverageInventoryItem.remark,
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                Container(
                                                                                                                  width: 180.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: RemarksWidget(
                                                                                                                          key: Key('Keyuhb_${movingAverageInventoryIndex}_of_${movingAverageInventory.length}'),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Icon(
                                                                                                                        Icons.save_alt_sharp,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(width: 10.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 120.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        movingAverageInventoryItem.qualityRemark,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ].divide(const SizedBox(height: 7.0)),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].addToStart(const SizedBox(width: 10.0)).addToEnd(const SizedBox(width: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ].divide(const SizedBox(height: 10.0)).addToStart(const SizedBox(height: 20.0)).addToEnd(const SizedBox(height: 20.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      KeepAliveWidgetWrapper(
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Builder(
                                                                                        builder: (context) => FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (dialogContext) {
                                                                                                return Dialog(
                                                                                                  elevation: 0,
                                                                                                  insetPadding: EdgeInsets.zero,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                    child: DefineParameterInventoryCopyWidget(
                                                                                                      authenticatedUser: widget.authenticatedUser!,
                                                                                                      authenticatedCompany: widget.authenticatedCompany!,
                                                                                                      authenticatedCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                                      dropdown: widget.authenticatedCompanyDropdown!.where((e) => (e.module == 'Inventory') && (e.dropdownName == 'Inventory Parameter')).toList().first,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() {}));
                                                                                          },
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            '00esr4li' /* Add Parameter */,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 40.0,
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  color: Colors.white,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            elevation: 3.0,
                                                                                            borderSide: const BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            setState(() {
                                                                                              FFAppState().ineventoryParameters = [];
                                                                                              FFAppState().item = [];
                                                                                            });

                                                                                            context.pushNamed(
                                                                                              'CreateOutwardMaterial',
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
                                                                                                'outwardType': serializeParam(
                                                                                                  widget.authenticatedCompanyDropdown?.where((e) => (e.module == 'Inventory') && (e.dropdownName == 'Outward Material - Outward Type')).toList().first,
                                                                                                  ParamType.SupabaseRow,
                                                                                                ),
                                                                                                'outwardLocation': serializeParam(
                                                                                                  widget.authenticatedCompanyDropdown?.where((e) => (e.module == 'Inventory') && (e.dropdownName == 'Outward Material - Outward Location')).toList().first,
                                                                                                  ParamType.SupabaseRow,
                                                                                                ),
                                                                                                'outwardNo': serializeParam(
                                                                                                  (containerOutwardInventoryManagementRowList.length + 1).toString(),
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                                'approvalUser': serializeParam(
                                                                                                  containerUserManagementRowList.where((e) => e.id == containerApprovalUserRowList.where((e) => e.processName == 'Inventory Outward').toList().first.user).toList().first,
                                                                                                  ParamType.SupabaseRow,
                                                                                                ),
                                                                                                'itemMasterParameters': serializeParam(
                                                                                                  widget.itemParameters,
                                                                                                  ParamType.SupabaseRow,
                                                                                                ),
                                                                                                'inventoryParameters': serializeParam(
                                                                                                  widget.inventoryParameters,
                                                                                                  ParamType.SupabaseRow,
                                                                                                ),
                                                                                                'issueTo': serializeParam(
                                                                                                  widget.authenticatedCompanyDropdown?.where((e) => (e.module == 'Inventory') && (e.dropdownName == 'Outward Material - Issue To')).toList().first,
                                                                                                  ParamType.SupabaseRow,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                              extra: <String, dynamic>{
                                                                                                kTransitionInfoKey: const TransitionInfo(
                                                                                                  hasTransition: true,
                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                  duration: Duration(milliseconds: 0),
                                                                                                ),
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'fllqvf94' /* New */,
                                                                                          ),
                                                                                          icon: const Icon(
                                                                                            Icons.add,
                                                                                            size: 15.0,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 40.0,
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  color: Colors.white,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            elevation: 3.0,
                                                                                            borderSide: const BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(const SizedBox(width: 10.0)),
                                                                                ),
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                  child: Wrap(
                                                                                    spacing: 10.0,
                                                                                    runSpacing: 10.0,
                                                                                    alignment: WrapAlignment.start,
                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                    direction: Axis.horizontal,
                                                                                    runAlignment: WrapAlignment.start,
                                                                                    verticalDirection: VerticalDirection.down,
                                                                                    clipBehavior: Clip.none,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'eal6ri3a' /* Assign Approvals To : */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Readex Pro',
                                                                                                    letterSpacing: 0.0,
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
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                          child: AssignUserCopyWidget(
                                                                                                            authenticatedUser: widget.authenticatedUser!,
                                                                                                            authenticatedCompany: widget.authenticatedCompany!,
                                                                                                            authenticatetdCompanyDropdown: widget.authenticatedCompanyDropdown!,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 200.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Container(
                                                                                                    decoration: const BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            containerUserManagementRowList.where((e) => e.id == containerApprovalUserRowList.where((e) => e.processName == 'Inventory Outward').toList().first.user).toList().first.fullName,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            containerUserManagementRowList.where((e) => e.id == containerApprovalUserRowList.where((e) => e.processName == 'Inventory Outward').toList().first.user).toList().first.email,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(const SizedBox(height: 5.0)).around(const SizedBox(height: 5.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: FlutterFlowChoiceChips(
                                                                                          options: [
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              'jnwhkdzq' /* Assigned To Me */,
                                                                                            )),
                                                                                            ChipData(FFLocalizations.of(context).getText(
                                                                                              '3yjexpiv' /* All */,
                                                                                            ))
                                                                                          ],
                                                                                          onChanged: (val) => setState(() => _model.outwardChoiceChipsValue = val?.firstOrNull),
                                                                                          selectedChipStyle: ChipStyle(
                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent1,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 17.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            iconSize: 18.0,
                                                                                            labelPadding: const EdgeInsets.all(5.0),
                                                                                            elevation: 0.0,
                                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                                          ),
                                                                                          unselectedChipStyle: ChipStyle(
                                                                                            backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            iconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            iconSize: 18.0,
                                                                                            labelPadding: const EdgeInsets.all(5.0),
                                                                                            elevation: 0.0,
                                                                                            borderRadius: BorderRadius.circular(4.0),
                                                                                          ),
                                                                                          chipSpacing: 18.0,
                                                                                          rowSpacing: 12.0,
                                                                                          multiselect: false,
                                                                                          initialized: _model.outwardChoiceChipsValue != null,
                                                                                          alignment: WrapAlignment.start,
                                                                                          controller: _model.outwardChoiceChipsValueController ??= FormFieldController<List<String>>(
                                                                                            [
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'el2yj7q9' /* All */,
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                          wrapped: false,
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
                                                                                  desktop: false,
                                                                                ))
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Container(
                                                                                                  height: 50.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                                    borderRadius: const BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(16.0),
                                                                                                      topRight: Radius.circular(16.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 150.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'pmsep82s' /* Item Details */,
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
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '8wubfwzr' /* Item Category */,
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
                                                                                                          width: 120.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    '717ncvxm' /* UoM */,
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
                                                                                                          width: 100.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'vqq5gurx' /* Required Qty
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
                                                                                                        if (responsiveVisibility(
                                                                                                          context: context,
                                                                                                          phone: false,
                                                                                                          tablet: false,
                                                                                                          tabletLandscape: false,
                                                                                                          desktop: false,
                                                                                                        ))
                                                                                                          Container(
                                                                                                            width: 100.0,
                                                                                                            decoration: const BoxDecoration(),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    '5wqbqcw5' /* Purchase Quantity */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Readex Pro',
                                                                                                                        letterSpacing: 0.0,
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
                                                                                                          desktop: false,
                                                                                                        ))
                                                                                                          Container(
                                                                                                            width: 100.0,
                                                                                                            decoration: const BoxDecoration(),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    '453m5iap' /* Issued Quantity */,
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
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'dzq7n66d' /* Lot No */,
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
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'to593n41' /* Received Quantity */,
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
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'z0dgzkzl' /* Remarks */,
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
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '2unumqvz' /* rate/unit */,
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
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '2c7k8hnq' /* QR Verified */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Builder(
                                                                                                builder: (context) {
                                                                                                  final item = FFAppState().item.toList();
                                                                                                  return SingleChildScrollView(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: List.generate(item.length, (itemIndex) {
                                                                                                        final itemItem = item[itemIndex];
                                                                                                        return Container(
                                                                                                          constraints: const BoxConstraints(
                                                                                                            minHeight: 50.0,
                                                                                                          ),
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 150.0,
                                                                                                                decoration: const BoxDecoration(),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      containerItemManagementRowList.where((e) => e.id == itemItem.itemId).toList().first.itemCode,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Readex Pro',
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      containerItemManagementRowList.where((e) => e.id == itemItem.itemId).toList().first.itemName,
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
                                                                                                                decoration: const BoxDecoration(),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      containerItemManagementRowList.where((e) => e.id == itemItem.itemId).toList().first.itemCategory,
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
                                                                                                                decoration: const BoxDecoration(),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      containerItemManagementRowList.where((e) => e.id == itemItem.itemId).toList().first.measurementUnit,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Readex Pro',
                                                                                                                            letterSpacing: 0.0,
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
                                                                                                                desktop: false,
                                                                                                              ))
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          'vyx1dzvh' /* 10 */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              letterSpacing: 0.0,
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
                                                                                                                desktop: false,
                                                                                                              ))
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          'nl1s8wyv' /* 100 */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Readex Pro',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              Align(
                                                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Align(
                                                                                                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Container(
                                                                                                                          decoration: const BoxDecoration(),
                                                                                                                          child: Align(
                                                                                                                            alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                            child: wrapWithModel(
                                                                                                                              model: _model.itemparameter1Models.getModel(
                                                                                                                                itemItem.itemId.toString(),
                                                                                                                                itemIndex,
                                                                                                                              ),
                                                                                                                              updateCallback: () => setState(() {}),
                                                                                                                              child: ItemparameterWidget(
                                                                                                                                key: Key(
                                                                                                                                  'Key4al_${itemItem.itemId.toString()}',
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
                                                                                                                decoration: const BoxDecoration(),
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
                                                                                                                decoration: const BoxDecoration(),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: wrapWithModel(
                                                                                                                        model: _model.itemparameter2Models.getModel(
                                                                                                                          itemItem.itemId.toString(),
                                                                                                                          itemIndex,
                                                                                                                        ),
                                                                                                                        updateCallback: () => setState(() {}),
                                                                                                                        child: ItemparameterWidget(
                                                                                                                          key: Key(
                                                                                                                            'Key4t2_${itemItem.itemId.toString()}',
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
                                                                                                                decoration: const BoxDecoration(),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Align(
                                                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                        child: wrapWithModel(
                                                                                                                          model: _model.itemparameter3Models1.getModel(
                                                                                                                            itemItem.itemId.toString(),
                                                                                                                            itemIndex,
                                                                                                                          ),
                                                                                                                          updateCallback: () => setState(() {}),
                                                                                                                          child: ItemparameterWidget(
                                                                                                                            key: Key(
                                                                                                                              'Keym41_${itemItem.itemId.toString()}',
                                                                                                                            ),
                                                                                                                            value: itemItem.remark,
                                                                                                                            readOnly: itemItem.qrVerified,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              Container(
                                                                                                                width: 120.0,
                                                                                                                decoration: const BoxDecoration(),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: wrapWithModel(
                                                                                                                        model: _model.itemparameter3Models2.getModel(
                                                                                                                          itemItem.itemId.toString(),
                                                                                                                          itemIndex,
                                                                                                                        ),
                                                                                                                        updateCallback: () => setState(() {}),
                                                                                                                        child: ItemparameterWidget(
                                                                                                                          key: Key(
                                                                                                                            'Key386_${itemItem.itemId.toString()}',
                                                                                                                          ),
                                                                                                                          value: itemItem.rate.toString(),
                                                                                                                          readOnly: false,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              Container(
                                                                                                                width: 120.0,
                                                                                                                decoration: const BoxDecoration(),
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
                                                                                                            ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                          ),
                                                                                                        );
                                                                                                      }),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (_model.outwardChoiceChipsValue == 'All')
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          SingleChildScrollView(
                                                                                            primary: false,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: Container(
                                                                                                    height: 55.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                                        bottomRight: Radius.circular(0.0),
                                                                                                        topLeft: Radius.circular(12.0),
                                                                                                        topRight: Radius.circular(12.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'frxtl6y8' /* Outward No. */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 130.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '5zrri4yr' /* Outward Details */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'wb81py9q' /* Type */,
                                                                                                                  ),
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
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'e4beexfo' /* Location */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'rt3hb5se' /* Material Received from */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'jfrcav8x' /* Reference Number */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'gkjlhpjf' /* Remarks */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'hqrugiym' /* Report conclusion */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SingleChildScrollView(
                                                                                                  primary: false,
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Container(
                                                                                                          constraints: const BoxConstraints(
                                                                                                            minHeight: 70.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            borderRadius: const BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(5.0),
                                                                                                              bottomRight: Radius.circular(5.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                setState(() {
                                                                                                                  _model.desktopChoiceChipsValueController?.value = ['All'];
                                                                                                                });

                                                                                                                context.pushNamed(
                                                                                                                  'ViewOutward',
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
                                                                                                                    'itemParameter': serializeParam(
                                                                                                                      widget.itemParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                    'inventoryParameter': serializeParam(
                                                                                                                      widget.inventoryParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Align(
                                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'q46cz7m4' /* 1 */,
                                                                                                                            ),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 130.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'q4fl83c1' /* Rajesh Nair */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'r26hbsrm' /* 23 Jan 2024 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'aauu7pjd' /* Purchase Return */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'vpw37h0k' /* Mumbai */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '2jyr63dz' /* Mamta */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'xmol5mx6' /* 3210795 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '7yu7f429' /*   */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '5he5zkew' /* Approved */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Container(
                                                                                                          constraints: const BoxConstraints(
                                                                                                            minHeight: 70.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            borderRadius: const BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(5.0),
                                                                                                              bottomRight: Radius.circular(5.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                setState(() {
                                                                                                                  _model.desktopChoiceChipsValueController?.value = ['Assigned To Me'];
                                                                                                                });

                                                                                                                context.pushNamed(
                                                                                                                  'ApprovalOutward',
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
                                                                                                                    'itemParameter': serializeParam(
                                                                                                                      widget.itemParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                    'inventoryParameter': serializeParam(
                                                                                                                      widget.inventoryParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Align(
                                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'jcogehrz' /* 2 */,
                                                                                                                            ),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 130.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'seowuscl' /* Anmol Vidwans */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'wx2bxp5h' /* 6 Feb 2024 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'snc38cjj' /* Production Issue */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'zhj02zhl' /* Chennai */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'j9rdwyg0' /* Chambers */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            't9y2u6qk' /* 0954327 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'izqd0b3c' /*   */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'ekkr05tr' /* Send Back */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Container(
                                                                                                          constraints: const BoxConstraints(
                                                                                                            minHeight: 70.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            borderRadius: const BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(5.0),
                                                                                                              bottomRight: Radius.circular(5.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                setState(() {
                                                                                                                  _model.desktopChoiceChipsValueController?.value = ['Assigned To Me'];
                                                                                                                });

                                                                                                                context.pushNamed(
                                                                                                                  'ApprovalOutward',
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
                                                                                                                    'itemParameter': serializeParam(
                                                                                                                      widget.itemParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                    'inventoryParameter': serializeParam(
                                                                                                                      widget.inventoryParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Align(
                                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'l0lhi80f' /* 3 */,
                                                                                                                            ),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 130.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'be1dv7i2' /* Sumeet Pomani */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'uag2e43m' /* 17 Feb 2024 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '0ztsy4m1' /* Production Issue */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'ctyyrvy3' /* Pune */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'syab04fg' /* Kalpataru Ispat */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'kkxo8mha' /* 36910295 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'fof40tvi' /*   */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'hinc1297' /* Reject */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Container(
                                                                                                          constraints: const BoxConstraints(
                                                                                                            minHeight: 70.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            borderRadius: const BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(5.0),
                                                                                                              bottomRight: Radius.circular(5.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                setState(() {
                                                                                                                  _model.desktopChoiceChipsValueController?.value = ['Assigned To Me'];
                                                                                                                });

                                                                                                                context.pushNamed(
                                                                                                                  'ApprovalOutward',
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
                                                                                                                    'itemParameter': serializeParam(
                                                                                                                      widget.itemParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                    'inventoryParameter': serializeParam(
                                                                                                                      widget.inventoryParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Align(
                                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              '0jq1wnfo' /* 4 */,
                                                                                                                            ),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 130.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'mt44gxul' /* Yogesh Rane */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'ibw5dir6' /* 2 Mar 2024 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'octarbed' /* Purchase Return */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '18uae2tl' /* Bangalore */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'ke9wl1u5' /* Techno Tube */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'p8wgyrkn' /* 53894109 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '75esjvqi' /*   */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '35uqm8b9' /* Approved */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Container(
                                                                                                          constraints: const BoxConstraints(
                                                                                                            minHeight: 70.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            borderRadius: const BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(5.0),
                                                                                                              bottomRight: Radius.circular(5.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                setState(() {
                                                                                                                  _model.desktopChoiceChipsValueController?.value = ['Assigned To Me'];
                                                                                                                });

                                                                                                                context.pushNamed(
                                                                                                                  'ApprovalOutward',
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
                                                                                                                    'itemParameter': serializeParam(
                                                                                                                      widget.itemParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                    'inventoryParameter': serializeParam(
                                                                                                                      widget.inventoryParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Align(
                                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              '7xjt3hni' /* 5 */,
                                                                                                                            ),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 130.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'vev34pn0' /* Suresh B V */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'iky7a2l1' /* 20 Mar 2024 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'nbck7d6g' /* Sales */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'yc90i1i1' /* Mumbai */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'bxxfpegh' /* Agrasen Ispat */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'v74y1vf3' /* 9365410 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'hnl89yxx' /*   */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'm0yq32j6' /* Approved */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                              ),
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
                                                                                        ].addToStart(const SizedBox(width: 10.0)).addToEnd(const SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (_model.outwardChoiceChipsValue == 'Assigned To Me')
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          SingleChildScrollView(
                                                                                            primary: false,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: Container(
                                                                                                    height: 55.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                                        bottomRight: Radius.circular(0.0),
                                                                                                        topLeft: Radius.circular(12.0),
                                                                                                        topRight: Radius.circular(12.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '6dpslnoi' /* Outward No. */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 130.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'amq6zg2r' /* Outward Details */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'ohcfgr5t' /* Type */,
                                                                                                                  ),
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
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'xs7fquvi' /* Location */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'fmgz6vng' /* Material Received from */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'co2b6pmc' /* Reference Number */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '34l73uqc' /* Remarks */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '3gkjs3qm' /* Report conclusion */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SingleChildScrollView(
                                                                                                  primary: false,
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Container(
                                                                                                          constraints: const BoxConstraints(
                                                                                                            minHeight: 70.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            borderRadius: const BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(5.0),
                                                                                                              bottomRight: Radius.circular(5.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                setState(() {
                                                                                                                  _model.desktopChoiceChipsValueController?.value = ['Assigned To Me'];
                                                                                                                });

                                                                                                                context.pushNamed(
                                                                                                                  'ApprovalOutward',
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
                                                                                                                    'itemParameter': serializeParam(
                                                                                                                      widget.itemParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                    'inventoryParameter': serializeParam(
                                                                                                                      widget.inventoryParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Align(
                                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              '0x9kyxpr' /* 6 */,
                                                                                                                            ),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 130.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'xcyboe4k' /* Rajesh Nair */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'x2bilcok' /* 23 Jan 2024 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'co9rk75w' /* Purchase Return */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'zw4s4bqj' /* Mumbai */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'mvsb03gz' /* Mamta */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'lihypwsn' /* 3210795 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'gkhgc4z9' /*   */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'nk9lomdq' /* Approved */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Container(
                                                                                                          constraints: const BoxConstraints(
                                                                                                            minHeight: 70.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            borderRadius: const BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(5.0),
                                                                                                              bottomRight: Radius.circular(5.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                setState(() {
                                                                                                                  _model.desktopChoiceChipsValueController?.value = ['Assigned To Me'];
                                                                                                                });

                                                                                                                context.pushNamed(
                                                                                                                  'ApprovalOutward',
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
                                                                                                                    'itemParameter': serializeParam(
                                                                                                                      widget.itemParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                    'inventoryParameter': serializeParam(
                                                                                                                      widget.inventoryParameters,
                                                                                                                      ParamType.SupabaseRow,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Align(
                                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'p64r5h49' /* 4 */,
                                                                                                                            ),
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  fontSize: 18.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 130.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'ujx5jzti' /* Yogesh Rane */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'u6qoceyf' /* 2 Mar 2024 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '8imgibkq' /* Purchase Return */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '33nrm34v' /* Bangalore */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 120.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '11th45lv' /* Techno Tube */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'u39mp0je' /* 53894109 */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'wnjas2ob' /*   */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 100.0,
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            's82tz4rw' /* Approved */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(const SizedBox(height: 7.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                                                                                                              ),
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
                                                                                        ].addToStart(const SizedBox(width: 10.0)).addToEnd(const SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ].divide(const SizedBox(height: 20.0)).around(const SizedBox(height: 20.0)),
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
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
