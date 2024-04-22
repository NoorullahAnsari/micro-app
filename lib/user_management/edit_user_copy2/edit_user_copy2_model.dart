import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_user_copy2_widget.dart' show EditUserCopy2Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditUserCopy2Model extends FlutterFlowModel<EditUserCopy2Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  String? _fullnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '23pp6vim' /* Field is required */,
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
