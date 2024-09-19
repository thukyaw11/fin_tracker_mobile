import 'package:flutter/material.dart';

class BuildWalletCard extends StatelessWidget {
  final String imageUrl;
  final String payName;
  final String amount;

  // Removed `const` keyword as it cannot be used with non-constant arguments
  const BuildWalletCard({
    super.key,
    required this.imageUrl,
    required this.payName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16.0), // Add padding for better layout
        decoration: BoxDecoration(
          color:
              const Color.fromARGB(71, 238, 229, 255), // Card background color
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
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
              amount,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
