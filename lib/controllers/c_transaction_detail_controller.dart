import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:expense_tracker_mobile/controllers/m_transaction_detail_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/helpers/logger.dart';
import '../utils/services/storage_service.dart';

class TransactionDetailController extends GetxController {
  TransactionDetailModel? detailModel;
  RxBool xBusy = false.obs;

  Future<void> getTransactionDetail({required String id}) async {
    xBusy.value = true;
    try {
      Response? response = await apiGetCall(
          urlString:
              'https://finance.buclib.club/api/v1/transaction/detail/$id');
      Logger.superPrint(response?.body);
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        detailModel = TransactionDetailModel.fromJson(response?.body["_data"]);
        xBusy.value = false;
      }
      xBusy.value = false;
    } catch (e) {
      Logger.superPrint(e);
    }
    xBusy.value = false;
  }

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
