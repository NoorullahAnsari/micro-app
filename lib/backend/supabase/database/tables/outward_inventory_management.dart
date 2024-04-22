import '../database.dart';

class OutwardInventoryManagementTable
    extends SupabaseTable<OutwardInventoryManagementRow> {
  @override
  String get tableName => 'outwardInventoryManagement';

  @override
  OutwardInventoryManagementRow createRow(Map<String, dynamic> data) =>
      OutwardInventoryManagementRow(data);
}

class OutwardInventoryManagementRow extends SupabaseDataRow {
  OutwardInventoryManagementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OutwardInventoryManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get company => getField<int>('company')!;
  set company(int value) => setField<int>('company', value);

  String? get salesOrderNummber => getField<String>('salesOrderNummber');
  set salesOrderNummber(String? value) =>
      setField<String>('salesOrderNummber', value);

  String get outwardNumber => getField<String>('outwardNumber')!;
  set outwardNumber(String value) => setField<String>('outwardNumber', value);

  DateTime get outwardedOn => getField<DateTime>('outwardedOn')!;
  set outwardedOn(DateTime value) => setField<DateTime>('outwardedOn', value);

  int get outwardedBy => getField<int>('outwardedBy')!;
  set outwardedBy(int value) => setField<int>('outwardedBy', value);

  int get sendForApprovalTo => getField<int>('sendForApprovalTo')!;
  set sendForApprovalTo(int value) => setField<int>('sendForApprovalTo', value);

  String get outwardType => getField<String>('outwardType')!;
  set outwardType(String value) => setField<String>('outwardType', value);

  String get outwardLocation => getField<String>('outwardLocation')!;
  set outwardLocation(String value) =>
      setField<String>('outwardLocation', value);

  bool get subcontractWIPMaterial => getField<bool>('subcontractWIPMaterial')!;
  set subcontractWIPMaterial(bool value) =>
      setField<bool>('subcontractWIPMaterial', value);

  String get materialReceivedFrom => getField<String>('materialReceivedFrom')!;
  set materialReceivedFrom(String value) =>
      setField<String>('materialReceivedFrom', value);

  String get referenceNumber => getField<String>('referenceNumber')!;
  set referenceNumber(String value) =>
      setField<String>('referenceNumber', value);

  String get outwardRemarks => getField<String>('outwardRemarks')!;
  set outwardRemarks(String value) => setField<String>('outwardRemarks', value);

  List<String> get attachment => getListField<String>('attachment')!;
  set attachment(List<String> value) =>
      setListField<String>('attachment', value);

  String get conclusion => getField<String>('conclusion')!;
  set conclusion(String value) => setField<String>('conclusion', value);

  String get approvalRemark => getField<String>('approvalRemark')!;
  set approvalRemark(String value) => setField<String>('approvalRemark', value);

  int get currentlyAssignedTo => getField<int>('currentlyAssignedTo')!;
  set currentlyAssignedTo(int value) =>
      setField<int>('currentlyAssignedTo', value);

  String get issueTo => getField<String>('issueTo')!;
  set issueTo(String value) => setField<String>('issueTo', value);

  String get customerName => getField<String>('customerName')!;
  set customerName(String value) => setField<String>('customerName', value);

  String get supplierName => getField<String>('supplierName')!;
  set supplierName(String value) => setField<String>('supplierName', value);

  String get deliveredTo => getField<String>('deliveredTo')!;
  set deliveredTo(String value) => setField<String>('deliveredTo', value);
}
