import 'package:flutter/material.dart';

class BuildWalletCard extends StatelessWidget {
  final String imageUrl;
  final String payName;
  final int amount;

  const BuildWalletCard({
    super.key,
    required this.imageUrl,
    required this.payName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            '$amount ks',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}