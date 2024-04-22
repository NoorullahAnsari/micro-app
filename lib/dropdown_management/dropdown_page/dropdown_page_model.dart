import '/backend/supabase/supabase.dart';
import '/components/side_nav_widget.dart';
import '/dropdown_management/inward_material_inward_location/inward_material_inward_location_widget.dart';
import '/dropdown_management/inward_material_inward_type/inward_material_inward_type_widget.dart';
import '/dropdown_management/outward_material_issue_to/outward_material_issue_to_widget.dart';
import '/dropdown_management/outward_material_outward_type/outward_material_outward_type_widget.dart';
import '/dropdown_management/outward_material_outward_warehouse/outward_material_outward_warehouse_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dropdown_page_widget.dart' show DropdownPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DropdownPageModel extends FlutterFlowModel<DropdownPageWidget> {
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
