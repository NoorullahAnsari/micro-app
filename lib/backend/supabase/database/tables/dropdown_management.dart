import '../database.dart';

class DropdownManagementTable extends SupabaseTable<DropdownManagementRow> {
  @override
  String get tableName => 'dropdownManagement';

  @override
  DropdownManagementRow createRow(Map<String, dynamic> data) =>
      DropdownManagementRow(data);
}

class DropdownManagementRow extends SupabaseDataRow {
  DropdownManagementRow(super.data);

  @override
  SupabaseTable get table => DropdownManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get company => getField<int>('company')!;
  set company(int value) => setField<int>('company', value);

  String get module => getField<String>('module')!;
  set module(String value) => setField<String>('module', value);

  String get dropdownName => getField<String>('dropdownName')!;
  set dropdownName(String value) => setField<String>('dropdownName', value);

  List<String> get dropdownValues => getListField<String>('dropdownValues');
  set dropdownValues(List<String> value) =>
      setListField<String>('dropdownValues', value);
}
