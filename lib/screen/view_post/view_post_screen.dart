import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:voting/screen/view_post/widget/app_bar_widget.dart';
import 'package:voting/screen/view_post/widget/search_bar_widget.dart';
import '../../controller/view_post_screen_controller.dart';
import '../screen_widget/container_decoration_widget.dart';

class ViewPostScreen extends StatelessWidget {
  ViewPostScreen({super.key});

  final ViewPostScreenController controller =
      Get.put(ViewPostScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F1FA),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: (){
           return controller.getAllPost();
          },
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              AppBarWidget(),
              SizedBox(
                height: 20,
              ),
              SearchBarWidget(),
              SizedBox(
                height: 20,
              ),
              Obx(() => controller.loading.value
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : Expanded(
                child: ListView.builder(
                  itemCount: controller.postList.length,
                  itemBuilder: (context, index) {
                    //Calculate END Date
                    DateTime d1 = DateTime.now();
                    var d2 = d1.day +
                        int.parse(controller.postList[index]['endDay']);
                    var days = d2 - d1.day;
                    //Calculate END Date

                    controller.totalVote.value = controller.postList[index]
                    ['options']
                        .fold(0, (i, el) {
                      return i + el['vote'];
                    });

                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 20.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: ContainerDecorationWidget.decuration,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ReadMoreText(
                                  controller.postList[index]['question']
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Oswald',
                                    color: Color(0xFF124150),
                                  ),
                                  trimLines: 3,
                                  colorClickableText: Colors.pink,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: ' Show less',
                                  moreStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  lessStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            for (int i = 0;
                            i <
                                controller
                                    .postList[index]['options'].length;
                            i++)
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, right: 8),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    width:
                                    MediaQuery.of(context).size.width,
                                    decoration: ContainerDecorationWidget
                                        .decuration,
                                    child: ReadMoreText(
                                      controller.postList[index]['options']
                                      [i]['option']
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Oswald',
                                        color: Color(0xFF124150),
                                      ),
                                      trimLines: 2,
                                      colorClickableText: Colors.pink,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Show more',
                                      trimExpandedText: ' Show less',
                                      moreStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      lessStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 10.0,
                                  top: 10,
                                  bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Total Voting: ${controller.totalVote.value}"),
                                  Text("End: $days Days"),
                                  // Text(controller.postList[index]['endDay'].toString(),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
