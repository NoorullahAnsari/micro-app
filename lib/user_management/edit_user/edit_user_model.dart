import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_user_widget.dart' show EditUserWidget;
import 'package:flutter/material.dart';

class EditUserModel extends FlutterFlowModel<EditUserWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  String? _fullnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5qqxf791' /* Field is required */,
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
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserManagementRow>? newUser;

  @override
  void initState(BuildContext context) {
    fullnameTextControllerValidator = _fullnameTextControllerValidator;
  }

  @override
  void dispose() {
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    primarymobilenoFocusNode?.dispose();
    primarymobilenoTextController?.dispose();

    emailidFocusNode?.dispose();
    emailidTextController?.dispose();
  }
}
