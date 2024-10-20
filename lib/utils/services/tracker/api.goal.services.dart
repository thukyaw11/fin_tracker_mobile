import 'dart:convert';
import 'package:expense_tracker_mobile/controllers/goal/c_goal.dart';
import 'package:expense_tracker_mobile/controllers/goal/m_goal_model.dart';
import 'package:expense_tracker_mobile/models/m_group.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:expense_tracker_mobile/utils/constants/api_constants.dart';

class GoalApiService extends GetxService {
  Future<List<GoalModel>> getAllGoals({required String type}) async {
    String? token = await SharedPreferenceService.getAccessToken();

    final goalUrl = Uri.parse('${ApiConstants.url}/goal?status=$type');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(goalUrl, headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        List<dynamic> goalsJson = responseData['_data']['data'];
        List<GoalModel> goalList = [];
        for (var r in goalsJson) {
          goalList.add(GoalModel.fromJson(json: r));
        }
        return goalList;
      } else {
        throw Exception('Failed to load income/expense');
      }
    } catch (e) {
      rethrow;
    }
  }
}
