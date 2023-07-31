import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/create_post_screen_controller.dart';

class OptionListWidget extends StatefulWidget {
  const OptionListWidget({super.key,required this.controller});
  final CreatePostScreenController controller;

  @override
  State<OptionListWidget> createState() => _OptionListWidgetState();
}

class _OptionListWidgetState extends State<OptionListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.controller.optionList.length; i++)
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: const Offset(4, 4),
                          color: Colors.grey.shade400,
                        ),
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: const Offset(-4, -4),
                          color: Colors.grey.shade300,
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 5.0),
                      child: TextFormField(
                        controller: widget.controller.optionList[i],
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Colors.black),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'ENTER YOUR OPTION',
                            suffixIcon: Icon(Icons.list),
                            errorStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 8)),
                        validator: (question) {
                          if (question == '') {
                            return "Please Enter Option";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (widget.controller.optionList.isEmpty) {
                    Get.snackbar(
                      "Sorry!",
                      "You Can't Remove",
                      colorText: Colors.redAccent,
                      snackPosition: SnackPosition.TOP,
                      backgroundColor:
                      Colors.green.withOpacity(0.1),
                    );
                  } else {
                    setState(() {
                      widget.controller.addOptionsField(widget.controller.optionList.length);
                    });
                  }
                },
                icon: const Icon(Icons.add_circle),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
      ],
    );
  }
}
