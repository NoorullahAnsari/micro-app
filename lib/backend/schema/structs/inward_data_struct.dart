// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InwardDataStruct extends BaseStruct {
  InwardDataStruct({
    String? remark,
    bool? qrVerified,
    String? lotNo,
    int? itemId,
    double? rate,
    double? requireQuantity,
    double? receiveQuantity,
  })  : _remark = remark,
        _qrVerified = qrVerified,
        _lotNo = lotNo,
        _itemId = itemId,
        _rate = rate,
        _requireQuantity = requireQuantity,
        _receiveQuantity = receiveQuantity;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;
  bool hasRemark() => _remark != null;

  // "qrVerified" field.
  bool? _qrVerified;
  bool get qrVerified => _qrVerified ?? false;
  set qrVerified(bool? val) => _qrVerified = val;
  bool hasQrVerified() => _qrVerified != null;

  // "lotNo" field.
  String? _lotNo;
  String get lotNo => _lotNo ?? '';
  set lotNo(String? val) => _lotNo = val;
  bool hasLotNo() => _lotNo != null;

  // "itemId" field.
  int? _itemId;
  int get itemId => _itemId ?? 0;
  set itemId(int? val) => _itemId = val;
  void incrementItemId(int amount) => _itemId = itemId + amount;
  bool hasItemId() => _itemId != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  set rate(double? val) => _rate = val;
  void incrementRate(double amount) => _rate = rate + amount;
  bool hasRate() => _rate != null;

  // "requireQuantity" field.
  double? _requireQuantity;
  double get requireQuantity => _requireQuantity ?? 0.0;
  set requireQuantity(double? val) => _requireQuantity = val;
  void incrementRequireQuantity(double amount) =>
      _requireQuantity = requireQuantity + amount;
  bool hasRequireQuantity() => _requireQuantity != null;

  // "receiveQuantity" field.
  double? _receiveQuantity;
  double get receiveQuantity => _receiveQuantity ?? 0.0;
  set receiveQuantity(double? val) => _receiveQuantity = val;
  void incrementReceiveQuantity(double amount) =>
      _receiveQuantity = receiveQuantity + amount;
  bool hasReceiveQuantity() => _receiveQuantity != null;

  static InwardDataStruct fromMap(Map<String, dynamic> data) =>
      InwardDataStruct(
        remark: data['remark'] as String?,
        qrVerified: data['qrVerified'] as bool?,
        lotNo: data['lotNo'] as String?,
        itemId: castToType<int>(data['itemId']),
        rate: castToType<double>(data['rate']),
        requireQuantity: castToType<double>(data['requireQuantity']),
        receiveQuantity: castToType<double>(data['receiveQuantity']),
      );

  static InwardDataStruct? maybeFromMap(dynamic data) => data is Map
      ? InwardDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'remark': _remark,
        'qrVerified': _qrVerified,
        'lotNo': _lotNo,
        'itemId': _itemId,
        'rate': _rate,
        'requireQuantity': _requireQuantity,
        'receiveQuantity': _receiveQuantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
        'qrVerified': serializeParam(
          _qrVerified,
          ParamType.bool,
        ),
        'lotNo': serializeParam(
          _lotNo,
          ParamType.String,
        ),
        'itemId': serializeParam(
          _itemId,
          ParamType.int,
        ),
        'rate': serializeParam(
          _rate,
          ParamType.double,
        ),
        'requireQuantity': serializeParam(
          _requireQuantity,
          ParamType.double,
        ),
        'receiveQuantity': serializeParam(
          _receiveQuantity,
          ParamType.double,
        ),
      }.withoutNulls;

  static InwardDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      InwardDataStruct(
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
        qrVerified: deserializeParam(
          data['qrVerified'],
          ParamType.bool,
          false,
        ),
        lotNo: deserializeParam(
          data['lotNo'],
          ParamType.String,
          false,
        ),
        itemId: deserializeParam(
          data['itemId'],
          ParamType.int,
          false,
        ),
        rate: deserializeParam(
          data['rate'],
          ParamType.double,
          false,
        ),
        requireQuantity: deserializeParam(
          data['requireQuantity'],
          ParamType.double,
          false,
        ),
        receiveQuantity: deserializeParam(
          data['receiveQuantity'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'InwardDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InwardDataStruct &&
        remark == other.remark &&
        qrVerified == other.qrVerified &&
        lotNo == other.lotNo &&
        itemId == other.itemId &&
        rate == other.rate &&
        requireQuantity == other.requireQuantity &&
        receiveQuantity == other.receiveQuantity;
  }

  @override
  int get hashCode => const ListEquality().hash([
        remark,
        qrVerified,
        lotNo,
        itemId,
        rate,
        requireQuantity,
        receiveQuantity
      ]);
}

InwardDataStruct createInwardDataStruct({
  String? remark,
  bool? qrVerified,
  String? lotNo,
  int? itemId,
  double? rate,
  double? requireQuantity,
  double? receiveQuantity,
}) =>
    InwardDataStruct(
      remark: remark,
      qrVerified: qrVerified,
      lotNo: lotNo,
      itemId: itemId,
      rate: rate,
      requireQuantity: requireQuantity,
      receiveQuantity: receiveQuantity,
    );
