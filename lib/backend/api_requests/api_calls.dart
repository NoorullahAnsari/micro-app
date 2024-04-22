import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateUserCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create User',
      apiUrl: 'https://ohxojdqymoudkyfoozps.supabase.co/auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9oeG9qZHF5bW91ZGt5Zm9venBzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk5NTgyMjMsImV4cCI6MjAyNTUzNDIyM30.g6dLgSSeUT0uWwS_4IRdLqwmA9SNkjyZmDraGKe6-I8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.msg''',
      ));
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  static String? userAccessToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

class InsertUserCall {
  static Future<ApiCallResponse> call({
    String? status = '',
    String? email = '',
    String? password = '',
    String? fullName = '',
    String? phone = '',
    bool? isOwner,
    bool? isSuperAdmin,
    String? userModule = '',
    String? company = '',
    String? itemMasterModule = '',
    String? inventoryModule = '',
  }) async {
    final ffApiRequestBody = '''
{ "email": "${email}", "password": "${password}", "fullName": "${fullName}", "phone": ${phone}, "company": "${company}", "status": "${status}", "isOwner": ${isOwner}, "isSuperAdmin": ${isSuperAdmin}, "userModule": "${userModule}", "itemMasterModule": "${itemMasterModule}", "inventoryModule": "${inventoryModule}" }''';
    return ApiManager.instance.makeApiCall(
      callName: 'Insert User',
      apiUrl: 'https://ohxojdqymoudkyfoozps.supabase.co/rest/v1/userManagement',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9oeG9qZHF5bW91ZGt5Zm9venBzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk5NTgyMjMsImV4cCI6MjAyNTUzNDIyM30.g6dLgSSeUT0uWwS_4IRdLqwmA9SNkjyZmDraGKe6-I8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9oeG9qZHF5bW91ZGt5Zm9venBzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk5NTgyMjMsImV4cCI6MjAyNTUzNDIyM30.g6dLgSSeUT0uWwS_4IRdLqwmA9SNkjyZmDraGKe6-I8',
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details''',
      ));
}

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl:
          'https://ohxojdqymoudkyfoozps.supabase.co/auth/v1/token?grant_type=password',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9oeG9qZHF5bW91ZGt5Zm9venBzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk5NTgyMjMsImV4cCI6MjAyNTUzNDIyM30.g6dLgSSeUT0uWwS_4IRdLqwmA9SNkjyZmDraGKe6-I8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_description''',
      ));
  static String? accessToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

class UpdateUserCall {
  static Future<ApiCallResponse> call({
    String? accessToken = '',
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User',
      apiUrl: 'https://ohxojdqymoudkyfoozps.supabase.co/auth/v1/user',
      callType: ApiCallType.PUT,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9oeG9qZHF5bW91ZGt5Zm9venBzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk5NTgyMjMsImV4cCI6MjAyNTUzNDIyM30.g6dLgSSeUT0uWwS_4IRdLqwmA9SNkjyZmDraGKe6-I8',
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.msg''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
