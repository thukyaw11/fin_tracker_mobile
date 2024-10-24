import 'dart:io';
import 'package:expense_tracker_mobile/screens/home/v_home.dart';
import 'package:expense_tracker_mobile/screens/main/v_main_page.dart';
import 'package:expense_tracker_mobile/screens/wallet/v_transaction_detail.dart';
import 'package:expense_tracker_mobile/utils/constants/app_constants.dart';
import 'package:expense_tracker_mobile/utils/enums/transaction_type.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:expense_tracker_mobile/utils/services/network/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/image/c_image.dart';
import '../../models/m_selected_category.dart';
import '../../models/m_selected_group.dart';
import 'package:dio/dio.dart' as dio;
import '../../models/m_selected_wallet.dart';
import '../../utils/services/storage_service.dart';

class AddNewTransactionController extends GetxController {
  var selectedCategory = SelectedCategory(name: '', id: '').obs;
  var selectedWallet = SelectedWallet(name: '', id: '').obs;
  var selectedGroup = SelectedGroup(name: '', id: '').obs;
  var selectedType = TransactionType.INCOME.obs;
  String returnImage = "";
  RxBool xBusy = false.obs;

  final CommonApiService apiService = Get.find<CommonApiService>();

  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  Future<void> addTransaction() async {
    String amount = amountController.text.trim();
    String description = descriptionController.text.trim();
    String title = titleController.text.trim();

    if (amount.isEmpty) {
      Get.snackbar("Error", "Please enter a valid amount");
      return;
    }

    if (selectedCategory.value.name.isEmpty) {
      Get.snackbar("Error", "Please select a category");
      return;
    }

    if (selectedWallet.value.name.isEmpty) {
      Get.snackbar("Error", "Please select a wallet");
      return;
    }

    if (selectedGroup.value.name.isEmpty) {
      Get.snackbar("Error", "Please select a group");
      return;
    }
    var selectedImage = imagePickerController.selectedImage.value;
    xBusy.value = true;
    if (selectedImage != null) {
      returnImage = await getUploadedImage(selectedImage);
    }
    var payload = {
      "cashCategoryId": selectedCategory.value.id,
      "walletId": selectedWallet.value.id,
      "groupId": selectedGroup.value.id,
      "transactionType":
          selectedType.value == TransactionType.INCOME ? 'INCOME' : 'EXPENSE',
      "title": title,
      "description": description,
      "amount": int.parse(amount),
      if (returnImage.isNotEmpty) "transactionImageUrl": returnImage
    };

    try {
      final response = await apiService.postRequest('/transaction', payload);
      Logger.superPrint(response.toString());
      if (response?.statusCode == 201 || response?.statusCode == 200) {
        Get.snackbar("Success", "Transaction added successfully!");
        amountController.clear();
        descriptionController.clear();
        titleController.clear();
        selectedCategory(SelectedCategory(name: '', id: ''));
        selectedWallet(SelectedWallet(name: '', id: ''));
        selectedGroup(SelectedGroup(name: '', id: ''));
        Get.off(() => const HomePage());
        xBusy.value = false;
      } else {
        Logger.superPrint("error");
        xBusy.value = false;
        // Get.snackbar("Error", "Failed to add transaction");
      }
    } catch (e) {
      Logger.superPrint(e, title: "error");
      xBusy.value = false;
      // Get.snackbar("Error", "Something went wrong: $e");
    }
  }

  Future<String> getUploadedImage(File selectedImage) async {
    String tempImage = "";
    try {
      var image = await dio.MultipartFile.fromFile(selectedImage.path,
          filename: selectedImage.path.split("/").last);
      var payload = {"file": image};
      try {
        Response? response = await apiFormDataCall(data: payload);
        if (response?.statusCode == 200 || response?.statusCode == 201) {
          returnImage = response?.body["_data"] ?? "";
          Logger.superPrint(returnImage);
        }
      } catch (e) {
        xBusy.value = false;
        Get.snackbar("Error", "Something went wrong: $e");
      }
    } catch (e) {
      xBusy.value = false;
      Logger.superPrint(e, title: "error");
    }
    return tempImage;
  }

  @override
  void onClose() {
    amountController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void selectCategory(String categoryName, String categoryId) {
    selectedCategory.update((category) {
      category?.name = categoryName;
      category?.id = categoryId;
    });
  }

  void selectWallet(String walletName, String walletId) {
    selectedWallet.update((wallet) {
      wallet?.name = walletName;
      wallet?.id = walletId;
    });
  }

  void selectGroup(String groupName, String groupId) {
    selectedGroup.update((group) {
      group?.name = groupName;
      group?.id = groupId;
    });
  }

  Future<Response?> apiFormDataCall(
      {bool xNeedToken = false,
      required Map<String, dynamic> data,
      String type = 'application/json',
      Function? onReferralCodeFail,
      Function? onReferralCodeLimitReached,
      Function(String)? onApiFail}) async {
    Response? response;
    String? token = await SharedPreferenceService.getAccessToken();
    try {
      dio.FormData formData = dio.FormData.fromMap(data);
      var dioClient = dio.Dio();
      dioClient.options = dioClient.options.copyWith(followRedirects: false);
      var dioResponse = await dioClient.post(
          'https://finance.buclib.club/api/v1/image/upload/transaction',
          options:
              dio.Options(contentType: 'text/html; charset=utf-8', headers: {
            'Access-Control-Allow-Origin': '*',
            'Accept': '*/*',
            'Content-Type': '$type; charset=UTF-8',
            if (token != null) 'Authorization': 'Bearer $token',
          }),
          data: formData);

      response = Response(
        statusCode: dioResponse.statusCode,
        headers: {},
        body: dioResponse.data,
      );
    } catch (e) {
      Logger.superPrint(e);
    }
    return response;
  }
}
