import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

import '../../utils/helpers/logger.dart';
import '../../utils/services/storage_service.dart';

class HttpApiService {
  Future<Response?> apiGetCall({required String urlString}) async {
    http.Response? response;
    String? token = await SharedPreferenceService.getAccessToken();
    try {
      response = await http.get(Uri.parse(urlString), headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    } catch (e) {
      Logger.superPrint(e);
    }

    return responseConverter(response: response);
  }

  Future<Response?> apiPatchCall(
      {required String urlString, required Map body}) async {
    http.Response? response;
    String? token = await SharedPreferenceService.getAccessToken();
    try {
      response = await http
          .patch(Uri.parse(urlString), body: jsonEncode(body), headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    } catch (e) {
      Logger.superPrint(e);
    }

    return responseConverter(response: response);
  }

  Future<Response?> apiDeleteCall({required String urlString}) async {
    http.Response? response;
    String? token = await SharedPreferenceService.getAccessToken();
    try {
      response = await http.delete(Uri.parse(urlString), headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    } catch (e) {
      Logger.superPrint(e);
    }

    return responseConverter(response: response);
  }

  Response? responseConverter({required http.Response? response}) {
    if (response != null) {
      return Response(
        bodyString: response.body,
        body: jsonDecode(response.body),
        statusCode: response.statusCode,
      );
    } else {
      return null;
    }
  }
}
