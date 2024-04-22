import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/inventory_management/add_item/add_item_widget.dart';
import '/inventory_management/add_item_copy/add_item_copy_widget.dart';
import '/item_management/itemparameter/itemparameter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'inward_back_widget.dart' show InwardBackWidget;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InwardBackModel extends FlutterFlowModel<InwardBackWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for InwardType widget.
  String? inwardTypeValue1;
  FormFieldController<String>? inwardTypeValueController1;
  // State field(s) for InwardNumber widget.
  FocusNode? inwardNumberFocusNode;
  TextEditingController? inwardNumberTextController;
  String? Function(BuildContext, String?)? inwardNumberTextControllerValidator;
  // State field(s) for InwardedOn widget.
  FocusNode? inwardedOnFocusNode;
  TextEditingController? inwardedOnTextController;
  String? Function(BuildContext, String?)? inwardedOnTextControllerValidator;
  // State field(s) for Inwardedby widget.
  FocusNode? inwardedbyFocusNode1;
  TextEditingController? inwardedbyTextController1;
  String? Function(BuildContext, String?)? inwardedbyTextController1Validator;
  // State field(s) for Inwardedby widget.
  FocusNode? inwardedbyFocusNode2;
  TextEditingController? inwardedbyTextController2;
  String? Function(BuildContext, String?)? inwardedbyTextController2Validator;
  // State field(s) for Inwardedby widget.
  FocusNode? inwardedbyFocusNode3;
  TextEditingController? inwardedbyTextController3;
  String? Function(BuildContext, String?)? inwardedbyTextController3Validator;
  // State field(s) for InwardType widget.
  String? inwardTypeValue2;
  FormFieldController<String>? inwardTypeValueController2;
  // State field(s) for InwardType widget.
  String? inwardTypeValue3;
  FormFieldController<String>? inwardTypeValueController3;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for MaterialOutwardNumber widget.
  String? materialOutwardNumberValue;
  FormFieldController<String>? materialOutwardNumberValueController;
  // State field(s) for MaterialReceivedfrom widget.
  FocusNode? materialReceivedfromFocusNode;
  TextEditingController? materialReceivedfromTextController;
  String? Function(BuildContext, String?)?
      materialReceivedfromTextControllerValidator;
  // State field(s) for ReferenceNumber widget.
  FocusNode? referenceNumberFocusNode;
  TextEditingController? referenceNumberTextController;
  String? Function(BuildContext, String?)?
      referenceNumberTextControllerValidator;
  // State field(s) for Remark widget.
  FocusNode? remarkFocusNode;
  TextEditingController? remarkTextController;
  String? Function(BuildContext, String?)? remarkTextControllerValidator;
  var scanItem = '';
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // Models for requiredquantity.
  late FlutterFlowDynamicModels<ItemparameterModel> requiredquantityModels;
  // Models for receivequantity.
  late FlutterFlowDynamicModels<ItemparameterModel> receivequantityModels;
  // Models for rate.
  late FlutterFlowDynamicModels<ItemparameterModel> rateModels;
  // Models for remark.
  late FlutterFlowDynamicModels<ItemparameterModel> remarkModels;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    requiredquantityModels =
        FlutterFlowDynamicModels(() => ItemparameterModel());
    receivequantityModels =
        FlutterFlowDynamicModels(() => ItemparameterModel());
    rateModels = FlutterFlowDynamicModels(() => ItemparameterModel());
    remarkModels = FlutterFlowDynamicModels(() => ItemparameterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    inwardNumberFocusNode?.dispose();
    inwardNumberTextController?.dispose();

    inwardedOnFocusNode?.dispose();
    inwardedOnTextController?.dispose();

    inwardedbyFocusNode1?.dispose();
    inwardedbyTextController1?.dispose();

    inwardedbyFocusNode2?.dispose();
    inwardedbyTextController2?.dispose();

    inwardedbyFocusNode3?.dispose();
    inwardedbyTextController3?.dispose();

    materialReceivedfromFocusNode?.dispose();
    materialReceivedfromTextController?.dispose();

    referenceNumberFocusNode?.dispose();
    referenceNumberTextController?.dispose();

    remarkFocusNode?.dispose();
    remarkTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController9?.dispose();

    requiredquantityModels.dispose();
    receivequantityModels.dispose();
    rateModels.dispose();
    remarkModels.dispose();
    textFieldFocusNode2?.dispose();
    textController10?.dispose();
  }
}
