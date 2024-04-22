import '/flutter_flow/flutter_flow_util.dart';
import 'lead_source_widget.dart' show LeadSourceWidget;
import 'package:flutter/material.dart';

class LeadSourceModel extends FlutterFlowModel<LeadSourceWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
