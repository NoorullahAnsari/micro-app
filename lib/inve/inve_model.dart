import '/flutter_flow/flutter_flow_util.dart';
import 'inve_widget.dart' show InveWidget;
import 'package:flutter/material.dart';

class InveModel extends FlutterFlowModel<InveWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
