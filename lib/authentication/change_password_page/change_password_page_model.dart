import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_page_widget.dart' show ChangePasswordPageWidget;
import 'package:flutter/material.dart';

class ChangePasswordPageModel
    extends FlutterFlowModel<ChangePasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for newpassword widget.
  FocusNode? newpasswordFocusNode;
  TextEditingController? newpasswordTextController;
  String? Function(BuildContext, String?)? newpasswordTextControllerValidator;
  String? _newpasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ahb6g3lr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for confirmpassword widget.
  FocusNode? confirmpasswordFocusNode;
  TextEditingController? confirmpasswordTextController;
  String? Function(BuildContext, String?)?
      confirmpasswordTextControllerValidator;
  String? _confirmpasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ydvdn6rr' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Login)] action in Button-Login widget.
  ApiCallResponse? user;
  // Stores action output result for [Backend Call - API (Update User)] action in Button-Login widget.
  ApiCallResponse? apiResultxuj;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button-Login widget.
  List<UserManagementRow>? newUser;

  @override
  void initState(BuildContext context) {
    newpasswordTextControllerValidator = _newpasswordTextControllerValidator;
    confirmpasswordTextControllerValidator =
        _confirmpasswordTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    newpasswordFocusNode?.dispose();
    newpasswordTextController?.dispose();

    confirmpasswordFocusNode?.dispose();
    confirmpasswordTextController?.dispose();
  }
}
