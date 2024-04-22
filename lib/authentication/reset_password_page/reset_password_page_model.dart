import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reset_password_page_widget.dart' show ResetPasswordPageWidget;
import 'package:flutter/material.dart';

class ResetPasswordPageModel extends FlutterFlowModel<ResetPasswordPageWidget> {
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
        '8zm1etdx' /* Field is required */,
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
        'q4g4wnlc' /* Field is required */,
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
