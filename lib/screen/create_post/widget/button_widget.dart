import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/create_post_screen_controller.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key,required this.controller});
  final CreatePostScreenController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.value?const Center(child: CircularProgressIndicator(),):GestureDetector(
      onTap: () {
        if (controller.formKey.currentState!.validate()) {
          if(controller.optionList.isEmpty){
            Get.snackbar(
              "Sorry!",
              "Please Add Option!!",
              colorText: Colors.red,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor:
              Colors.green.withOpacity(0.1),
            );
          }else{
            controller.addPost(context);
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "P O S T ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_forward_rounded,color: Colors.white,)
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
