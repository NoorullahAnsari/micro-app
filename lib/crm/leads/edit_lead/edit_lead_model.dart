import '/backend/supabase/supabase.dart';
import '/common_components/add_parameters/add_parameters_widget.dart';
import '/components/side_nav_widget.dart';
import '/crm/contact/add_tag_component_contacts/add_tag_component_contacts_widget.dart';
import '/crm/contact/create_contact_component/create_contact_component_widget.dart';
import '/crm/leads/add_tag_component_leads/add_tag_component_leads_widget.dart';
import '/crm/leads/lead_source/lead_source_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_lead_widget.dart' show EditLeadWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditLeadModel extends FlutterFlowModel<EditLeadWidget> {
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
