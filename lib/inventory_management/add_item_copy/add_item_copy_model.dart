import '/flutter_flow/flutter_flow_util.dart';
import '/item_management/itemparameter/itemparameter_widget.dart';
import 'add_item_copy_widget.dart' show AddItemCopyWidget;
import 'package:flutter/material.dart';

class AddItemCopyModel extends FlutterFlowModel<AddItemCopyWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Models for itemparameter dynamic component.
  late FlutterFlowDynamicModels<ItemparameterModel> itemparameterModels;
  // State field(s) for required widget.
  FocusNode? requiredFocusNode;
  TextEditingController? requiredTextController;
  String? Function(BuildContext, String?)? requiredTextControllerValidator;
  String? _requiredTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'a6wv4k68' /* Field is required */,
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
        'e8uuapwm' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {
    itemparameterModels = FlutterFlowDynamicModels(() => ItemparameterModel());
    requiredTextControllerValidator = _requiredTextControllerValidator;
    receivedTextControllerValidator = _receivedTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    itemparameterModels.dispose();
    requiredFocusNode?.dispose();
    requiredTextController?.dispose();

    receivedFocusNode?.dispose();
    receivedTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController4?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();

    textFieldFocusNode4?.dispose();
    textController6?.dispose();
  }
}
