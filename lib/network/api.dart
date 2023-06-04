import 'dart:async';
import 'dart:io';
import 'package:e_commerce/utilites/widgets/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallApi {
  static String baseurl = 'https://ecommerce.6sigmacode.com/';
  static String msg = '';

  static Future<http.Response?> postData(
      {required Map<String, dynamic> data,
      required String apiUrl,
      required BuildContext context}) async {
    try {
      msg = '';
      var fullUrl = baseurl + apiUrl;

      return await http.post(Uri.parse(fullUrl),
          body: data, headers: _setHeaders());
    } on IOException catch (e) {
      debugPrint('Socket Error: $e');
      msg = 'Socket Error: $e';
    } on Error catch (e) {
      debugPrint('General Error: $e');
      msg = 'General Error: $e';
    } on TimeoutException catch (e) {
      debugPrint('Timeout Error: $e');
      msg = 'Timeout Error: $e';
    } on FormatException catch (e) {
      debugPrint('Format Error: $e');
      msg = 'Format Error: $e';
    }

    if (msg != '') {
      ShowMyDialog.showMsg(context, msg);
    }

    // Add a default return statement with a value of null or throw an exception
    return null;
  }

  static Future<http.Response?> getData(
      {required String apiUrl, required BuildContext context}) async {
    try {
      msg = '';
      var fullUrl = baseurl + apiUrl;
      return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
    } on IOException catch (e) {
      debugPrint('Socket Error: $e');
      msg = 'Socket Error: $e';
    } on Error catch (e) {
      debugPrint('General Error: $e');
      msg = 'General Error: $e';
    } on TimeoutException catch (e) {
      debugPrint('Timeout Error: $e');
      msg = 'Timeout Error: $e';
    } on FormatException catch (e) {
      debugPrint('Timeout Error: $e');
      msg = 'Timeout Error: $e';
    }

    if (msg != '') {
      ShowMyDialog.showMsg(context, msg);
      debugPrint(msg);
    }
    return null;
  }

  static _setHeaders() => {'Content-Type': 'application/x-www-form-urlencoded'};
}
