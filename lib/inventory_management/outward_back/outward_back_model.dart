import '/backend/supabase/supabase.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'outward_back_widget.dart' show OutwardBackWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OutwardBackModel extends FlutterFlowModel<OutwardBackWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  // State field(s) for OutwardType widget.
  String? outwardTypeValue;
  FormFieldController<String>? outwardTypeValueController;
  // State field(s) for OutwardLocation widget.
  String? outwardLocationValue;
  FormFieldController<String>? outwardLocationValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
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
  // State field(s) for issuedto widget.
  String? issuedtoValue;
  FormFieldController<String>? issuedtoValueController;
  // State field(s) for InwardType widget.
  String? inwardTypeValue2;
  FormFieldController<String>? inwardTypeValueController2;
  // State field(s) for InwardType widget.
  String? inwardTypeValue3;
  FormFieldController<String>? inwardTypeValueController3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  var scanItem = '';
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
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

    textFieldFocusNode3?.dispose();
    textController9?.dispose();

    textFieldFocusNode4?.dispose();
    textController10?.dispose();

    textFieldFocusNode5?.dispose();
    textController11?.dispose();
  }
}
