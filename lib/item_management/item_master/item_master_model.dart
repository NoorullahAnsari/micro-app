import '/backend/supabase/supabase.dart';
import '/components/empty_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/item_management/create_item/create_item_widget.dart';
import '/item_management/define_parameter_inventory/define_parameter_inventory_widget.dart';
import '/item_management/delete_option_copy3/delete_option_copy3_widget.dart';
import '/item_management/edit_item/edit_item_widget.dart';
import '/item_management/view_item/view_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'item_master_widget.dart' show ItemMasterWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemMasterModel extends FlutterFlowModel<ItemMasterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<ItemManagementRow>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<ItemManagementRow>();

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
  }
}
