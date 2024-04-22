import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/item_management/itemparameter/itemparameter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_item_widget.dart' show AddItemWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddItemModel extends FlutterFlowModel<AddItemWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for required widget.
  FocusNode? requiredFocusNode;
  TextEditingController? requiredTextController;
  String? Function(BuildContext, String?)? requiredTextControllerValidator;
  String? _requiredTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6rr8e4fu' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for received widget.
  FocusNode? receivedFocusNode;
  TextEditingController? receivedTextController;
  String? Function(BuildContext, String?)? receivedTextControllerValidator;
  String? _receivedTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ph4allvh' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for rateunit widget.
  FocusNode? rateunitFocusNode;
  TextEditingController? rateunitTextController;
  String? Function(BuildContext, String?)? rateunitTextControllerValidator;
  // State field(s) for lotno widget.
  FocusNode? lotnoFocusNode;
  TextEditingController? lotnoTextController;
  String? Function(BuildContext, String?)? lotnoTextControllerValidator;
  String? _lotnoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yg06err1' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Models for itemparameter dynamic component.
  late FlutterFlowDynamicModels<ItemparameterModel> itemparameterModels;

  @override
  void initState(BuildContext context) {
    requiredTextControllerValidator = _requiredTextControllerValidator;
    receivedTextControllerValidator = _receivedTextControllerValidator;
    lotnoTextControllerValidator = _lotnoTextControllerValidator;
    itemparameterModels = FlutterFlowDynamicModels(() => ItemparameterModel());
  }

  @override
  void dispose() {
    requiredFocusNode?.dispose();
    requiredTextController?.dispose();

    receivedFocusNode?.dispose();
    receivedTextController?.dispose();

    rateunitFocusNode?.dispose();
    rateunitTextController?.dispose();

    lotnoFocusNode?.dispose();
    lotnoTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();

    itemparameterModels.dispose();
  }
}
