import 'dart:convert';
import 'package:expense_tracker_mobile/controllers/alert/m_alert_model.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:expense_tracker_mobile/utils/constants/api_constants.dart';

class AlertApiService extends GetxService {
  Future<List<AlertModel>> getAllAlerts({required String type}) async {
    String? token = await SharedPreferenceService.getAccessToken();

    final alertUrl = Uri.parse('${ApiConstants.url}/alert');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(alertUrl, headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        List<dynamic> alertsJson = responseData['_data']['data'];
        List<AlertModel> alertList = [];
        for (var r in alertsJson) {
          alertList.add(AlertModel.fromJson(json: r));
        }
        return alertList;
      } else {
        throw Exception('Failed to load alert list');
      }
    } catch (e) {
      rethrow;
    }
  }
}
