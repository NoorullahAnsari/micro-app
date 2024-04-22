import '../database.dart';

class CompanyManagementTable extends SupabaseTable<CompanyManagementRow> {
  @override
  String get tableName => 'companyManagement';

  @override
  CompanyManagementRow createRow(Map<String, dynamic> data) =>
      CompanyManagementRow(data);
}

class CompanyManagementRow extends SupabaseDataRow {
  CompanyManagementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompanyManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get companyName => getField<String>('companyName')!;
  set companyName(String value) => setField<String>('companyName', value);

  List<String> get modulesAssigned => getListField<String>('modulesAssigned')!;
  set modulesAssigned(List<String> value) =>
      setListField<String>('modulesAssigned', value);

  String get defaultPassword => getField<String>('defaultPassword')!;
  set defaultPassword(String value) =>
      setField<String>('defaultPassword', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  String get inventoryCalculationMethod =>
      getField<String>('inventoryCalculationMethod')!;
  set inventoryCalculationMethod(String value) =>
      setField<String>('inventoryCalculationMethod', value);
}
