import '/backend/supabase/supabase.dart';
import '/components/dropdown_values_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/item_management/define_parameter_inventory/define_parameter_inventory_widget.dart';
import 'item_master_parameter_widget.dart' show ItemMasterParameterWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemMasterParameterModel
    extends FlutterFlowModel<ItemMasterParameterWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Models for dropdownValuesCopy dynamic component.
  late FlutterFlowDynamicModels<DropdownValuesCopyModel>
      dropdownValuesCopyModels;

  @override
  void initState(BuildContext context) {
    dropdownValuesCopyModels =
        FlutterFlowDynamicModels(() => DropdownValuesCopyModel());
  }

  @override
  void dispose() {
    dropdownValuesCopyModels.dispose();
  }
}
