import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_company_widget.dart' show EditCompanyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class EditCompanyModel extends FlutterFlowModel<EditCompanyWidget> {
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
        'xzrza44b' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for defaultpassword widget.
  FocusNode? defaultpasswordFocusNode;
  TextEditingController? defaultpasswordTextController;
  String? Function(BuildContext, String?)?
      defaultpasswordTextControllerValidator;
  String? _defaultpasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e76obsou' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  List<String> simpleSearchResults = [];
  // State field(s) for CheckboxListTile widget.

  Map<String, bool> checkboxListTileValueMap1 = {};
  List<String> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboxListTile widget.

  Map<String, bool> checkboxListTileValueMap2 = {};
  List<String> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {
    companynameTextControllerValidator = _companynameTextControllerValidator;
    defaultpasswordTextControllerValidator =
        _defaultpasswordTextControllerValidator;
  }

  @override
  void dispose() {
    companynameFocusNode?.dispose();
    companynameTextController?.dispose();

    defaultpasswordFocusNode?.dispose();
    defaultpasswordTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
