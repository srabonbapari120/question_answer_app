import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ViewPostScreenController extends GetxController{

  RxBool loading = false.obs;
  RxList postList= RxList([]);
  RxInt totalVote = 0.obs;


  Future getAllPost() async{
    loading.value= true;
    final listPost = await FirebaseFirestore.instance.collection("POST").get();
    postList.clear();
    for(var post in listPost.docs){
      postList.add(post);
    }
    loading.value= false;
    update();
  }
  @override
  void onInit() {
    getAllPost();
    super.onInit();
  }
}