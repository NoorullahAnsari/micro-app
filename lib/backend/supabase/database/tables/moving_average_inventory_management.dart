import '../database.dart';

class MovingAverageInventoryManagementTable
    extends SupabaseTable<MovingAverageInventoryManagementRow> {
  @override
  String get tableName => 'movingAverageInventoryManagement';

  @override
  MovingAverageInventoryManagementRow createRow(Map<String, dynamic> data) =>
      MovingAverageInventoryManagementRow(data);
}

class MovingAverageInventoryManagementRow extends SupabaseDataRow {
  MovingAverageInventoryManagementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MovingAverageInventoryManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get item => getField<int>('item')!;
  set item(int value) => setField<int>('item', value);

  double get physicalQuantity => getField<double>('physicalQuantity')!;
  set physicalQuantity(double value) =>
      setField<double>('physicalQuantity', value);

  double get movingAverageRatePerUnit =>
      getField<double>('movingAverageRatePerUnit')!;
  set movingAverageRatePerUnit(double value) =>
      setField<double>('movingAverageRatePerUnit', value);

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

  double get lotWiseRatePerUnit => getField<double>('lotWiseRatePerUnit')!;
  set lotWiseRatePerUnit(double value) =>
      setField<double>('lotWiseRatePerUnit', value);

  int get company => getField<int>('company')!;
  set company(int value) => setField<int>('company', value);

  double get outwardQuantity => getField<double>('outwardQuantity')!;
  set outwardQuantity(double value) =>
      setField<double>('outwardQuantity', value);
}
