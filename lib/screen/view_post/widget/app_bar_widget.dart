import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../create_post/create_post_screen.dart';
import '../../screen_widget/container_decoration_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: Offset(-6.0, -6.0),
              blurRadius: 16.0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(6.0, 6.0),
              blurRadius: 16.0,
            ),
          ],
          color: Color(0xFFEFEEEE),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){},
              child: Container(
                width: 60,
                height: 60,
                decoration: ContainerDecorationWidget.decuration,
                child: Icon(
                  Icons.menu,
                  color: Color(0xFF124150),
                  size: 20,
                ),
              ),
            ),
            Text(
              "Q U E S T I O N",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Oswald",
                  color: Color(0xFF124150)),
            ),
            GestureDetector(
              onTap: (){
                Get.to(CreatePostScreen());
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: ContainerDecorationWidget.decuration,
                child: Icon(
                  Icons.add,
                  color: Color(0xFF124150),
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
