import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:text_search/text_search.dart';
import 'assign_user_copy_model.dart';
export 'assign_user_copy_model.dart';

class AssignUserCopyWidget extends StatefulWidget {
  const AssignUserCopyWidget({
    super.key,
    required this.authenticatedUser,
    required this.authenticatedCompany,
    required this.authenticatetdCompanyDropdown,
  });

  final UserManagementRow? authenticatedUser;
  final CompanyManagementRow? authenticatedCompany;
  final List<DropdownManagementRow>? authenticatetdCompanyDropdown;

  @override
  State<AssignUserCopyWidget> createState() => _AssignUserCopyWidgetState();
}

class _AssignUserCopyWidgetState extends State<AssignUserCopyWidget> {
  late AssignUserCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignUserCopyModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
        child: FutureBuilder<List<UserManagementRow>>(
          future: FFAppState().activeUsers(
            uniqueQueryKey: widget.authenticatedCompany?.id.toString(),
            requestFn: () => UserManagementTable().queryRows(
              queryFn: (q) => q
                  .eq(
                    'company',
                    widget.authenticatedCompany?.id,
                  )
                  .eq(
                    'status',
                    'Active',
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
            List<UserManagementRow> cardModalBasicUserManagementRowList =
                snapshot.data!;
            return Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 570.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: const Color(0xFFE0E3E7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'wjh5zn8s' /* Assign User */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: 30.0,
                            borderWidth: 2.0,
                            buttonSize: 44.0,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: 17.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'wbogpk01' /* Cancel */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 1.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  hoverTextColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {},
                                text: FFLocalizations.of(context).getText(
                                  'vm1ld7p4' /* Assign */,
                                ),
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                                  hoverColor: const Color(0xFF2B16ED),
                                  hoverTextColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    safeSetState(() {
                                      _model.simpleSearchResults = TextSearch(
                                              cardModalBasicUserManagementRowList
                                                  .map((e) => e.fullName)
                                                  .toList()
                                                  .map((str) =>
                                                      TextSearchItem.fromTerms(
                                                          str, [str]))
                                                  .toList())
                                          .search(_model.textController.text)
                                          .map((r) => r.object)
                                          .toList();
                                    });
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'xo31yvti' /* Search Users */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                maxLines: null,
                                minLines: 1,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if (_model.textController.text == '') {
                            return Builder(
                              builder: (context) {
                                final allUsers =
                                    cardModalBasicUserManagementRowList
                                        .map((e) => e)
                                        .toList();
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(allUsers.length,
                                            (allUsersIndex) {
                                      final allUsersItem =
                                          allUsers[allUsersIndex];
                                      return SizedBox(
                                        width: double.infinity,
                                        height: 70.0,
                                        child:
                                            custom_widgets.CustomProfileWidget(
                                          width: double.infinity,
                                          height: 70.0,
                                          name: allUsersItem.fullName,
                                          email: allUsersItem.email,
                                          onClick: () async {
                                            await ApprovalUserTable().update(
                                              data: {
                                                'user': allUsersItem.id,
                                              },
                                              matchingRows: (rows) => rows
                                                  .eq(
                                                    'company',
                                                    widget.authenticatedCompany
                                                        ?.id,
                                                  )
                                                  .eq(
                                                    'processName',
                                                    'Inventory Outward',
                                                  ),
                                            );
                                            FFAppState()
                                                .clearApprovalUsersCacheKey(
                                                    widget.authenticatedCompany
                                                        ?.id
                                                        .toString());
                                            Navigator.pop(context);
                                          },
                                        ),
                                      );
                                    })
                                        .divide(const SizedBox(height: 7.0))
                                        .around(const SizedBox(height: 7.0)),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Builder(
                              builder: (context) {
                                final searchUser =
                                    cardModalBasicUserManagementRowList
                                        .where((e) =>
                                            e.fullName ==
                                            _model.textController.text)
                                        .toList();
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(searchUser.length,
                                        (searchUserIndex) {
                                      final searchUserItem =
                                          searchUser[searchUserIndex];
                                      return SizedBox(
                                        width: double.infinity,
                                        height: 70.0,
                                        child:
                                            custom_widgets.CustomProfileWidget(
                                          width: double.infinity,
                                          height: 70.0,
                                          name: searchUserItem.fullName,
                                          email: searchUserItem.email,
                                          onClick: () async {
                                            await ApprovalUserTable().update(
                                              data: {
                                                'user': searchUserItem.id,
                                              },
                                              matchingRows: (rows) => rows
                                                  .eq(
                                                    'company',
                                                    widget.authenticatedCompany
                                                        ?.id,
                                                  )
                                                  .eq(
                                                    'processName',
                                                    'Inventory Outward',
                                                  ),
                                            );
                                            FFAppState()
                                                .clearApprovalUsersCacheKey(
                                                    widget.authenticatedCompany
                                                        ?.id
                                                        .toString());
                                            Navigator.pop(context);
                                          },
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
