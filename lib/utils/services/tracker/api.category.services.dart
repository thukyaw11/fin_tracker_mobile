import 'dart:convert';
import 'package:expense_tracker_mobile/models/m_category.dart';
import 'package:expense_tracker_mobile/models/m_group.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:expense_tracker_mobile/utils/constants/api_constants.dart';

class CategoryApiService extends GetxService {
  Future<List<Category>> getAllCategory() async {
    String? token = await SharedPreferenceService.getAccessToken();

    final categoryUrl = Uri.parse('${ApiConstants.url}/cash-category');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(categoryUrl, headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        List<dynamic> categoriesJson = responseData['_data']['data'];
        return Category.fromJsonList(categoriesJson);
      } else {
        throw Exception('Failed to load category');
      }
    } catch (e) {
      rethrow;
    }
  }
}
