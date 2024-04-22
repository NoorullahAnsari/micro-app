import '/flutter_flow/flutter_flow_util.dart';
import 'assign_user_widget.dart' show AssignUserWidget;
import 'package:flutter/material.dart';

class AssignUserModel extends FlutterFlowModel<AssignUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
