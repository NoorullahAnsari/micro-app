import '/flutter_flow/flutter_flow_util.dart';
import 'edit_dropdown_values_widget.dart' show EditDropdownValuesWidget;
import 'package:flutter/material.dart';

class EditDropdownValuesModel
    extends FlutterFlowModel<EditDropdownValuesWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dropdownname widget.
  FocusNode? dropdownnameFocusNode;
  TextEditingController? dropdownnameTextController;
  String? Function(BuildContext, String?)? dropdownnameTextControllerValidator;
  String? _dropdownnameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'feicv4gy' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {
    dropdownnameTextControllerValidator = _dropdownnameTextControllerValidator;
  }

  @override
  void dispose() {
    dropdownnameFocusNode?.dispose();
    dropdownnameTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }
}
