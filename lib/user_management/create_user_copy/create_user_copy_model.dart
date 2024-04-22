import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_management/user_option_dropdown/user_option_dropdown_widget.dart';
import 'create_user_copy_widget.dart' show CreateUserCopyWidget;
import 'package:flutter/material.dart';

class CreateUserCopyModel extends FlutterFlowModel<CreateUserCopyWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  String? _fullnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9xd8ij4m' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for primarymobileno widget.
  FocusNode? primarymobilenoFocusNode;
  TextEditingController? primarymobilenoTextController;
  String? Function(BuildContext, String?)?
      primarymobilenoTextControllerValidator;
  // State field(s) for emailid widget.
  FocusNode? emailidFocusNode;
  TextEditingController? emailidTextController;
  String? Function(BuildContext, String?)? emailidTextControllerValidator;
  String? _emailidTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g89ynw5d' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController = FlutterFlowDataTableController<String>();
  // Models for UserOptionDropdown dynamic component.
  late FlutterFlowDynamicModels<UserOptionDropdownModel>
      userOptionDropdownModels;
  // Stores action output result for [Backend Call - API (Insert User)] action in Button widget.
  ApiCallResponse? user;
  // Stores action output result for [Backend Call - API (Create User)] action in Button widget.
  ApiCallResponse? userAuthentication;

  @override
  void initState(BuildContext context) {
    fullnameTextControllerValidator = _fullnameTextControllerValidator;
    emailidTextControllerValidator = _emailidTextControllerValidator;
    userOptionDropdownModels =
        FlutterFlowDynamicModels(() => UserOptionDropdownModel());
  }

  @override
  void dispose() {
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    primarymobilenoFocusNode?.dispose();
    primarymobilenoTextController?.dispose();

    emailidFocusNode?.dispose();
    emailidTextController?.dispose();

    userOptionDropdownModels.dispose();
  }
}
