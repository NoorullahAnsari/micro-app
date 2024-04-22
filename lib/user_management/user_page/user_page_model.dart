import '/backend/supabase/supabase.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_management/create_user/create_user_widget.dart';
import '/user_management/create_user_copy/create_user_copy_widget.dart';
import '/user_management/delete_option_copy2/delete_option_copy2_widget.dart';
import '/user_management/delete_option_copy_copy/delete_option_copy_copy_widget.dart';
import '/user_management/edit_user/edit_user_widget.dart';
import '/user_management/edit_user_copy/edit_user_copy_widget.dart';
import '/user_management/view_user/view_user_widget.dart';
import 'user_page_widget.dart' show UserPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserPageModel extends FlutterFlowModel<UserPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UserManagementRow>();

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
