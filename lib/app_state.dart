import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _navOpen = prefs.getBool('ff_navOpen') ?? _navOpen;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _stringsSelected = [];
  List<String> get stringsSelected => _stringsSelected;
  set stringsSelected(List<String> value) {
    _stringsSelected = value;
  }

  void addToStringsSelected(String value) {
    _stringsSelected.add(value);
  }

  void removeFromStringsSelected(String value) {
    _stringsSelected.remove(value);
  }

  void removeAtIndexFromStringsSelected(int index) {
    _stringsSelected.removeAt(index);
  }

  void updateStringsSelectedAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _stringsSelected[index] = updateFn(_stringsSelected[index]);
  }

  void insertAtIndexInStringsSelected(int index, String value) {
    _stringsSelected.insert(index, value);
  }

  bool _navOpen = false;
  bool get navOpen => _navOpen;
  set navOpen(bool value) {
    _navOpen = value;
    prefs.setBool('ff_navOpen', value);
  }

  bool _lightdark = false;
  bool get lightdark => _lightdark;
  set lightdark(bool value) {
    _lightdark = value;
  }

  List<String> _datatablelist = ['Disha', 'Amit'];
  List<String> get datatablelist => _datatablelist;
  set datatablelist(List<String> value) {
    _datatablelist = value;
  }

  void addToDatatablelist(String value) {
    _datatablelist.add(value);
  }

  void removeFromDatatablelist(String value) {
    _datatablelist.remove(value);
  }

  void removeAtIndexFromDatatablelist(int index) {
    _datatablelist.removeAt(index);
  }

  void updateDatatablelistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _datatablelist[index] = updateFn(_datatablelist[index]);
  }

  void insertAtIndexInDatatablelist(int index, String value) {
    _datatablelist.insert(index, value);
  }

  List<String> _datatablelist2 = ['Amit Shah', 'Disha Jain', 'Nishant Desai'];
  List<String> get datatablelist2 => _datatablelist2;
  set datatablelist2(List<String> value) {
    _datatablelist2 = value;
  }

  void addToDatatablelist2(String value) {
    _datatablelist2.add(value);
  }

  void removeFromDatatablelist2(String value) {
    _datatablelist2.remove(value);
  }

  void removeAtIndexFromDatatablelist2(int index) {
    _datatablelist2.removeAt(index);
  }

  void updateDatatablelist2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _datatablelist2[index] = updateFn(_datatablelist2[index]);
  }

  void insertAtIndexInDatatablelist2(int index, String value) {
    _datatablelist2.insert(index, value);
  }

  List<String> _databaselist3 = [
    'Disha Jain',
    'Bhakti Budar',
    'Nishant Desai',
    'Akshay Patil',
    'Sagar Katke'
  ];
  List<String> get databaselist3 => _databaselist3;
  set databaselist3(List<String> value) {
    _databaselist3 = value;
  }

  void addToDatabaselist3(String value) {
    _databaselist3.add(value);
  }

  void removeFromDatabaselist3(String value) {
    _databaselist3.remove(value);
  }

  void removeAtIndexFromDatabaselist3(int index) {
    _databaselist3.removeAt(index);
  }

  void updateDatabaselist3AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _databaselist3[index] = updateFn(_databaselist3[index]);
  }

  void insertAtIndexInDatabaselist3(int index, String value) {
    _databaselist3.insert(index, value);
  }

  List<String> _emptyList = [];
  List<String> get emptyList => _emptyList;
  set emptyList(List<String> value) {
    _emptyList = value;
  }

  void addToEmptyList(String value) {
    _emptyList.add(value);
  }

  void removeFromEmptyList(String value) {
    _emptyList.remove(value);
  }

  void removeAtIndexFromEmptyList(int index) {
    _emptyList.removeAt(index);
  }

  void updateEmptyListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _emptyList[index] = updateFn(_emptyList[index]);
  }

  void insertAtIndexInEmptyList(int index, String value) {
    _emptyList.insert(index, value);
  }

  int _loopIndex = 0;
  int get loopIndex => _loopIndex;
  set loopIndex(int value) {
    _loopIndex = value;
  }

  List<DropdownModuleStruct> _dropdowns = [
    DropdownModuleStruct.fromSerializableMap(jsonDecode(
        '{\"dropdownName\":\"item Master Parameter\",\"moduleName\":\"Item Master\"}')),
    DropdownModuleStruct.fromSerializableMap(jsonDecode(
        '{\"dropdownName\":\"Inventory Parameter\",\"moduleName\":\"Inventory\"}')),
    DropdownModuleStruct.fromSerializableMap(jsonDecode(
        '{\"dropdownName\":\"Inward Material - Inward Type\",\"moduleName\":\"Inventory\"}')),
    DropdownModuleStruct.fromSerializableMap(jsonDecode(
        '{\"dropdownName\":\"Inward Material - Inward Location\",\"moduleName\":\"Inventory\"}')),
    DropdownModuleStruct.fromSerializableMap(jsonDecode(
        '{\"dropdownName\":\"Outward Material - Outward Type\",\"moduleName\":\"Inventory\"}')),
    DropdownModuleStruct.fromSerializableMap(jsonDecode(
        '{\"dropdownName\":\"Outward Material - Outward Location\",\"moduleName\":\"Inventory\"}')),
    DropdownModuleStruct.fromSerializableMap(jsonDecode(
        '{\"dropdownName\":\"Outward Material - Issue To\",\"moduleName\":\"Inventory\"}'))
  ];
  List<DropdownModuleStruct> get dropdowns => _dropdowns;
  set dropdowns(List<DropdownModuleStruct> value) {
    _dropdowns = value;
  }

  void addToDropdowns(DropdownModuleStruct value) {
    _dropdowns.add(value);
  }

  void removeFromDropdowns(DropdownModuleStruct value) {
    _dropdowns.remove(value);
  }

  void removeAtIndexFromDropdowns(int index) {
    _dropdowns.removeAt(index);
  }

  void updateDropdownsAtIndex(
    int index,
    DropdownModuleStruct Function(DropdownModuleStruct) updateFn,
  ) {
    _dropdowns[index] = updateFn(_dropdowns[index]);
  }

  void insertAtIndexInDropdowns(int index, DropdownModuleStruct value) {
    _dropdowns.insert(index, value);
  }

  List<int> _rowsKey = [];
  List<int> get rowsKey => _rowsKey;
  set rowsKey(List<int> value) {
    _rowsKey = value;
  }

  void addToRowsKey(int value) {
    _rowsKey.add(value);
  }

  void removeFromRowsKey(int value) {
    _rowsKey.remove(value);
  }

  void removeAtIndexFromRowsKey(int index) {
    _rowsKey.removeAt(index);
  }

  void updateRowsKeyAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _rowsKey[index] = updateFn(_rowsKey[index]);
  }

  void insertAtIndexInRowsKey(int index, int value) {
    _rowsKey.insert(index, value);
  }

  List<dynamic> _ineventoryParameters = [];
  List<dynamic> get ineventoryParameters => _ineventoryParameters;
  set ineventoryParameters(List<dynamic> value) {
    _ineventoryParameters = value;
  }

  void addToIneventoryParameters(dynamic value) {
    _ineventoryParameters.add(value);
  }

  void removeFromIneventoryParameters(dynamic value) {
    _ineventoryParameters.remove(value);
  }

  void removeAtIndexFromIneventoryParameters(int index) {
    _ineventoryParameters.removeAt(index);
  }

  void updateIneventoryParametersAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _ineventoryParameters[index] = updateFn(_ineventoryParameters[index]);
  }

  void insertAtIndexInIneventoryParameters(int index, dynamic value) {
    _ineventoryParameters.insert(index, value);
  }

  List<InwardDataStruct> _item = [];
  List<InwardDataStruct> get item => _item;
  set item(List<InwardDataStruct> value) {
    _item = value;
  }

  void addToItem(InwardDataStruct value) {
    _item.add(value);
  }

  void removeFromItem(InwardDataStruct value) {
    _item.remove(value);
  }

  void removeAtIndexFromItem(int index) {
    _item.removeAt(index);
  }

  void updateItemAtIndex(
    int index,
    InwardDataStruct Function(InwardDataStruct) updateFn,
  ) {
    _item[index] = updateFn(_item[index]);
  }

  void insertAtIndexInItem(int index, InwardDataStruct value) {
    _item.insert(index, value);
  }

  dynamic _emptyJson;
  dynamic get emptyJson => _emptyJson;
  set emptyJson(dynamic value) {
    _emptyJson = value;
  }

  int _inventoryTabIndex = 0;
  int get inventoryTabIndex => _inventoryTabIndex;
  set inventoryTabIndex(int value) {
    _inventoryTabIndex = value;
  }

  List<String> _yAxisList = [
    'Pipeline',
    'Orders On Hand',
    'Cash Required',
    'Cash To be Collected',
    'Cash Blocked',
    'Profit Ability'
  ];
  List<String> get yAxisList => _yAxisList;
  set yAxisList(List<String> value) {
    _yAxisList = value;
  }

  void addToYAxisList(String value) {
    _yAxisList.add(value);
  }

  void removeFromYAxisList(String value) {
    _yAxisList.remove(value);
  }

  void removeAtIndexFromYAxisList(int index) {
    _yAxisList.removeAt(index);
  }

  void updateYAxisListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _yAxisList[index] = updateFn(_yAxisList[index]);
  }

  void insertAtIndexInYAxisList(int index, String value) {
    _yAxisList.insert(index, value);
  }

  List<int> _xAxisList = [100, 80, 40, 80, 50, 20];
  List<int> get xAxisList => _xAxisList;
  set xAxisList(List<int> value) {
    _xAxisList = value;
  }

  void addToXAxisList(int value) {
    _xAxisList.add(value);
  }

  void removeFromXAxisList(int value) {
    _xAxisList.remove(value);
  }

  void removeAtIndexFromXAxisList(int index) {
    _xAxisList.removeAt(index);
  }

  void updateXAxisListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _xAxisList[index] = updateFn(_xAxisList[index]);
  }

  void insertAtIndexInXAxisList(int index, int value) {
    _xAxisList.insert(index, value);
  }

  String _choiceChips = '';
  String get choiceChips => _choiceChips;
  set choiceChips(String value) {
    _choiceChips = value;
  }

  List<String> _contactname = [
    'Yogesh Rane',
    'Amol Vidwans',
    'Raajesh Nair',
    'Rajiv Shah',
    'Rohit Chaudhury'
  ];
  List<String> get contactname => _contactname;
  set contactname(List<String> value) {
    _contactname = value;
  }

  void addToContactname(String value) {
    _contactname.add(value);
  }

  void removeFromContactname(String value) {
    _contactname.remove(value);
  }

  void removeAtIndexFromContactname(int index) {
    _contactname.removeAt(index);
  }

  void updateContactnameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _contactname[index] = updateFn(_contactname[index]);
  }

  void insertAtIndexInContactname(int index, String value) {
    _contactname.insert(index, value);
  }

  List<String> _contactcity = [
    'Mumbai',
    'Pune',
    'Bangalore',
    'Mumbai',
    'Chennai'
  ];
  List<String> get contactcity => _contactcity;
  set contactcity(List<String> value) {
    _contactcity = value;
  }

  void addToContactcity(String value) {
    _contactcity.add(value);
  }

  void removeFromContactcity(String value) {
    _contactcity.remove(value);
  }

  void removeAtIndexFromContactcity(int index) {
    _contactcity.removeAt(index);
  }

  void updateContactcityAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _contactcity[index] = updateFn(_contactcity[index]);
  }

  void insertAtIndexInContactcity(int index, String value) {
    _contactcity.insert(index, value);
  }

  List<String> _contactCompany = [
    'Elde Info Solutions Pvt Ltd.',
    'Aarna Happy Earth Private Ltd',
    'iVOOMi Mobility Pvt. Ltd.',
    'Reliance Nippon Insurance Company Ltd.',
    'Angre Port Pvt. Ltd.'
  ];
  List<String> get contactCompany => _contactCompany;
  set contactCompany(List<String> value) {
    _contactCompany = value;
  }

  void addToContactCompany(String value) {
    _contactCompany.add(value);
  }

  void removeFromContactCompany(String value) {
    _contactCompany.remove(value);
  }

  void removeAtIndexFromContactCompany(int index) {
    _contactCompany.removeAt(index);
  }

  void updateContactCompanyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _contactCompany[index] = updateFn(_contactCompany[index]);
  }

  void insertAtIndexInContactCompany(int index, String value) {
    _contactCompany.insert(index, value);
  }

  List<String> _status = [
    'Site Visited',
    'New',
    'Estimation',
    'Discussion',
    'Lead Close'
  ];
  List<String> get status => _status;
  set status(List<String> value) {
    _status = value;
  }

  void addToStatus(String value) {
    _status.add(value);
  }

  void removeFromStatus(String value) {
    _status.remove(value);
  }

  void removeAtIndexFromStatus(int index) {
    _status.removeAt(index);
  }

  void updateStatusAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _status[index] = updateFn(_status[index]);
  }

  void insertAtIndexInStatus(int index, String value) {
    _status.insert(index, value);
  }

  List<DateTime> _folliowup = [
    DateTime.fromMillisecondsSinceEpoch(1711629268917),
    DateTime.fromMillisecondsSinceEpoch(1711715640000),
    DateTime.fromMillisecondsSinceEpoch(1710419640000),
    DateTime.fromMillisecondsSinceEpoch(1710246840000),
    DateTime.fromMillisecondsSinceEpoch(1711802100000)
  ];
  List<DateTime> get folliowup => _folliowup;
  set folliowup(List<DateTime> value) {
    _folliowup = value;
  }

  void addToFolliowup(DateTime value) {
    _folliowup.add(value);
  }

  void removeFromFolliowup(DateTime value) {
    _folliowup.remove(value);
  }

  void removeAtIndexFromFolliowup(int index) {
    _folliowup.removeAt(index);
  }

  void updateFolliowupAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    _folliowup[index] = updateFn(_folliowup[index]);
  }

  void insertAtIndexInFolliowup(int index, DateTime value) {
    _folliowup.insert(index, value);
  }

  List<dynamic> _tasks = [];
  List<dynamic> get tasks => _tasks;
  set tasks(List<dynamic> value) {
    _tasks = value;
  }

  void addToTasks(dynamic value) {
    _tasks.add(value);
  }

  void removeFromTasks(dynamic value) {
    _tasks.remove(value);
  }

  void removeAtIndexFromTasks(int index) {
    _tasks.removeAt(index);
  }

  void updateTasksAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tasks[index] = updateFn(_tasks[index]);
  }

  void insertAtIndexInTasks(int index, dynamic value) {
    _tasks.insert(index, value);
  }

  final _companiesManager = FutureRequestManager<List<CompanyManagementRow>>();
  Future<List<CompanyManagementRow>> companies({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CompanyManagementRow>> Function() requestFn,
  }) =>
      _companiesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCompaniesCache() => _companiesManager.clear();
  void clearCompaniesCacheKey(String? uniqueKey) =>
      _companiesManager.clearRequest(uniqueKey);

  final _activeCompaniesManager =
      FutureRequestManager<List<CompanyManagementRow>>();
  Future<List<CompanyManagementRow>> activeCompanies({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CompanyManagementRow>> Function() requestFn,
  }) =>
      _activeCompaniesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearActiveCompaniesCache() => _activeCompaniesManager.clear();
  void clearActiveCompaniesCacheKey(String? uniqueKey) =>
      _activeCompaniesManager.clearRequest(uniqueKey);

  final _itemsManager = FutureRequestManager<List<ItemManagementRow>>();
  Future<List<ItemManagementRow>> items({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ItemManagementRow>> Function() requestFn,
  }) =>
      _itemsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearItemsCache() => _itemsManager.clear();
  void clearItemsCacheKey(String? uniqueKey) =>
      _itemsManager.clearRequest(uniqueKey);

  final _approvalUsersManager = FutureRequestManager<List<ApprovalUserRow>>();
  Future<List<ApprovalUserRow>> approvalUsers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ApprovalUserRow>> Function() requestFn,
  }) =>
      _approvalUsersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearApprovalUsersCache() => _approvalUsersManager.clear();
  void clearApprovalUsersCacheKey(String? uniqueKey) =>
      _approvalUsersManager.clearRequest(uniqueKey);

  final _activeUsersManager = FutureRequestManager<List<UserManagementRow>>();
  Future<List<UserManagementRow>> activeUsers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UserManagementRow>> Function() requestFn,
  }) =>
      _activeUsersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearActiveUsersCache() => _activeUsersManager.clear();
  void clearActiveUsersCacheKey(String? uniqueKey) =>
      _activeUsersManager.clearRequest(uniqueKey);

  final _inwardsManager =
      FutureRequestManager<List<InwardInventoryManagementRow>>();
  Future<List<InwardInventoryManagementRow>> inwards({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<InwardInventoryManagementRow>> Function() requestFn,
  }) =>
      _inwardsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearInwardsCache() => _inwardsManager.clear();
  void clearInwardsCacheKey(String? uniqueKey) =>
      _inwardsManager.clearRequest(uniqueKey);

  final _inwardManager =
      FutureRequestManager<List<InwardInventoryTableManagementRow>>();
  Future<List<InwardInventoryTableManagementRow>> inward({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<InwardInventoryTableManagementRow>> Function()
        requestFn,
  }) =>
      _inwardManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearInwardCache() => _inwardManager.clear();
  void clearInwardCacheKey(String? uniqueKey) =>
      _inwardManager.clearRequest(uniqueKey);

  final _lotWiseInventoryManager =
      FutureRequestManager<List<LotWiseInventoryManagementRow>>();
  Future<List<LotWiseInventoryManagementRow>> lotWiseInventory({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<LotWiseInventoryManagementRow>> Function() requestFn,
  }) =>
      _lotWiseInventoryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLotWiseInventoryCache() => _lotWiseInventoryManager.clear();
  void clearLotWiseInventoryCacheKey(String? uniqueKey) =>
      _lotWiseInventoryManager.clearRequest(uniqueKey);

  final _movingAverageInventoryManager =
      FutureRequestManager<List<MovingAverageInventoryManagementRow>>();
  Future<List<MovingAverageInventoryManagementRow>> movingAverageInventory({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<MovingAverageInventoryManagementRow>> Function()
        requestFn,
  }) =>
      _movingAverageInventoryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMovingAverageInventoryCache() =>
      _movingAverageInventoryManager.clear();
  void clearMovingAverageInventoryCacheKey(String? uniqueKey) =>
      _movingAverageInventoryManager.clearRequest(uniqueKey);

  final _inwardHistoryManager =
      FutureRequestManager<List<InwardInventoryHistoryManagementRow>>();
  Future<List<InwardInventoryHistoryManagementRow>> inwardHistory({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<InwardInventoryHistoryManagementRow>> Function()
        requestFn,
  }) =>
      _inwardHistoryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearInwardHistoryCache() => _inwardHistoryManager.clear();
  void clearInwardHistoryCacheKey(String? uniqueKey) =>
      _inwardHistoryManager.clearRequest(uniqueKey);

  final _outwardsManager =
      FutureRequestManager<List<OutwardInventoryManagementRow>>();
  Future<List<OutwardInventoryManagementRow>> outwards({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<OutwardInventoryManagementRow>> Function() requestFn,
  }) =>
      _outwardsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearOutwardsCache() => _outwardsManager.clear();
  void clearOutwardsCacheKey(String? uniqueKey) =>
      _outwardsManager.clearRequest(uniqueKey);

  final _companyUsersManager = FutureRequestManager<List<UserManagementRow>>();
  Future<List<UserManagementRow>> companyUsers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UserManagementRow>> Function() requestFn,
  }) =>
      _companyUsersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCompanyUsersCache() => _companyUsersManager.clear();
  void clearCompanyUsersCacheKey(String? uniqueKey) =>
      _companyUsersManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
