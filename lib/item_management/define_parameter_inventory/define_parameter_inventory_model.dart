import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/item_management/dropdown_values/dropdown_values_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'define_parameter_inventory_widget.dart'
    show DefineParameterInventoryWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DefineParameterInventoryModel
    extends FlutterFlowModel<DefineParameterInventoryWidget> {
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
