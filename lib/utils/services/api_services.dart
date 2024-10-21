import 'package:expense_tracker_mobile/utils/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import '../helpers/logger.dart';

class ApiService extends GetxService {
  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('${ApiConstants.url}/auth/register');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 201) {
        Fluttertoast.showToast(
            msg: "Registration successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Failed to register",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      // Exception handling
    }
  }

  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    final loginUrl = Uri.parse('${ApiConstants.url}/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'email': email,
      'password': password,
    });
    try {
      final response = await http.post(loginUrl, headers: headers, body: body);
      Logger.superPrint(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        Logger.superPrint(responseData);
        final token = responseData['_data']['token'];
        return token;
      } else {
        print('Login failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> validateAuth({
    required String token,
  }) async {
    final validateUrl = Uri.parse('${ApiConstants.url}/auth/me');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    try {
      final responseData = await http.get(validateUrl, headers: headers);
      if (responseData.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
