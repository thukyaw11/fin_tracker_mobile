import 'package:expense_tracker_mobile/controllers/image/c_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePickerWidget extends StatelessWidget {
  final ImagePickerController controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.pickImage,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        child: Obx(() {
          // Observe the selected image
          return controller.selectedImage.value == null
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attachment,
                      color: Colors.grey,
                      size: 40,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Add Image',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                )
              : Image.file(
                  controller.selectedImage.value!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
        }),
      ),
    );
  }
}
