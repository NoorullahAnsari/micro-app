import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

dynamic createJson(
  List<String> key,
  List<String> value,
) {
  // return json with key and value and empty string if value is empty list
  Map<String, dynamic> json = {};
  for (int i = 0; i < key.length; i++) {
    if (value.isEmpty) {
      json[key[i]] = '';
    } else {
      json[key[i]] = value[i];
    }
  }
  return json;
}

String fetchValueFromJson(
  dynamic json,
  String key,
) {
  // return the value for key in json or empty string if key not present in json
  print(key);
  print(json);
  if (json.containsKey(key)) {
    return json[key];
  } else {
    return '';
  }
}

bool deleteParameter(
  List<dynamic> jsonList,
  String key,
) {
  for (var json in jsonList) {
    if (json.containsKey(key)) {
      return true;
    }
  }
  return false;
}

List<String> joinList(
  List<String> list1,
  List<String> list2,
  String separator,
) {
  // combine two list by '-'
  List<String> combinedList = [];
  for (int i = 0; i < math.max(list1.length, list2.length); i++) {
    String item1 = i < list1.length ? list1[i] : '';
    String item2 = i < list2.length ? list2[i] : '';
    combinedList.add('$item1$separator$item2');
  }
  return combinedList;
}

String uniqueBySeparator(
  String value,
  String separator,
  int index,
) {
  // separate value by separator and return value at index
  final List<String> values = value.split(separator);
  if (index >= 0 && index < values.length) {
    return values[index];
  } else {
    return '';
  }
}

String scanItem(
  String separator,
  String scanValue,
  int index,
) {
  // separate scanValueby separator and return value at index
  final List<String> values = scanValue.split(separator);
  if (index >= 0 && index < values.length) {
    return values[index];
  } else {
    return '';
  }
}

List<String> stringListToImagePathList(List<String> paths) {
  List<String> imagePaths = [];

  for (String path in paths) {
    // Check if the file extension indicates an image file
    imagePaths.add(path);
  }

  return imagePaths;
}

double movingAvg(
  List<double> quantity,
  List<double> rate,
) {
  // return addition of multiplication of quatity and rate and divide it by sum of quantity
  double sumQuantity = 0;
  double sumQuantityRate = 0;
  for (int i = 0; i < quantity.length; i++) {
    sumQuantity += quantity[i];
    sumQuantityRate += quantity[i] * rate[i];
  }
  return sumQuantityRate / sumQuantity;
}
