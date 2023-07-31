import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting/constant/app_images.dart';
import '../../controller/splash_screen_controller.dart';
import '../widget/container_decoration_widget.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
final SplashScreenController controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          offset: Offset(-6.0, -6.0),
                          blurRadius: 16.0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(6.0, 6.0),
                          blurRadius: 16.0,
                        ),
                      ],
                      color: Color(0xFFF5FAFD),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Image.asset(
                          AppImages.logo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  const Text(
                    "ONLINE Q & A PLATFORM",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Oswald",
                        color: Color(0xFF124150),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
