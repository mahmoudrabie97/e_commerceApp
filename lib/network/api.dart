import 'dart:async';
import 'dart:io';
import 'package:e_commerce/utilites/widgets/showdialog.dart';
import 'package:http/http.dart' as http;

// import '../widget/btns/alertMsg.dart';

class CallApi {
  static String baseurl = 'https://ecommerce.6sigmacode.com/';
  static String msg = '';

  static Future<http.Response?> postData(data, apiUrl, context) async {
    try {
      msg = '';
      var fullUrl = baseurl + apiUrl;

      return await http.post(Uri.parse(fullUrl),
          body: data, headers: _setHeaders());
    } on IOException catch (e) {
      print('Socket Error: $e');
      msg = 'Socket Error: $e';
    } on Error catch (e) {
      print('General Error: $e');
      msg = 'General Error: $e';
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
      msg = 'Timeout Error: $e';
    } on FormatException catch (e) {
      print('Format Error: $e');
      msg = 'Format Error: $e';
    }

    if (msg != '') {
      ShowMyDialog.showMsg(context, msg);
    }

    // Add a default return statement with a value of null or throw an exception
    return null;
  }

  getData(apiUrl, context) async {
    try {
      msg = '';
      var fullUrl = baseurl + apiUrl;
      return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
    } on IOException catch (e) {
      print('Socket Error: $e');
      msg = 'Socket Error: $e';
    } on Error catch (e) {
      print('General Error: $e');
      msg = 'General Error: $e';
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
      msg = 'Timeout Error: $e';
    } on FormatException catch (e) {
      print('Timeout Error: $e');
      msg = 'Timeout Error: $e';
    }

    if (msg != '') {
      ShowMyDialog.showMsg(context, msg);
      print(msg);
    }
  }

  static _setHeaders() => {'Content-Type': 'application/x-www-form-urlencoded'};
}
