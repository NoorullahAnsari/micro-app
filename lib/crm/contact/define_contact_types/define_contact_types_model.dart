import '/backend/supabase/supabase.dart';
import '/crm/contact/parameter_value_for_contact/parameter_value_for_contact_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'define_contact_types_widget.dart' show DefineContactTypesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
