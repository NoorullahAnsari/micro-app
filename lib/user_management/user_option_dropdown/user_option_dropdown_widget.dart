import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'user_option_dropdown_model.dart';
export 'user_option_dropdown_model.dart';

class UserOptionDropdownWidget extends StatefulWidget {
  const UserOptionDropdownWidget({
    super.key,
    required this.value,
    required this.isUserModule,
    required this.authenticatedUser,
  });

  final String? value;
  final bool? isUserModule;
  final UserManagementRow? authenticatedUser;

  @override
  State<UserOptionDropdownWidget> createState() =>
      _UserOptionDropdownWidgetState();
}

class _UserOptionDropdownWidgetState extends State<UserOptionDropdownWidget> {
  late UserOptionDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserOptionDropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(
          _model.dropDownValue ??= widget.value,
        ),
        options: widget.isUserModule!
            ? (widget.authenticatedUser!.isSuperAdmin
                ? FFAppConstants.userManagementRolesFoSuperAdmin
                : FFAppConstants.userManagementRolesForAdmin)
            : (widget.authenticatedUser!.isSuperAdmin
                ? FFAppConstants.superAdminUserRoles
                : FFAppConstants.userRoles),
        onChanged: (val) => setState(() => _model.dropDownValue = val),
        height: 40.0,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0.0,
            ),
        hintText: FFLocalizations.of(context).getText(
          'hmmpb55h' /* Select Role.. */,
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
        margin: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        hidesUnderline: true,
        isOverButton: true,
        isSearchable: false,
        isMultiSelect: false,
      ),
    );
  }
}
