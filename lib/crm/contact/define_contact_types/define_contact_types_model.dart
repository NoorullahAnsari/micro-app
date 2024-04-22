import '/crm/contact/parameter_value_for_contact/parameter_value_for_contact_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'define_contact_types_widget.dart' show DefineContactTypesWidget;
import 'package:flutter/material.dart';

class DefineContactTypesModel
    extends FlutterFlowModel<DefineContactTypesWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ParameterValueForContact component.
  late ParameterValueForContactModel parameterValueForContactModel1;
  // Model for ParameterValueForContact component.
  late ParameterValueForContactModel parameterValueForContactModel2;
  // Model for ParameterValueForContact component.
  late ParameterValueForContactModel parameterValueForContactModel3;

  @override
  void initState(BuildContext context) {
    parameterValueForContactModel1 =
        createModel(context, () => ParameterValueForContactModel());
    parameterValueForContactModel2 =
        createModel(context, () => ParameterValueForContactModel());
    parameterValueForContactModel3 =
        createModel(context, () => ParameterValueForContactModel());
  }

  @override
  void dispose() {
    parameterValueForContactModel1.dispose();
    parameterValueForContactModel2.dispose();
    parameterValueForContactModel3.dispose();
  }
}
