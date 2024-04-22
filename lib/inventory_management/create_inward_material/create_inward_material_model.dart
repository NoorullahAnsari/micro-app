import '/backend/supabase/supabase.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/item_management/itemparameter/itemparameter_widget.dart';
import 'create_inward_material_widget.dart' show CreateInwardMaterialWidget;
import 'package:flutter/material.dart';

class CreateInwardMaterialModel
    extends FlutterFlowModel<CreateInwardMaterialWidget> {
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  var scanItem = '';
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // Models for requiredquantity.
  late FlutterFlowDynamicModels<ItemparameterModel> requiredquantityModels;
  // Models for receivequantity.
  late FlutterFlowDynamicModels<ItemparameterModel> receivequantityModels;
  // Models for rateunit.
  late FlutterFlowDynamicModels<ItemparameterModel> rateunitModels;
  // Models for Remark.
  late FlutterFlowDynamicModels<ItemparameterModel> remarkModels;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  InwardInventoryManagementRow? inward;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    requiredquantityModels =
        FlutterFlowDynamicModels(() => ItemparameterModel());
    receivequantityModels =
        FlutterFlowDynamicModels(() => ItemparameterModel());
    rateunitModels = FlutterFlowDynamicModels(() => ItemparameterModel());
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

    materialReceivedfromFocusNode?.dispose();
    materialReceivedfromTextController?.dispose();

    referenceNumberFocusNode?.dispose();
    referenceNumberTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController7?.dispose();

    textFieldFocusNode2?.dispose();
    textController8?.dispose();

    requiredquantityModels.dispose();
    receivequantityModels.dispose();
    rateunitModels.dispose();
    remarkModels.dispose();
  }
}
