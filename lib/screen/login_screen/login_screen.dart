import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting/controller/login_screen_controller.dart';
import 'package:voting/screen/register_screen/register_screen.dart';
import '../widget/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginScreenController controller =
  Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: controller.formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/5,),
                TextFieldWidget(
                  iconData: Icons.email_outlined,
                  hintText: 'Email',
                  controller: controller.emailController,
                  ofSecure: false,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  iconData: Icons.lock,
                  hintText: 'Password',
                  controller: controller.passwordController,
                  ofSecure: true,
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => controller.loading.value?Center(child: CircularProgressIndicator(),): Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: GestureDetector(
                    onTap: (){
                      if(controller.formkey.currentState!.validate()){
                        controller.loginEmailAndPassword();
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            offset: Offset(-6.0, -6.0),
                            blurRadius: 16.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(6.0, 6.0),
                            blurRadius: 16.0,
                          ),
                        ],
                        color: Color(0xFFEFEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Oswald",
                            color: Color(0xFF124150),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height/20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Don't have an Account?",style: TextStyle(fontSize: 16,
                        fontFamily: "Oswald",
                        color: Color(0xFF124150),),),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(RegisterScreen());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            offset: Offset(-6.0, -6.0),
                            blurRadius: 16.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(6.0, 6.0),
                            blurRadius: 16.0,
                          ),
                        ],
                        color: Color(0xFFEFEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Oswald",
                            color: Color(0xFF124150),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
