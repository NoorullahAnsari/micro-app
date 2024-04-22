import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'dropdown_values_copy_model.dart';
export 'dropdown_values_copy_model.dart';

class DropdownValuesCopyWidget extends StatefulWidget {
  const DropdownValuesCopyWidget({
    super.key,
    this.value,
  });

  final String? value;

  @override
  State<DropdownValuesCopyWidget> createState() =>
      _DropdownValuesCopyWidgetState();
}

class _DropdownValuesCopyWidgetState extends State<DropdownValuesCopyWidget> {
  late DropdownValuesCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownValuesCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryBackground,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          widget.value!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
