import 'package:expense_tracker_mobile/screens/wallet/v_wallet_detail.dart';
import 'package:expense_tracker_mobile/utils/helpers/num_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildWalletCard extends StatelessWidget {
  final String imageUrl;
  final String payName;
  final String id;
  final int amount;

  const BuildWalletCard(
      {super.key,
      required this.imageUrl,
      required this.payName,
      required this.amount,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => WalletDetail(
              id: id,
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(71, 238, 229, 255),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Text(payName),
              ],
            ),
            Text(
              '${formatNumber(amount)} Ks',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
