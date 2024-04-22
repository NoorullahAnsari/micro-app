
abstract class FFAppConstants {
  static const List<String> modules = ['User', 'Item Master', 'Inventory'];
  static const List<String> superAdminUserRoles = [
    'Admin',
    'Operate',
    'View',
    'Support',
    'NA'
  ];
  static const List<String> userRoles = ['Admin', 'Operate', 'View', 'NA'];
  static const List<String> userManagementRolesFoSuperAdmin = [
    'Admin',
    'View',
    'Support'
  ];
  static const List<String> userManagementRolesForAdmin = ['Admin', 'View'];
  static const List<String> processName = ['Inventory Inward'];
}
