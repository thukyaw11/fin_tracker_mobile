import 'dart:convert';
import 'package:expense_tracker_mobile/models/m_transaction_record.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:expense_tracker_mobile/utils/constants/api_constants.dart';

class TransactionApiService extends GetxService {
  Future<List<Transaction>> getAllTransactions() async {
    String? token = await SharedPreferenceService.getAccessToken();

    final transactionUrl = Uri.parse('${ApiConstants.url}/transaction/records');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(transactionUrl, headers: headers);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        List<dynamic> transactionJson = responseData['_data']['data'];
        return Transaction.fromJsonList(transactionJson);
      } else {
        throw Exception('Failed to load transaction list');
      }
    } catch (e) {
      rethrow;
    }
  }
}
