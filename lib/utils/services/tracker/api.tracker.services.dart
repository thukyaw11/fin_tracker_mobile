import 'dart:convert';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:expense_tracker_mobile/utils/constants/api_constants.dart';

class TrackerApiService extends GetxService {
  Future<List> getAllWallets() async {
    List wallets = [];
    String? token = await SharedPreferenceService.getAccessToken();
    if (token != null) {
      print('Access Token: $token');
      // Use the token for API calls or other logic
    } else {
      print('No access token found.');
      // Handle the case where the token is null
    }
    final walletUrl = Uri.parse('${ApiConstants.url}/wallet');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(walletUrl, headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        wallets = responseData['_data']['data'];
      } else {
        // Handle error responses
        print('Failed to load wallets: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error fetching wallets: $e');
    }

    // Return the list of wallets
    return wallets;
  }
}
