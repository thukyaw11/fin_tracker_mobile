import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/x_text_field.dart';
import 'package:expense_tracker_mobile/screens/profile/w_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/goal/c_add_goal.dart';
import '../../utils/constants/app_colors.dart';

class AddNewGoal extends StatelessWidget {
  final AddGoalController controller = Get.put(AddGoalController());

  AddNewGoal({super.key});
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: "Add New Goal"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XTextField(
                controller: controller.titleTEC,
                labelText: 'Your Goal',
                placeHolder: 'Eg. Adopt a kitten',
              ),
              const Gap(20),
              XTextField(
                controller: controller.goalAmountTEC,
                labelText: 'Goal Amount',
                placeHolder: 'Enter amount',
                digitsOnly: true,
                keyboardType: TextInputType.number,
              ),
              const Gap(20),
              XTextField(
                controller: controller.savedAmountTEC,
                labelText: 'Saved Amount',
                placeHolder: 'Enter amount',
                digitsOnly: true,
                keyboardType: TextInputType.number,
              ),
              const Gap(20),
              deadlineText(),
              const Gap(10),
              deadlinePicker(context),
              const Gap(20),
              actionButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionButton() {
    return Center(
      child: Obx(() {
        return InkWell(
          onTap: controller.xBusy.value
              ? null
              : () {
                  controller.addNewGoal();
                },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 55,
            width: controller.xBusy.value ? 55 : Get.width,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(controller.xBusy.value ? 1000 : 12),
              color: AppColors.primaryColor,
            ),
            child: Center(
              child: controller.xBusy.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Save Goal',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        );
      }),
    );
  }

  Widget deadlinePicker(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 10)));
        if (pickedDate != null) {
          controller.deadlineTEC.text =
              DateFormat('MMM dd, yyyy').format(pickedDate);
        }
      },
      child: AbsorbPointer(
        child: TextField(
          controller: controller.deadlineTEC,
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
    );
  }

  Widget deadlineText() {
    return RichText(
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Deadline',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red), // Style for the '*'
          ),
        ],
      ),
    );
  }
}
