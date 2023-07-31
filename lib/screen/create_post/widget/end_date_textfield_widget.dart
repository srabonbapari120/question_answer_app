import 'package:flutter/material.dart';
import '../../../controller/create_post_screen_controller.dart';

class EndDataTextFieldWidget extends StatelessWidget {
  const EndDataTextFieldWidget({super.key,required this.controller});
  final CreatePostScreenController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
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
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: TextFormField(
            controller: controller.endDay,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.calendar_month,color: Colors.green,),
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text("DAY"),
                ),
                hintText: "POST END DATE"
            ),
            validator: (endDate){
              if (endDate == '') {
                return "Please Enter Option";
              } else {
                return null;
              }
            },
          ),
        ),
      ),
    );
  }
}
