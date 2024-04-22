import '/flutter_flow/flutter_flow_util.dart';
import 'contact_reference_from_widget.dart' show ContactReferenceFromWidget;
import 'package:flutter/material.dart';

class ContactReferenceFromModel
    extends FlutterFlowModel<ContactReferenceFromWidget> {
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
