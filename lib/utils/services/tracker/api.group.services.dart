import 'dart:convert';
import 'package:expense_tracker_mobile/models/m_group.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:expense_tracker_mobile/utils/constants/api_constants.dart';

class GroupApiService extends GetxService {
  Future<List<Group>> getAllGroups() async {
    String? token = await SharedPreferenceService.getAccessToken();

    final groupUrl = Uri.parse('${ApiConstants.url}/group');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(groupUrl, headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        List<dynamic> groupsJson = responseData['_data']['data'];
        return Group.fromJsonList(groupsJson);
      } else {
        throw Exception('Failed to load income/expense');
      }
    } catch (e) {
      rethrow;
    }
  }
}
