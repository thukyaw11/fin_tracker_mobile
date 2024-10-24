import 'package:expense_tracker_mobile/screens/home/widgets/build_transaction_items.dart';
import 'package:expense_tracker_mobile/utils/services/format_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/tracker/c_wallet.dart';

class WalletDetail extends StatefulWidget {
  const WalletDetail({super.key, required this.id});
  final String id;

  @override
  State<WalletDetail> createState() => _WalletDetailState();
}

class _WalletDetailState extends State<WalletDetail> {
  final TrackerController walletController = Get.find();

  @override
  void initState() {
    walletController.fetchWalletTransactions(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Detail Wallet',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        final model = walletController.walletDetail;
        return walletController.xBusy.value ||
                walletController.walletDetail == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF1F1FA),
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.network(
                        model!.imageUrl,
                        fit: BoxFit.fill,
                        height: 30,
                        width: 30,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            );
                          }
                        },
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return const Center(child: Icon(Icons.error));
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        model!.walletTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        "${FormatService.numberFormat.format(model!.amount)} Ks",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: ListView.builder(
                        itemCount: model!.cashTransaction.length,
                        itemBuilder: (context, index) {
                          final eachItem = model!.cashTransaction[index];
                          // DateTime adjustedTime = transaction.createdAt
                          //     .add(const Duration(hours: 6, minutes: 30));
                          // String formattedTime =
                          //     DateFormat('h:mm a').format(adjustedTime);

                          return buildTransactionItem(
                              eachItem.title,
                              "${getSign(eachItem.type)} ${FormatService.numberFormat.format(eachItem.amount)} Ks",
                              eachItem.description,
                              Icons.wallet,
                              eachItem.type.toString().toLowerCase() == "income"
                                  ? Colors.green
                                  : Colors.red,
                              DateFormat('h:mm a').format(
                                  DateTime.tryParse(eachItem.createdAt) ??
                                      DateTime.now()),
                              eachItem.id,
                              true);
                        },
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }

  String getSign(String type) {
    String sign = "+";
    if (type.toString().toLowerCase() != "income") {
      sign = "-";
    }
    return sign;
  }
}
