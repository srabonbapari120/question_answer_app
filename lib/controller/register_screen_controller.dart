import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/view_post/view_post_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController paswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  RxBool loading = false.obs;
  final formkey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final String userUid;


 Future<void> registerEmailAndPassword() async {
    final body = {
      'name' : nameController.text,
      'email' : emailController.text,
      'phone' : phoneController.text,
      'password' : paswordController.text,
    };

    loading.value = true;
    final response = await FirebaseFirestore.instance.collection("USER");
    await auth.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: paswordController.text.trim(),
    ).then((value) async {
      getUserUid();
      final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
      sharedPreferences.setString('email', emailController.text);
      sharedPreferences.setBool('isLogin', true);
      response.doc(userUid).set(body).then(
        (value) {
          loading.value = false;
          Get.off(ViewPostScreen());
          Get.snackbar("Successfully", "Your Account Created");
        },
      ).onError(
        (error, stackTrace) {
          loading.value = false;
          sharedPreferences.clear();
          Get.snackbar(
            "Error",
            error.toString(),
            colorText: Colors.green,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
      );
    }).catchError((error) {
      loading.value = false;
      Get.snackbar("Error", error.message.toString());
    });
  }

  void getUserUid() {
    final User user = auth.currentUser!;
    userUid = user.uid;
  }
}
