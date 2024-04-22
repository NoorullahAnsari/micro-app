// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DropdownModuleStruct extends BaseStruct {
  DropdownModuleStruct({
    String? dropdownName,
    String? moduleName,
  })  : _dropdownName = dropdownName,
        _moduleName = moduleName;

  // "dropdownName" field.
  String? _dropdownName;
  String get dropdownName => _dropdownName ?? '';
  set dropdownName(String? val) => _dropdownName = val;
  bool hasDropdownName() => _dropdownName != null;

  // "moduleName" field.
  String? _moduleName;
  String get moduleName => _moduleName ?? '';
  set moduleName(String? val) => _moduleName = val;
  bool hasModuleName() => _moduleName != null;

  static DropdownModuleStruct fromMap(Map<String, dynamic> data) =>
      DropdownModuleStruct(
        dropdownName: data['dropdownName'] as String?,
        moduleName: data['moduleName'] as String?,
      );

  static DropdownModuleStruct? maybeFromMap(dynamic data) => data is Map
      ? DropdownModuleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dropdownName': _dropdownName,
        'moduleName': _moduleName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dropdownName': serializeParam(
          _dropdownName,
          ParamType.String,
        ),
        'moduleName': serializeParam(
          _moduleName,
          ParamType.String,
        ),
      }.withoutNulls;

  static DropdownModuleStruct fromSerializableMap(Map<String, dynamic> data) =>
      DropdownModuleStruct(
        dropdownName: deserializeParam(
          data['dropdownName'],
          ParamType.String,
          false,
        ),
        moduleName: deserializeParam(
          data['moduleName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DropdownModuleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DropdownModuleStruct &&
        dropdownName == other.dropdownName &&
        moduleName == other.moduleName;
  }

  @override
  int get hashCode => const ListEquality().hash([dropdownName, moduleName]);
}

DropdownModuleStruct createDropdownModuleStruct({
  String? dropdownName,
  String? moduleName,
}) =>
    DropdownModuleStruct(
      dropdownName: dropdownName,
      moduleName: moduleName,
    );
