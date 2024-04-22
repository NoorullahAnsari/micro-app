import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/item_management/itemparameter/itemparameter_widget.dart';
import 'create_item_widget.dart' show CreateItemWidget;
import 'package:flutter/material.dart';

class CreateItemModel extends FlutterFlowModel<CreateItemWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ItemCode widget.
  FocusNode? itemCodeFocusNode;
  TextEditingController? itemCodeTextController;
  String? Function(BuildContext, String?)? itemCodeTextControllerValidator;
  String? _itemCodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n2uc01db' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for primarymobileno widget.
  FocusNode? primarymobilenoFocusNode;
  TextEditingController? primarymobilenoTextController;
  String? Function(BuildContext, String?)?
      primarymobilenoTextControllerValidator;
  String? _primarymobilenoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nztxmp7f' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for emailid widget.
  FocusNode? emailidFocusNode1;
  TextEditingController? emailidTextController1;
  String? Function(BuildContext, String?)? emailidTextController1Validator;
  String? _emailidTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6c2wr5kr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for moq widget.
  FocusNode? moqFocusNode;
  TextEditingController? moqTextController;
  String? Function(BuildContext, String?)? moqTextControllerValidator;
  String? _moqTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wm0prxcu' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for emailid widget.
  FocusNode? emailidFocusNode2;
  TextEditingController? emailidTextController2;
  String? Function(BuildContext, String?)? emailidTextController2Validator;
  // State field(s) for emailid widget.
  FocusNode? emailidFocusNode3;
  TextEditingController? emailidTextController3;
  String? Function(BuildContext, String?)? emailidTextController3Validator;
  // Models for itemparameter dynamic component.
  late FlutterFlowDynamicModels<ItemparameterModel> itemparameterModels;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ItemManagementRow? item;

  @override
  void initState(BuildContext context) {
    itemCodeTextControllerValidator = _itemCodeTextControllerValidator;
    primarymobilenoTextControllerValidator =
        _primarymobilenoTextControllerValidator;
    emailidTextController1Validator = _emailidTextController1Validator;
    moqTextControllerValidator = _moqTextControllerValidator;
    itemparameterModels = FlutterFlowDynamicModels(() => ItemparameterModel());
  }

  @override
  void dispose() {
    itemCodeFocusNode?.dispose();
    itemCodeTextController?.dispose();

    primarymobilenoFocusNode?.dispose();
    primarymobilenoTextController?.dispose();

    emailidFocusNode1?.dispose();
    emailidTextController1?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();

    moqFocusNode?.dispose();
    moqTextController?.dispose();

    emailidFocusNode2?.dispose();
    emailidTextController2?.dispose();

    emailidFocusNode3?.dispose();
    emailidTextController3?.dispose();

    itemparameterModels.dispose();
  }
}
