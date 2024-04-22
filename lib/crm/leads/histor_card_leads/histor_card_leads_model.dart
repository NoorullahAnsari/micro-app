import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'histor_card_leads_widget.dart' show HistorCardLeadsWidget;
import 'package:flutter/material.dart';

class HistorCardLeadsModel extends FlutterFlowModel<HistorCardLeadsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
