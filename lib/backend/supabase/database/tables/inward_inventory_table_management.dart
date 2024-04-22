import '../database.dart';

class InwardInventoryTableManagementTable
    extends SupabaseTable<InwardInventoryTableManagementRow> {
  @override
  String get tableName => 'inwardInventoryTableManagement';

  @override
  InwardInventoryTableManagementRow createRow(Map<String, dynamic> data) =>
      InwardInventoryTableManagementRow(data);
}

class InwardInventoryTableManagementRow extends SupabaseDataRow {
  InwardInventoryTableManagementRow(super.data);

  @override
  SupabaseTable get table => InwardInventoryTableManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get item => getField<int>('item')!;
  set item(int value) => setField<int>('item', value);

  String get lotNo => getField<String>('lotNo')!;
  set lotNo(String value) => setField<String>('lotNo', value);

  double get receivedQuantity => getField<double>('receivedQuantity')!;
  set receivedQuantity(double value) =>
      setField<double>('receivedQuantity', value);

  String get remarks => getField<String>('remarks')!;
  set remarks(String value) => setField<String>('remarks', value);

  bool get qrVerified => getField<bool>('qrVerified')!;
  set qrVerified(bool value) => setField<bool>('qrVerified', value);

  dynamic get inventoryParameters => getField<dynamic>('inventoryParameters')!;
  set inventoryParameters(dynamic value) =>
      setField<dynamic>('inventoryParameters', value);

  int get inward => getField<int>('inward')!;
  set inward(int value) => setField<int>('inward', value);

  double get requireQuantity => getField<double>('requireQuantity')!;
  set requireQuantity(double value) =>
      setField<double>('requireQuantity', value);

  double get rate => getField<double>('rate')!;
  set rate(double value) => setField<double>('rate', value);

  int get company => getField<int>('company')!;
  set company(int value) => setField<int>('company', value);
}
