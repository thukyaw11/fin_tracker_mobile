import 'package:expense_tracker_mobile/screens/home/widgets/build_transaction_items.dart';
import 'package:flutter/material.dart';

class WalletDetail extends StatelessWidget {
  const WalletDetail({super.key});

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
      body: Padding(
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
                'https://res.cloudinary.com/myanmar-fixie-nation/image/upload/v1727718382/paypal_zbdwwq.png',
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
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
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
            const Center(
              child: Text(
                "Paypal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "80,000 Ks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  // DateTime adjustedTime = transaction.createdAt
                  //     .add(const Duration(hours: 6, minutes: 30));
                  // String formattedTime =
                  //     DateFormat('h:mm a').format(adjustedTime);

                  return buildTransactionItem("Shopping", "+ 30,000 Ks", "Mont",
                      Icons.wallet, Colors.green, "2:00 pm", "");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
