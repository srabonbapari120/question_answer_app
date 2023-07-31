import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting/screen/create_post/widget/button_widget.dart';
import 'package:voting/screen/create_post/widget/end_date_textfield_widget.dart';
import 'package:voting/screen/create_post/widget/option_list_widget.dart';
import 'package:voting/screen/create_post/widget/question_text_field.dart';
import 'package:voting/screen/view_post/view_post_screen.dart';
import '../../controller/create_post_screen_controller.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final CreatePostScreenController controller =
      Get.put(CreatePostScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ViewPostScreen())),
        ),
        title: const Text(
          "P O S T - V O T E",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Everything you Need to vote So Create your Vote And See World Support !!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " <----------Q U E S T I O N---------->",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                QuestionTextField(
                  controller: controller.question,
                ),
                const SizedBox(
                  height: 10,
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " <----------O P T I O N---------->",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          onPressed: () {
                            if (controller.optionList.isEmpty) {
                              Get.snackbar(
                                "Sorry!",
                                "You Can't Remove",
                                colorText: Colors.redAccent,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor:
                                Colors.green.withOpacity(0.1),
                              );
                            } else {
                              setState(() {
                                controller.removeOptionsField();
                              });
                            }
                          },
                          icon: Icon(Icons.remove_circle),
                        ),
                      ),
                    ],
                  ),
                ),
                controller.optionList.length == 0
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            /*controller.optionList.add(TextEditingController());
                            controller.optionId.add(0);
                            controller.vote.add(0);*/
                            controller.addOptionsField(0);
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : OptionListWidget(
                        controller: controller,
                      ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " <----------E N D - D A T E---------->",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                EndDataTextFieldWidget(
                  controller: controller,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
