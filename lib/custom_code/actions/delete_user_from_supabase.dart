// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;

Future deleteUserFromSupabase(
  String userId,
  String accessToken,
) async {
  final String apiUrl =
      'https://ohxojdqymoudkyfoozps.supabase.co/rest/v1/auth/user?id=eq.$userId';

  try {
    final response = await http.delete(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      print('User deleted successfully');
    } else {
      print('Failed to delete user. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error deleting user: $e');
  }
}
