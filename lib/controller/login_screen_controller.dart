import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screen/view_post/view_post_screen.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool loading = false.obs;
  final formkey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> loginEmailAndPassword() async {
    loading.value=true;
    await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).then((value) async {
      loading.value=false;
      final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
      sharedPreferences.setString('email', emailController.text);
      sharedPreferences.setBool('isLogin', true);
      Get.off(ViewPostScreen());
      Get.snackbar("Successfully", "Login Successfully");
    }).catchError((error){
      loading.value=false;
      Get.snackbar("Error", error.message.toString());
    });
  }
}
