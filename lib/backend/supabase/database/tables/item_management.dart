import '../database.dart';

class ItemManagementTable extends SupabaseTable<ItemManagementRow> {
  @override
  String get tableName => 'itemManagement';

  @override
  ItemManagementRow createRow(Map<String, dynamic> data) =>
      ItemManagementRow(data);
}

class ItemManagementRow extends SupabaseDataRow {
  ItemManagementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ItemManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get company => getField<int>('company')!;
  set company(int value) => setField<int>('company', value);

  String get itemCode => getField<String>('itemCode')!;
  set itemCode(String value) => setField<String>('itemCode', value);

  String get itemName => getField<String>('itemName')!;
  set itemName(String value) => setField<String>('itemName', value);

  String get measurementUnit => getField<String>('measurementUnit')!;
  set measurementUnit(String value) =>
      setField<String>('measurementUnit', value);

  String get itemCategory => getField<String>('itemCategory')!;
  set itemCategory(String value) => setField<String>('itemCategory', value);

  String get remarks => getField<String>('remarks')!;
  set remarks(String value) => setField<String>('remarks', value);

  dynamic get parameters => getField<dynamic>('parameters')!;
  set parameters(dynamic value) => setField<dynamic>('parameters', value);

  int get minimumOrderQuantity => getField<int>('minimumOrderQuantity')!;
  set minimumOrderQuantity(int value) =>
      setField<int>('minimumOrderQuantity', value);

  String get vendorName => getField<String>('vendorName')!;
  set vendorName(String value) => setField<String>('vendorName', value);
}
