import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/item_management/itemparameter/itemparameter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_item_in_outward_moving_average_widget.dart'
    show AddItemInOutwardMovingAverageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddItemInOutwardMovingAverageModel
    extends FlutterFlowModel<AddItemInOutwardMovingAverageWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Models for itemparameter dynamic component.
  late FlutterFlowDynamicModels<ItemparameterModel> itemparameterModels;

  @override
  void initState(BuildContext context) {
    itemparameterModels = FlutterFlowDynamicModels(() => ItemparameterModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    itemparameterModels.dispose();
  }
}
