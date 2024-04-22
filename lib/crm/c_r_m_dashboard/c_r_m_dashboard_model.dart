import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'c_r_m_dashboard_widget.dart' show CRMDashboardWidget;
import 'package:flutter/material.dart';

class CRMDashboardModel extends FlutterFlowModel<CRMDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ContactMobileChoiceChips widget.
  FormFieldController<List<String>>? contactMobileChoiceChipsValueController;
  String? get contactMobileChoiceChipsValue =>
      contactMobileChoiceChipsValueController?.value?.firstOrNull;
  set contactMobileChoiceChipsValue(String? val) =>
      contactMobileChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<String>();
  // State field(s) for ContactDesktopChoiceChips widget.
  FormFieldController<List<String>>? contactDesktopChoiceChipsValueController;
  String? get contactDesktopChoiceChipsValue =>
      contactDesktopChoiceChipsValueController?.value?.firstOrNull;
  set contactDesktopChoiceChipsValue(String? val) =>
      contactDesktopChoiceChipsValueController?.value =
          val != null ? [val] : [];
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue3;
  FormFieldController<List<String>>? dropDownValueController3;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<String>();
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // State field(s) for DropDown widget.
  String? dropDownValue6;
  FormFieldController<String>? dropDownValueController6;
  // State field(s) for DropDown widget.
  String? dropDownValue7;
  FormFieldController<String>? dropDownValueController7;
  // State field(s) for LeadsMobileChoiceChips widget.
  FormFieldController<List<String>>? leadsMobileChoiceChipsValueController;
  String? get leadsMobileChoiceChipsValue =>
      leadsMobileChoiceChipsValueController?.value?.firstOrNull;
  set leadsMobileChoiceChipsValue(String? val) =>
      leadsMobileChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for DropDown widget.
  String? dropDownValue8;
  FormFieldController<String>? dropDownValueController8;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController3 =
      FlutterFlowDataTableController<String>();
  // State field(s) for LeadsDesktopChoiceChips widget.
  FormFieldController<List<String>>? leadsDesktopChoiceChipsValueController;
  String? get leadsDesktopChoiceChipsValue =>
      leadsDesktopChoiceChipsValueController?.value?.firstOrNull;
  set leadsDesktopChoiceChipsValue(String? val) =>
      leadsDesktopChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for DropDown widget.
  String? dropDownValue9;
  FormFieldController<String>? dropDownValueController9;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController4 =
      FlutterFlowDataTableController<String>();
  // State field(s) for DropDown widget.
  String? dropDownValue10;
  FormFieldController<String>? dropDownValueController10;
  // State field(s) for DropDown widget.
  String? dropDownValue11;
  FormFieldController<String>? dropDownValueController11;
  // State field(s) for DropDown widget.
  String? dropDownValue12;
  FormFieldController<String>? dropDownValueController12;
  // State field(s) for DropDown widget.
  String? dropDownValue13;
  FormFieldController<String>? dropDownValueController13;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
