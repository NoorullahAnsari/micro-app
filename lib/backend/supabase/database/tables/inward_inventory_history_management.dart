import '../database.dart';

class InwardInventoryHistoryManagementTable
    extends SupabaseTable<InwardInventoryHistoryManagementRow> {
  @override
  String get tableName => 'inwardInventoryHistoryManagement';

  @override
  InwardInventoryHistoryManagementRow createRow(Map<String, dynamic> data) =>
      InwardInventoryHistoryManagementRow(data);
}

class InwardInventoryHistoryManagementRow extends SupabaseDataRow {
  InwardInventoryHistoryManagementRow(super.data);

  @override
  SupabaseTable get table => InwardInventoryHistoryManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get company => getField<int>('company')!;
  set company(int value) => setField<int>('company', value);

  String get stepName => getField<String>('stepName')!;
  set stepName(String value) => setField<String>('stepName', value);

  int get submittedBy => getField<int>('submittedBy')!;
  set submittedBy(int value) => setField<int>('submittedBy', value);

  DateTime get submittedOn => getField<DateTime>('submittedOn')!;
  set submittedOn(DateTime value) => setField<DateTime>('submittedOn', value);

  String get remark => getField<String>('remark')!;
  set remark(String value) => setField<String>('remark', value);

  int get inward => getField<int>('inward')!;
  set inward(int value) => setField<int>('inward', value);
}
