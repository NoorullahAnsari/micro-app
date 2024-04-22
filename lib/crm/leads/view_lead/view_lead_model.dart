import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'view_lead_widget.dart' show ViewLeadWidget;
import 'package:flutter/material.dart';

class ViewLeadModel extends FlutterFlowModel<ViewLeadWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for leadnumber widget.
  FocusNode? leadnumberFocusNode;
  TextEditingController? leadnumberTextController;
  String? Function(BuildContext, String?)? leadnumberTextControllerValidator;
  // State field(s) for leadname widget.
  FocusNode? leadnameFocusNode;
  TextEditingController? leadnameTextController;
  String? Function(BuildContext, String?)? leadnameTextControllerValidator;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  // State field(s) for customerrequirement widget.
  FocusNode? customerrequirementFocusNode;
  TextEditingController? customerrequirementTextController;
  String? Function(BuildContext, String?)?
      customerrequirementTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<String>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<String>();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for tag widget.
  String? tagValue;
  FormFieldController<String>? tagValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    leadnumberFocusNode?.dispose();
    leadnumberTextController?.dispose();

    leadnameFocusNode?.dispose();
    leadnameTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    customerrequirementFocusNode?.dispose();
    customerrequirementTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
