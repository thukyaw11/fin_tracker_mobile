import 'package:expense_tracker_mobile/screens/add_new_income/widgets/category_bottom_sheet.dart';
import 'package:expense_tracker_mobile/screens/add_new_income/widgets/x_text_field.dart';
import 'package:flutter/material.dart';

class AddNewIncome extends StatelessWidget {
  AddNewIncome({super.key});

  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Add Income',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ), // AppBar
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XTextField(
                controller: amountController,
                labelText: 'Your Amount',
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  CategoryBottomSheet.show();
                },
                child: const Text('Add TextField'),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
