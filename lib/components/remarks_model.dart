import '/flutter_flow/flutter_flow_util.dart';
import 'remarks_widget.dart' show RemarksWidget;
import 'package:flutter/material.dart';

class RemarksModel extends FlutterFlowModel<RemarksWidget> {
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
