import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_dropdown_widget.dart' show EditDropdownWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditDropdownModel extends FlutterFlowModel<EditDropdownWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for primarymobileno widget.
  FocusNode? primarymobilenoFocusNode1;
  TextEditingController? primarymobilenoTextController1;
  String? Function(BuildContext, String?)?
      primarymobilenoTextController1Validator;
  String? _primarymobilenoTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'do4jnvo1' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for dropdownvalue widget.
  FocusNode? dropdownvalueFocusNode;
  TextEditingController? dropdownvalueTextController;
  String? Function(BuildContext, String?)? dropdownvalueTextControllerValidator;
  String? _dropdownvalueTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2xtef516' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for primarymobileno widget.
  FocusNode? primarymobilenoFocusNode2;
  TextEditingController? primarymobilenoTextController2;
  String? Function(BuildContext, String?)?
      primarymobilenoTextController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {
    primarymobilenoTextController1Validator =
        _primarymobilenoTextController1Validator;
    dropdownvalueTextControllerValidator =
        _dropdownvalueTextControllerValidator;
  }

  @override
  void dispose() {
    primarymobilenoFocusNode1?.dispose();
    primarymobilenoTextController1?.dispose();

    dropdownvalueFocusNode?.dispose();
    dropdownvalueTextController?.dispose();

    primarymobilenoFocusNode2?.dispose();
    primarymobilenoTextController2?.dispose();
  }
}
