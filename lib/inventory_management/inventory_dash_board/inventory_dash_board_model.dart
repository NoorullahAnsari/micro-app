import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/remarks_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/inventory_management/assign_user/assign_user_widget.dart';
import '/inventory_management/assign_user_copy/assign_user_copy_widget.dart';
import '/inventory_management/define_parameter_inventory_copy/define_parameter_inventory_copy_widget.dart';
import '/item_management/itemparameter/itemparameter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'inventory_dash_board_widget.dart' show InventoryDashBoardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InventoryDashBoardModel
    extends FlutterFlowModel<InventoryDashBoardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DesktopChoiceChips widget.
  FormFieldController<List<String>>? desktopChoiceChipsValueController;
  String? get desktopChoiceChipsValue =>
      desktopChoiceChipsValueController?.value?.firstOrNull;
  set desktopChoiceChipsValue(String? val) =>
      desktopChoiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in Row widget.
  List<InwardInventoryTableManagementRow>? item;
  // State field(s) for OutwardChoiceChips widget.
  FormFieldController<List<String>>? outwardChoiceChipsValueController;
  String? get outwardChoiceChipsValue =>
      outwardChoiceChipsValueController?.value?.firstOrNull;
  set outwardChoiceChipsValue(String? val) =>
      outwardChoiceChipsValueController?.value = val != null ? [val] : [];
  // Models for itemparameter1.
  late FlutterFlowDynamicModels<ItemparameterModel> itemparameter1Models;
  // Models for itemparameter2.
  late FlutterFlowDynamicModels<ItemparameterModel> itemparameter2Models;
  // Models for itemparameter3.
  late FlutterFlowDynamicModels<ItemparameterModel> itemparameter3Models1;
  // Models for itemparameter3.
  late FlutterFlowDynamicModels<ItemparameterModel> itemparameter3Models2;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    itemparameter1Models = FlutterFlowDynamicModels(() => ItemparameterModel());
    itemparameter2Models = FlutterFlowDynamicModels(() => ItemparameterModel());
    itemparameter3Models1 =
        FlutterFlowDynamicModels(() => ItemparameterModel());
    itemparameter3Models2 =
        FlutterFlowDynamicModels(() => ItemparameterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    tabBarController?.dispose();
    itemparameter1Models.dispose();
    itemparameter2Models.dispose();
    itemparameter3Models1.dispose();
    itemparameter3Models2.dispose();
  }
}
