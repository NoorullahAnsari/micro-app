import '/backend/supabase/supabase.dart';
import '/crm/contact/edit_contact/edit_contact_widget.dart';
import '/crm/contact/t_a_g_s/t_a_g_s_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'view_contact_widget.dart' show ViewContactWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewContactModel extends FlutterFlowModel<ViewContactWidget> {
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
  // State field(s) for ProfileCategory widget.
  FocusNode? profileCategoryFocusNode;
  TextEditingController? profileCategoryTextController;
  String? Function(BuildContext, String?)?
      profileCategoryTextControllerValidator;
  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  // State field(s) for State widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
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
  // State field(s) for ReferenceFrom widget.
  FocusNode? referenceFromFocusNode;
  TextEditingController? referenceFromTextController;
  String? Function(BuildContext, String?)? referenceFromTextControllerValidator;
  // Model for tAGS component.
  late TAGSModel tAGSModel;

  @override
  void initState(BuildContext context) {
    tAGSModel = createModel(context, () => TAGSModel());
  }

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

    profileCategoryFocusNode?.dispose();
    profileCategoryTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    landmarkFocusNode?.dispose();
    landmarkTextController?.dispose();

    pincodeFocusNode?.dispose();
    pincodeTextController?.dispose();

    referenceFromFocusNode?.dispose();
    referenceFromTextController?.dispose();

    tAGSModel.dispose();
  }
}
