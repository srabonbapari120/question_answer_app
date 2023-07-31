import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
=======
import 'package:voting/screen/login_screen/login_screen.dart';
import 'package:voting/screen/register_screen/register_screen.dart';
import 'package:voting/screen/splash_screen/splash_screen.dart';
>>>>>>> 8d6c6a3 (navbar, splash screen, login, register complete)
import 'package:voting/screen/view_post/view_post_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voting App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF124150),
        ),
        useMaterial3: true,
        // fontFamily: 'Oswald'
      ),
<<<<<<< HEAD
      home: ViewPostScreen(),
=======
      home: SplashScreen(),
>>>>>>> 8d6c6a3 (navbar, splash screen, login, register complete)
    );
  }
}
