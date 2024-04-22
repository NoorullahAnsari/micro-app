import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_nav_widget.dart' show SideNavWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideNavModel extends FlutterFlowModel<SideNavWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for HomeMR widget.
  bool homeMRHovered = false;
  // State field(s) for CRMMR widget.
  bool crmmrHovered = false;
  // State field(s) for InventoryMR widget.
  bool inventoryMRHovered = false;
  // State field(s) for ItemMR widget.
  bool itemMRHovered = false;
  // State field(s) for UserMR widget.
  bool userMRHovered = false;
  // State field(s) for DropdownMR widget.
  bool dropdownMRHovered = false;
  // State field(s) for LogoutMR widget.
  bool logoutMRHovered = false;
  // State field(s) for CompanyMR widget.
  bool companyMRHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
