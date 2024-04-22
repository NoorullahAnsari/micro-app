import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/item_management/dropdown_values/dropdown_values_widget.dart';
import 'outward_material_issue_to_widget.dart'
    show OutwardMaterialIssueToWidget;
import 'package:flutter/material.dart';

class OutwardMaterialIssueToModel
    extends FlutterFlowModel<OutwardMaterialIssueToWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Models for dropdownValues dynamic component.
  late FlutterFlowDynamicModels<DropdownValuesModel> dropdownValuesModels;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DropdownManagementRow>? authenticatedCompanyDropdown;

  @override
  void initState(BuildContext context) {
    dropdownValuesModels =
        FlutterFlowDynamicModels(() => DropdownValuesModel());
  }

  @override
  void dispose() {
    dropdownValuesModels.dispose();
  }
}
