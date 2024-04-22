import '../database.dart';

class ApprovalUserTable extends SupabaseTable<ApprovalUserRow> {
  @override
  String get tableName => 'approvalUser';

  @override
  ApprovalUserRow createRow(Map<String, dynamic> data) => ApprovalUserRow(data);
}

class ApprovalUserRow extends SupabaseDataRow {
  ApprovalUserRow(super.data);

  @override
  SupabaseTable get table => ApprovalUserTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get company => getField<int>('company')!;
  set company(int value) => setField<int>('company', value);

  String get processName => getField<String>('processName')!;
  set processName(String value) => setField<String>('processName', value);

  int get user => getField<int>('user')!;
  set user(int value) => setField<int>('user', value);
}
