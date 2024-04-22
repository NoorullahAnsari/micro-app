import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/item_management/itemparameter/itemparameter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_item_widget.dart' show EditItemWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditItemModel extends FlutterFlowModel<EditItemWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ItemCode widget.
  FocusNode? itemCodeFocusNode;
  TextEditingController? itemCodeTextController;
  String? Function(BuildContext, String?)? itemCodeTextControllerValidator;
  String? _itemCodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2e1ohod0' /* Field is required */,
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
        'sdr0sczp' /* Field is required */,
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
        'qvgrjgme' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for emailid widget.
  FocusNode? emailidFocusNode2;
  TextEditingController? emailidTextController2;
  String? Function(BuildContext, String?)? emailidTextController2Validator;
  // State field(s) for emailid widget.
  FocusNode? emailidFocusNode3;
  TextEditingController? emailidTextController3;
  String? Function(BuildContext, String?)? emailidTextController3Validator;
  // State field(s) for emailid widget.
  FocusNode? emailidFocusNode4;
  TextEditingController? emailidTextController4;
  String? Function(BuildContext, String?)? emailidTextController4Validator;
  // Models for itemparameter dynamic component.
  late FlutterFlowDynamicModels<ItemparameterModel> itemparameterModels;

  @override
  void initState(BuildContext context) {
    itemCodeTextControllerValidator = _itemCodeTextControllerValidator;
    primarymobilenoTextControllerValidator =
        _primarymobilenoTextControllerValidator;
    emailidTextController1Validator = _emailidTextController1Validator;
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

    emailidFocusNode2?.dispose();
    emailidTextController2?.dispose();

    emailidFocusNode3?.dispose();
    emailidTextController3?.dispose();

    emailidFocusNode4?.dispose();
    emailidTextController4?.dispose();

    itemparameterModels.dispose();
  }
}
