import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
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
  set stringsSelected(List<String> _value) {
    _stringsSelected = _value;
  }

  void addToStringsSelected(String _value) {
    _stringsSelected.add(_value);
  }

  void removeFromStringsSelected(String _value) {
    _stringsSelected.remove(_value);
  }

  void removeAtIndexFromStringsSelected(int _index) {
    _stringsSelected.removeAt(_index);
  }

  void updateStringsSelectedAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _stringsSelected[_index] = updateFn(_stringsSelected[_index]);
  }

  void insertAtIndexInStringsSelected(int _index, String _value) {
    _stringsSelected.insert(_index, _value);
  }

  bool _navOpen = false;
  bool get navOpen => _navOpen;
  set navOpen(bool _value) {
    _navOpen = _value;
    prefs.setBool('ff_navOpen', _value);
  }

  bool _lightdark = false;
  bool get lightdark => _lightdark;
  set lightdark(bool _value) {
    _lightdark = _value;
  }

  List<String> _datatablelist = ['Disha', 'Amit'];
  List<String> get datatablelist => _datatablelist;
  set datatablelist(List<String> _value) {
    _datatablelist = _value;
  }

  void addToDatatablelist(String _value) {
    _datatablelist.add(_value);
  }

  void removeFromDatatablelist(String _value) {
    _datatablelist.remove(_value);
  }

  void removeAtIndexFromDatatablelist(int _index) {
    _datatablelist.removeAt(_index);
  }

  void updateDatatablelistAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _datatablelist[_index] = updateFn(_datatablelist[_index]);
  }

  void insertAtIndexInDatatablelist(int _index, String _value) {
    _datatablelist.insert(_index, _value);
  }

  List<String> _datatablelist2 = ['Amit Shah', 'Disha Jain', 'Nishant Desai'];
  List<String> get datatablelist2 => _datatablelist2;
  set datatablelist2(List<String> _value) {
    _datatablelist2 = _value;
  }

  void addToDatatablelist2(String _value) {
    _datatablelist2.add(_value);
  }

  void removeFromDatatablelist2(String _value) {
    _datatablelist2.remove(_value);
  }

  void removeAtIndexFromDatatablelist2(int _index) {
    _datatablelist2.removeAt(_index);
  }

  void updateDatatablelist2AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _datatablelist2[_index] = updateFn(_datatablelist2[_index]);
  }

  void insertAtIndexInDatatablelist2(int _index, String _value) {
    _datatablelist2.insert(_index, _value);
  }

  List<String> _databaselist3 = [
    'Disha Jain',
    'Bhakti Budar',
    'Nishant Desai',
    'Akshay Patil',
    'Sagar Katke'
  ];
  List<String> get databaselist3 => _databaselist3;
  set databaselist3(List<String> _value) {
    _databaselist3 = _value;
  }

  void addToDatabaselist3(String _value) {
    _databaselist3.add(_value);
  }

  void removeFromDatabaselist3(String _value) {
    _databaselist3.remove(_value);
  }

  void removeAtIndexFromDatabaselist3(int _index) {
    _databaselist3.removeAt(_index);
  }

  void updateDatabaselist3AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _databaselist3[_index] = updateFn(_databaselist3[_index]);
  }

  void insertAtIndexInDatabaselist3(int _index, String _value) {
    _databaselist3.insert(_index, _value);
  }

  List<String> _emptyList = [];
  List<String> get emptyList => _emptyList;
  set emptyList(List<String> _value) {
    _emptyList = _value;
  }

  void addToEmptyList(String _value) {
    _emptyList.add(_value);
  }

  void removeFromEmptyList(String _value) {
    _emptyList.remove(_value);
  }

  void removeAtIndexFromEmptyList(int _index) {
    _emptyList.removeAt(_index);
  }

  void updateEmptyListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _emptyList[_index] = updateFn(_emptyList[_index]);
  }

  void insertAtIndexInEmptyList(int _index, String _value) {
    _emptyList.insert(_index, _value);
  }

  int _loopIndex = 0;
  int get loopIndex => _loopIndex;
  set loopIndex(int _value) {
    _loopIndex = _value;
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
  set dropdowns(List<DropdownModuleStruct> _value) {
    _dropdowns = _value;
  }

  void addToDropdowns(DropdownModuleStruct _value) {
    _dropdowns.add(_value);
  }

  void removeFromDropdowns(DropdownModuleStruct _value) {
    _dropdowns.remove(_value);
  }

  void removeAtIndexFromDropdowns(int _index) {
    _dropdowns.removeAt(_index);
  }

  void updateDropdownsAtIndex(
    int _index,
    DropdownModuleStruct Function(DropdownModuleStruct) updateFn,
  ) {
    _dropdowns[_index] = updateFn(_dropdowns[_index]);
  }

  void insertAtIndexInDropdowns(int _index, DropdownModuleStruct _value) {
    _dropdowns.insert(_index, _value);
  }

  List<int> _rowsKey = [];
  List<int> get rowsKey => _rowsKey;
  set rowsKey(List<int> _value) {
    _rowsKey = _value;
  }

  void addToRowsKey(int _value) {
    _rowsKey.add(_value);
  }

  void removeFromRowsKey(int _value) {
    _rowsKey.remove(_value);
  }

  void removeAtIndexFromRowsKey(int _index) {
    _rowsKey.removeAt(_index);
  }

  void updateRowsKeyAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _rowsKey[_index] = updateFn(_rowsKey[_index]);
  }

  void insertAtIndexInRowsKey(int _index, int _value) {
    _rowsKey.insert(_index, _value);
  }

  List<dynamic> _ineventoryParameters = [];
  List<dynamic> get ineventoryParameters => _ineventoryParameters;
  set ineventoryParameters(List<dynamic> _value) {
    _ineventoryParameters = _value;
  }

  void addToIneventoryParameters(dynamic _value) {
    _ineventoryParameters.add(_value);
  }

  void removeFromIneventoryParameters(dynamic _value) {
    _ineventoryParameters.remove(_value);
  }

  void removeAtIndexFromIneventoryParameters(int _index) {
    _ineventoryParameters.removeAt(_index);
  }

  void updateIneventoryParametersAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _ineventoryParameters[_index] = updateFn(_ineventoryParameters[_index]);
  }

  void insertAtIndexInIneventoryParameters(int _index, dynamic _value) {
    _ineventoryParameters.insert(_index, _value);
  }

  List<InwardDataStruct> _item = [];
  List<InwardDataStruct> get item => _item;
  set item(List<InwardDataStruct> _value) {
    _item = _value;
  }

  void addToItem(InwardDataStruct _value) {
    _item.add(_value);
  }

  void removeFromItem(InwardDataStruct _value) {
    _item.remove(_value);
  }

  void removeAtIndexFromItem(int _index) {
    _item.removeAt(_index);
  }

  void updateItemAtIndex(
    int _index,
    InwardDataStruct Function(InwardDataStruct) updateFn,
  ) {
    _item[_index] = updateFn(_item[_index]);
  }

  void insertAtIndexInItem(int _index, InwardDataStruct _value) {
    _item.insert(_index, _value);
  }

  dynamic _emptyJson;
  dynamic get emptyJson => _emptyJson;
  set emptyJson(dynamic _value) {
    _emptyJson = _value;
  }

  int _inventoryTabIndex = 0;
  int get inventoryTabIndex => _inventoryTabIndex;
  set inventoryTabIndex(int _value) {
    _inventoryTabIndex = _value;
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
  set yAxisList(List<String> _value) {
    _yAxisList = _value;
  }

  void addToYAxisList(String _value) {
    _yAxisList.add(_value);
  }

  void removeFromYAxisList(String _value) {
    _yAxisList.remove(_value);
  }

  void removeAtIndexFromYAxisList(int _index) {
    _yAxisList.removeAt(_index);
  }

  void updateYAxisListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _yAxisList[_index] = updateFn(_yAxisList[_index]);
  }

  void insertAtIndexInYAxisList(int _index, String _value) {
    _yAxisList.insert(_index, _value);
  }

  List<int> _xAxisList = [100, 80, 40, 80, 50, 20];
  List<int> get xAxisList => _xAxisList;
  set xAxisList(List<int> _value) {
    _xAxisList = _value;
  }

  void addToXAxisList(int _value) {
    _xAxisList.add(_value);
  }

  void removeFromXAxisList(int _value) {
    _xAxisList.remove(_value);
  }

  void removeAtIndexFromXAxisList(int _index) {
    _xAxisList.removeAt(_index);
  }

  void updateXAxisListAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _xAxisList[_index] = updateFn(_xAxisList[_index]);
  }

  void insertAtIndexInXAxisList(int _index, int _value) {
    _xAxisList.insert(_index, _value);
  }

  String _choiceChips = '';
  String get choiceChips => _choiceChips;
  set choiceChips(String _value) {
    _choiceChips = _value;
  }

  List<String> _contactname = [
    'Yogesh Rane',
    'Amol Vidwans',
    'Raajesh Nair',
    'Rajiv Shah',
    'Rohit Chaudhury'
  ];
  List<String> get contactname => _contactname;
  set contactname(List<String> _value) {
    _contactname = _value;
  }

  void addToContactname(String _value) {
    _contactname.add(_value);
  }

  void removeFromContactname(String _value) {
    _contactname.remove(_value);
  }

  void removeAtIndexFromContactname(int _index) {
    _contactname.removeAt(_index);
  }

  void updateContactnameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _contactname[_index] = updateFn(_contactname[_index]);
  }

  void insertAtIndexInContactname(int _index, String _value) {
    _contactname.insert(_index, _value);
  }

  List<String> _contactcity = [
    'Mumbai',
    'Pune',
    'Bangalore',
    'Mumbai',
    'Chennai'
  ];
  List<String> get contactcity => _contactcity;
  set contactcity(List<String> _value) {
    _contactcity = _value;
  }

  void addToContactcity(String _value) {
    _contactcity.add(_value);
  }

  void removeFromContactcity(String _value) {
    _contactcity.remove(_value);
  }

  void removeAtIndexFromContactcity(int _index) {
    _contactcity.removeAt(_index);
  }

  void updateContactcityAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _contactcity[_index] = updateFn(_contactcity[_index]);
  }

  void insertAtIndexInContactcity(int _index, String _value) {
    _contactcity.insert(_index, _value);
  }

  List<String> _contactCompany = [
    'Elde Info Solutions Pvt Ltd.',
    'Aarna Happy Earth Private Ltd',
    'iVOOMi Mobility Pvt. Ltd.',
    'Reliance Nippon Insurance Company Ltd.',
    'Angre Port Pvt. Ltd.'
  ];
  List<String> get contactCompany => _contactCompany;
  set contactCompany(List<String> _value) {
    _contactCompany = _value;
  }

  void addToContactCompany(String _value) {
    _contactCompany.add(_value);
  }

  void removeFromContactCompany(String _value) {
    _contactCompany.remove(_value);
  }

  void removeAtIndexFromContactCompany(int _index) {
    _contactCompany.removeAt(_index);
  }

  void updateContactCompanyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _contactCompany[_index] = updateFn(_contactCompany[_index]);
  }

  void insertAtIndexInContactCompany(int _index, String _value) {
    _contactCompany.insert(_index, _value);
  }

  List<String> _status = [
    'Site Visited',
    'New',
    'Estimation',
    'Discussion',
    'Lead Close'
  ];
  List<String> get status => _status;
  set status(List<String> _value) {
    _status = _value;
  }

  void addToStatus(String _value) {
    _status.add(_value);
  }

  void removeFromStatus(String _value) {
    _status.remove(_value);
  }

  void removeAtIndexFromStatus(int _index) {
    _status.removeAt(_index);
  }

  void updateStatusAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _status[_index] = updateFn(_status[_index]);
  }

  void insertAtIndexInStatus(int _index, String _value) {
    _status.insert(_index, _value);
  }

  List<DateTime> _folliowup = [
    DateTime.fromMillisecondsSinceEpoch(1711629268917),
    DateTime.fromMillisecondsSinceEpoch(1711715640000),
    DateTime.fromMillisecondsSinceEpoch(1710419640000),
    DateTime.fromMillisecondsSinceEpoch(1710246840000),
    DateTime.fromMillisecondsSinceEpoch(1711802100000)
  ];
  List<DateTime> get folliowup => _folliowup;
  set folliowup(List<DateTime> _value) {
    _folliowup = _value;
  }

  void addToFolliowup(DateTime _value) {
    _folliowup.add(_value);
  }

  void removeFromFolliowup(DateTime _value) {
    _folliowup.remove(_value);
  }

  void removeAtIndexFromFolliowup(int _index) {
    _folliowup.removeAt(_index);
  }

  void updateFolliowupAtIndex(
    int _index,
    DateTime Function(DateTime) updateFn,
  ) {
    _folliowup[_index] = updateFn(_folliowup[_index]);
  }

  void insertAtIndexInFolliowup(int _index, DateTime _value) {
    _folliowup.insert(_index, _value);
  }

  List<dynamic> _tasks = [];
  List<dynamic> get tasks => _tasks;
  set tasks(List<dynamic> _value) {
    _tasks = _value;
  }

  void addToTasks(dynamic _value) {
    _tasks.add(_value);
  }

  void removeFromTasks(dynamic _value) {
    _tasks.remove(_value);
  }

  void removeAtIndexFromTasks(int _index) {
    _tasks.removeAt(_index);
  }

  void updateTasksAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tasks[_index] = updateFn(_tasks[_index]);
  }

  void insertAtIndexInTasks(int _index, dynamic _value) {
    _tasks.insert(_index, _value);
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
