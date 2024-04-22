import '/components/dropdown_values_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_master_parameter_widget.dart' show ItemMasterParameterWidget;
import 'package:flutter/material.dart';

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
