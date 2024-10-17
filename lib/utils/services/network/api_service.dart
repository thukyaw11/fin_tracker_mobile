import 'dart:convert';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CommonApiService extends GetxService {
  final String baseUrl;

  CommonApiService({required this.baseUrl});

  Future<http.Response?> postRequest(
      String endpoint, Map<String, dynamic> payload) async {
    try {
      String? token = await SharedPreferenceService.getAccessToken();
      Logger.superPrint(jsonEncode(payload));
      final url = Uri.parse('$baseUrl$endpoint');
      final response = await http.post(
        url,
        headers: _getHeaders(token),
        body: jsonEncode(payload),
      );
      Logger.superPrint(response);
      return _processResponse(response);
    } catch (e) {
      print('POST request error: $e');
      return null;
    }
  }

  Future<http.Response?> getRequest(
      String endpoint, Map<String, String>? queryParams) async {
    try {
      String? token = await SharedPreferenceService.getAccessToken();
      final url =
          Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParams);
      final response = await http.get(
        url,
        headers: _getHeaders(token),
      );
      return _processResponse(response);
    } catch (e) {
      print('GET request error: $e');
      return null;
    }
  }

  Map<String, String> _getHeaders(String? token) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  http.Response _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        throw Exception('Bad Request');
      case 401:
        throw Exception('Unauthorized');
      case 403:
        throw Exception('Forbidden');
      case 500:
        throw Exception('Internal Server Error');
      default:
        throw Exception('Error: ${response.statusCode}');
    }
  }
}
