import 'package:flutter/material.dart';

class QuestionTextField extends StatelessWidget {
   const QuestionTextField({super.key,required this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
          padding: const EdgeInsets.only(left: 12.0),
          child: TextFormField(
            controller: controller,
            minLines: 1,
            maxLines: 4,
            style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: Colors.black,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.question_mark),
                hintText: 'ENTER YOUR QUESTION!',
                errorStyle: TextStyle(color: Colors.red)
            ),
            validator: (question){
              if(question == ''){
                return "Please Enter Question";
              }else{
                return null;
              }
            },
          ),
        ),
      ),
    );
  }
}
