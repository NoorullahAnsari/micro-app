import '../database.dart';

class LotWiseInventoryManagementTable
    extends SupabaseTable<LotWiseInventoryManagementRow> {
  @override
  String get tableName => 'lotWiseInventoryManagement';

  @override
  LotWiseInventoryManagementRow createRow(Map<String, dynamic> data) =>
      LotWiseInventoryManagementRow(data);
}

class LotWiseInventoryManagementRow extends SupabaseDataRow {
  LotWiseInventoryManagementRow(super.data);

  @override
  SupabaseTable get table => LotWiseInventoryManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get item => getField<int>('item')!;
  set item(int value) => setField<int>('item', value);

  double get physicalQuantity => getField<double>('physicalQuantity')!;
  set physicalQuantity(double value) =>
      setField<double>('physicalQuantity', value);

  double get latestRatePerUnit => getField<double>('latestRatePerUnit')!;
  set latestRatePerUnit(double value) =>
      setField<double>('latestRatePerUnit', value);

  double get allocatedQuantity => getField<double>('allocatedQuantity')!;
  set allocatedQuantity(double value) =>
      setField<double>('allocatedQuantity', value);

  String get qualityRemark => getField<String>('qualityRemark')!;
  set qualityRemark(String value) => setField<String>('qualityRemark', value);

  String get remark => getField<String>('remark')!;
  set remark(String value) => setField<String>('remark', value);

  dynamic get inventoryParameters => getField<dynamic>('inventoryParameters')!;
  set inventoryParameters(dynamic value) =>
      setField<dynamic>('inventoryParameters', value);

  int? get company => getField<int>('company');
  set company(int? value) => setField<int>('company', value);

  String get lotNo => getField<String>('lotNo')!;
  set lotNo(String value) => setField<String>('lotNo', value);

  double get outwardQuantity => getField<double>('outwardQuantity')!;
  set outwardQuantity(double value) =>
      setField<double>('outwardQuantity', value);
}
