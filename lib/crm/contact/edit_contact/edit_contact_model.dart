import '/backend/supabase/supabase.dart';
import '/crm/contact/contact_reference_from/contact_reference_from_widget.dart';
import '/crm/contact/create_contact_component/create_contact_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_contact_widget.dart' show EditContactWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditContactModel extends FlutterFlowModel<EditContactWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for profileid widget.
  FocusNode? profileidFocusNode;
  TextEditingController? profileidTextController;
  String? Function(BuildContext, String?)? profileidTextControllerValidator;
  // State field(s) for companyname widget.
  FocusNode? companynameFocusNode;
  TextEditingController? companynameTextController;
  String? Function(BuildContext, String?)? companynameTextControllerValidator;
  // State field(s) for CreatedBy widget.
  FocusNode? createdByFocusNode;
  TextEditingController? createdByTextController;
  String? Function(BuildContext, String?)? createdByTextControllerValidator;
  // State field(s) for CreatedOn widget.
  FocusNode? createdOnFocusNode;
  TextEditingController? createdOnTextController;
  String? Function(BuildContext, String?)? createdOnTextControllerValidator;
  // State field(s) for firstname widget.
  FocusNode? firstnameFocusNode;
  TextEditingController? firstnameTextController;
  String? Function(BuildContext, String?)? firstnameTextControllerValidator;
  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameTextController;
  String? Function(BuildContext, String?)? lastnameTextControllerValidator;
  // State field(s) for primarymobileno widget.
  FocusNode? primarymobilenoFocusNode;
  TextEditingController? primarymobilenoTextController;
  String? Function(BuildContext, String?)?
      primarymobilenoTextControllerValidator;
  // State field(s) for secondarymobileno widget.
  FocusNode? secondarymobilenoFocusNode;
  TextEditingController? secondarymobilenoTextController;
  String? Function(BuildContext, String?)?
      secondarymobilenoTextControllerValidator;
  // State field(s) for frequencyChoiceChips widget.
  FormFieldController<List<String>>? frequencyChoiceChipsValueController;
  String? get frequencyChoiceChipsValue =>
      frequencyChoiceChipsValueController?.value?.firstOrNull;
  set frequencyChoiceChipsValue(String? val) =>
      frequencyChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for profilecategory widget.
  String? profilecategoryValue;
  FormFieldController<String>? profilecategoryValueController;
  // State field(s) for country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;
  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateValueController;
  // State field(s) for city widget.
  String? cityValue;
  FormFieldController<String>? cityValueController;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for landmark widget.
  FocusNode? landmarkFocusNode;
  TextEditingController? landmarkTextController;
  String? Function(BuildContext, String?)? landmarkTextControllerValidator;
  // State field(s) for pincode widget.
  FocusNode? pincodeFocusNode;
  TextEditingController? pincodeTextController;
  String? Function(BuildContext, String?)? pincodeTextControllerValidator;
  // State field(s) for tag widget.
  String? tagValue;
  FormFieldController<String>? tagValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    profileidFocusNode?.dispose();
    profileidTextController?.dispose();

    companynameFocusNode?.dispose();
    companynameTextController?.dispose();

    createdByFocusNode?.dispose();
    createdByTextController?.dispose();

    createdOnFocusNode?.dispose();
    createdOnTextController?.dispose();

    firstnameFocusNode?.dispose();
    firstnameTextController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameTextController?.dispose();

    primarymobilenoFocusNode?.dispose();
    primarymobilenoTextController?.dispose();

    secondarymobilenoFocusNode?.dispose();
    secondarymobilenoTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    landmarkFocusNode?.dispose();
    landmarkTextController?.dispose();

    pincodeFocusNode?.dispose();
    pincodeTextController?.dispose();
  }
}
