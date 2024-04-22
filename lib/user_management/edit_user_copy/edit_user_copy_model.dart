import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_management/user_option_dropdown/user_option_dropdown_widget.dart';
import 'edit_user_copy_widget.dart' show EditUserCopyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditUserCopyModel extends FlutterFlowModel<EditUserCopyWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  String? _fullnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bbr9kfjs' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for primarymobileno widget.
  FocusNode? primarymobilenoFocusNode;
  TextEditingController? primarymobilenoTextController;
  String? Function(BuildContext, String?)?
      primarymobilenoTextControllerValidator;
  // State field(s) for emailid widget.
  FocusNode? emailidFocusNode;
  TextEditingController? emailidTextController;
  String? Function(BuildContext, String?)? emailidTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController = FlutterFlowDataTableController<String>();
  // Models for UserOptionDropdown dynamic component.
  late FlutterFlowDynamicModels<UserOptionDropdownModel>
      userOptionDropdownModels;

  @override
  void initState(BuildContext context) {
    fullnameTextControllerValidator = _fullnameTextControllerValidator;
    userOptionDropdownModels =
        FlutterFlowDynamicModels(() => UserOptionDropdownModel());
  }

  @override
  void dispose() {
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    primarymobilenoFocusNode?.dispose();
    primarymobilenoTextController?.dispose();

    emailidFocusNode?.dispose();
    emailidTextController?.dispose();

    userOptionDropdownModels.dispose();
  }
}
