import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting/screen/view_post/view_post_screen.dart';

class CreatePostScreenController extends GetxController{
  final List<int> optionId = [];
  final List<TextEditingController> optionList = [];
  final TextEditingController question = TextEditingController();
  final TextEditingController endDay = TextEditingController();
  final List<int> vote = [];
  final formKey = GlobalKey<FormState>();
  List<dynamic> options = [];
  RxBool loading = false.obs;

  addOptionsField(int i) {
    optionList.add(TextEditingController());
    optionId.add(i);
    vote.add(0);
  }

  removeOptionsField() {
    optionId.removeLast();
    optionList.removeLast();
    vote.removeLast();
  }


  Future<void> addPost(BuildContext context) async {
    loading.value=true;
    for (int i = 0; i < optionList.length; i++) {
      Map<dynamic, dynamic> option = {
        "id": optionId[i],
        "option": optionList[i].text,
        "vote": vote[i],
      };
      options.add(option);
    }
    final int id = DateTime.now().millisecondsSinceEpoch;
    Map<String, dynamic> postbody ={
      'id': id,
      'endDay' : endDay.text,
      'question' : question.text,
      'options' : options
    };
    print("POST BODY "+postbody.toString());

    final response = await FirebaseFirestore.instance.collection("POST");
    response
        .doc(id.toString())
        .set(postbody).then(
          (value) {
        loading.value=false;
        question.clear();
        vote.clear();
        optionList.clear();
        optionId.clear();
        options.clear();
        endDay.clear();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ViewPostScreen()), (route) => false);
        Get.snackbar(
          "Success",
          "Your Post has been created",
          colorText: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
        );
      },
    ).onError(
          (error, stackTrace) {
        loading.value=false;
        Get.snackbar(
          "Error",
          "Something went wrong. try again",
          colorText: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
        );
        print(error.toString());
      },
    );
  }
}