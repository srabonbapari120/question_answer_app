import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting/screen/view_post/widget/app_bar_widget.dart';
import 'package:voting/screen/view_post/widget/list_container.dart';
import 'package:voting/screen/view_post/widget/search_bar_widget.dart';
import '../../controller/view_post_screen_controller.dart';

class ViewPostScreen extends StatelessWidget {
  ViewPostScreen({super.key});

  final ViewPostScreenController controller =
      Get.put(ViewPostScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F1FA),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: (){
             return controller.getAllPost();
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const AppBarWidget(),
                const SizedBox(
                  height: 20,
                ),
                const SearchBarWidget(),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => controller.loading.value
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : ListOfPost(controller: controller,),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
