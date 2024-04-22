import '/flutter_flow/flutter_flow_util.dart';
import 'parameter_value_widget.dart' show ParameterValueWidget;
import 'package:flutter/material.dart';

class ParameterValueModel extends FlutterFlowModel<ParameterValueWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
