import '/company_management/edit_company/edit_company_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'view_company_widget.dart' show ViewCompanyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewCompanyModel extends FlutterFlowModel<ViewCompanyWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for companyname widget.
  FocusNode? companynameFocusNode;
  TextEditingController? companynameTextController;
  String? Function(BuildContext, String?)? companynameTextControllerValidator;
  String? _companynameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4zgda67i' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for defaultpassword widget.
  FocusNode? defaultpasswordFocusNode1;
  TextEditingController? defaultpasswordTextController1;
  String? Function(BuildContext, String?)?
      defaultpasswordTextController1Validator;
  // State field(s) for defaultpassword widget.
  FocusNode? defaultpasswordFocusNode2;
  TextEditingController? defaultpasswordTextController2;
  String? Function(BuildContext, String?)?
      defaultpasswordTextController2Validator;

  @override
  void initState(BuildContext context) {
    companynameTextControllerValidator = _companynameTextControllerValidator;
  }

  @override
  void dispose() {
    companynameFocusNode?.dispose();
    companynameTextController?.dispose();

    defaultpasswordFocusNode1?.dispose();
    defaultpasswordTextController1?.dispose();

    defaultpasswordFocusNode2?.dispose();
    defaultpasswordTextController2?.dispose();
  }
}
