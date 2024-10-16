import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/x_text_field.dart';
import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:expense_tracker_mobile/utils/helpers/x_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GoalController extends GetxController {
  var dateText = ''.obs;
}

class DetailGoal extends StatelessWidget {
  final GoalController controller = Get.put(GoalController());
  DetailGoal({super.key});

  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Detail Goal',
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDeleteSheet();
            },
            icon: const Icon(
              Iconsax.trash4,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(30),
            const Center(
              child: Text(
                "Total Saved Amount",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "400,000 Ks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            const Gap(30),

            // Centering the LinearPercentIndicator
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width,
              lineHeight: 25.0,
              percent: 0.8,
              animation: true,
              animationDuration: 2000,
              center: const Text(
                "80.0%",
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              barRadius: const Radius.circular(20),
              backgroundColor: Colors.grey,
              progressColor: AppColors.primaryColor,
            ),

            const Gap(30),
            const Center(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "You have ",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "100,000 Ks",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " left to  \n achieve goal!",
                    ),
                  ],
                ),
              ),
            ),
            const Gap(60),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Goal",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Adopt a Kitten",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Gap(25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Deadline",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Dec 12, 2024",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Gap(25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Ongoing",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Gap(25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saved Amount",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "400,000 Ks",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  )
                ],
              ),
            ),
            const Gap(25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Goal Amount",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "500,000 Ks",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Gap(50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showAddSavingBottomSheet(context);
                  },
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
                    'Add Saving',
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
          top: 18,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: Column(
            children: [
              Container(
                height: 10,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10)),
              ),
              const Gap(20),
              const Text(
                "Remove this goal?",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Are you sure do you wanna remove this goal?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0XFF91919F),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.accentColor,
                      minimumSize: const Size(160, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "No",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      xSuccessDialog(
                          'Transaction has been successfully removed', true);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(160, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Yes",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      enableDrag: true,
      isScrollControlled: true,
    );
  }

  void showAddSavingBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
            children: [
              Center(
                child: Container(
                  height: 10,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), // Use SizedBox for gaps instead of Gap widget
              const Text(
                "Add Saving",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const Gap(20),
              XTextField(
                placeHolder: 'Enter Amount',
                suffixText: 'Ks',
                controller: amountController,
              ),
              const Gap(20),
              GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    // Update the date controller with the selected date
                    dateController.text = "${pickedDate.toLocal()}"
                        .split(' ')[0]; // Format as needed
                  }
                },
                child: AbsorbPointer(
                  // Prevents text field from being editable
                  child: TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      labelText: 'Select Date',
                    ),
                  ),
                ),
              ),
              const Gap(20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showAddSavingBottomSheet(context);
                  },
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
                    'Continue',
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
      enableDrag: true,
      isScrollControlled: true,
    );
  }
}
