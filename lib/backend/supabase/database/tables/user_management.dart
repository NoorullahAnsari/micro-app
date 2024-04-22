import '../database.dart';

class UserManagementTable extends SupabaseTable<UserManagementRow> {
  @override
  String get tableName => 'userManagement';

  @override
  UserManagementRow createRow(Map<String, dynamic> data) =>
      UserManagementRow(data);
}

class UserManagementRow extends SupabaseDataRow {
  UserManagementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserManagementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String get password => getField<String>('password')!;
  set password(String value) => setField<String>('password', value);

  String get fullName => getField<String>('fullName')!;
  set fullName(String value) => setField<String>('fullName', value);

  int? get company => getField<int>('company');
  set company(int? value) => setField<int>('company', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  bool get isOwner => getField<bool>('isOwner')!;
  set isOwner(bool value) => setField<bool>('isOwner', value);

  bool get isSuperAdmin => getField<bool>('isSuperAdmin')!;
  set isSuperAdmin(bool value) => setField<bool>('isSuperAdmin', value);

  String get userModule => getField<String>('userModule')!;
  set userModule(String value) => setField<String>('userModule', value);

  String get itemMasterModule => getField<String>('itemMasterModule')!;
  set itemMasterModule(String value) =>
      setField<String>('itemMasterModule', value);

  String get inventoryModule => getField<String>('inventoryModule')!;
  set inventoryModule(String value) =>
      setField<String>('inventoryModule', value);
}
