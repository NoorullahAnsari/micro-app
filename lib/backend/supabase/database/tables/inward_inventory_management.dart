import '../database.dart';

class InwardInventoryManagementTable
    extends SupabaseTable<InwardInventoryManagementRow> {
  @override
  String get tableName => 'inwardInventoryManagement';

  @override
  InwardInventoryManagementRow createRow(Map<String, dynamic> data) =>
      InwardInventoryManagementRow(data);
}

class InwardInventoryManagementRow extends SupabaseDataRow {
  InwardInventoryManagementRow(super.data);

  @override
  SupabaseTable get table => InwardInventoryManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get purchaseOrderNumber => getField<String>('purchaseOrderNumber');
  set purchaseOrderNumber(String? value) =>
      setField<String>('purchaseOrderNumber', value);

  String get inwardNumber => getField<String>('inwardNumber')!;
  set inwardNumber(String value) => setField<String>('inwardNumber', value);

  DateTime get inwardedOn => getField<DateTime>('inwardedOn')!;
  set inwardedOn(DateTime value) => setField<DateTime>('inwardedOn', value);

  int get inwardedBy => getField<int>('inwardedBy')!;
  set inwardedBy(int value) => setField<int>('inwardedBy', value);

  int get sendForApprovalTo => getField<int>('sendForApprovalTo')!;
  set sendForApprovalTo(int value) => setField<int>('sendForApprovalTo', value);

  String get inwardType => getField<String>('inwardType')!;
  set inwardType(String value) => setField<String>('inwardType', value);

  String get inwardLocation => getField<String>('inwardLocation')!;
  set inwardLocation(String value) => setField<String>('inwardLocation', value);

  String? get subcontractMaterialOutwardNumber =>
      getField<String>('subcontractMaterialOutwardNumber');
  set subcontractMaterialOutwardNumber(String? value) =>
      setField<String>('subcontractMaterialOutwardNumber', value);

  String get materialReceivedFrom => getField<String>('materialReceivedFrom')!;
  set materialReceivedFrom(String value) =>
      setField<String>('materialReceivedFrom', value);

  String get referenceNumber => getField<String>('referenceNumber')!;
  set referenceNumber(String value) =>
      setField<String>('referenceNumber', value);

  String get inwardRemarks => getField<String>('inwardRemarks')!;
  set inwardRemarks(String value) => setField<String>('inwardRemarks', value);

  List<String> get attachment => getListField<String>('attachment');
  set attachment(List<String> value) =>
      setListField<String>('attachment', value);

  String get conclusion => getField<String>('conclusion')!;
  set conclusion(String value) => setField<String>('conclusion', value);

  String get approvalRemark => getField<String>('approvalRemark')!;
  set approvalRemark(String value) => setField<String>('approvalRemark', value);

  int get company => getField<int>('company')!;
  set company(int value) => setField<int>('company', value);

  int get currentlyAssignedTo => getField<int>('currentlyAssignedTo')!;
  set currentlyAssignedTo(int value) =>
      setField<int>('currentlyAssignedTo', value);
}
