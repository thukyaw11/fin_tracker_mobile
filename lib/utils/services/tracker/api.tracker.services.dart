import 'dart:convert';
import 'package:expense_tracker_mobile/models/m_income_expense.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:expense_tracker_mobile/utils/constants/api_constants.dart';

class TrackerApiService extends GetxService {
  Future<List<Map<String, dynamic>>> getAllWallets() async {
    List<Map<String, dynamic>> wallets = [];
    String? token = await SharedPreferenceService.getAccessToken();

    final walletUrl = Uri.parse('${ApiConstants.url}/wallet');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(walletUrl, headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        wallets =
            List<Map<String, dynamic>>.from(responseData['_data']['data']);
      } else {
        print('Failed to load wallets: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching wallets: $e');
    }

    return wallets;
  }

  Future<IncomeExpense> getIncomeExpense(
      String transactionType, String groupId) async {
    String? token = await SharedPreferenceService.getAccessToken();

    final incomeExpenseUrl =
        Uri.parse('${ApiConstants.url}/transaction').replace(queryParameters: {
      'transactionType': transactionType,
      'groupId': groupId,
    });

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(incomeExpenseUrl, headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return IncomeExpense.fromJson(responseData['_data']);
      } else {
        throw Exception('Failed to load income/expense');
      }
    } catch (e) {
      rethrow;
    }
  }
}