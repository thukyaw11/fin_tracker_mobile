import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/x_text_area.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/x_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../utils/constants/app_colors.dart';

class AddGoalController extends GetxController {
  var text = ''.obs;
}

class AddNewGoal extends StatelessWidget {
  final AddGoalController goalController = Get.put(AddGoalController());

  AddNewGoal({super.key});
  final TextEditingController dateController = TextEditingController();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Add New Goal',
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
                labelText: 'Your Goal',
                placeHolder: 'Eg. Adopt a kitten',
              ),
              const Gap(20),
              XTextField(
                controller: amountController,
                labelText: 'Goal Amount',
                placeHolder: 'Enter amount',
              ),
              const Gap(20),
              XTextField(
                controller: amountController,
                labelText: 'Saved Amount',
                placeHolder: 'Enter amount',
              ),
              const Gap(20),
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Deadline',
                      style: const TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red), // Style for the '*'
                    ),
                  ],
                ),
              ),
              const Gap(10),
              GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    dateController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      labelText: 'Select Date',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: const EdgeInsets.all(16),
                    foregroundColor: AppColors.accentColor,
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save Goal',
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
