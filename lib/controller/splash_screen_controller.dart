import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screen/login_screen/login_screen.dart';
import '../screen/navigation_bar/home_navigation_bar.dart';
import '../screen/view_post/view_post_screen.dart';

class SplashScreenController extends GetxController{

  @override
  void onInit() {
    Timer(Duration(seconds: 3),(){
      screenNavigation();
    });
    super.onInit();
  }

  Future<void> screenNavigation()async{
    final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    final bool? islogin = await sharedPreferences.getBool('isLogin');
    if(islogin==true){
      Get.off(() => HomeNavigationBar());
    }else{
      Get.off(() => LoginScreen());
    }
  }
}