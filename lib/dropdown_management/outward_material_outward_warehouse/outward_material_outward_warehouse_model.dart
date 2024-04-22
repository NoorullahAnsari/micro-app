import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/item_management/dropdown_values/dropdown_values_widget.dart';
import 'outward_material_outward_warehouse_widget.dart'
    show OutwardMaterialOutwardWarehouseWidget;
import 'package:flutter/material.dart';

class OutwardMaterialOutwardWarehouseModel
    extends FlutterFlowModel<OutwardMaterialOutwardWarehouseWidget> {
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
