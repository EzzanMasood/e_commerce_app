import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/utilis/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  // For password visibilty
  var isPasswordVisible = false.obs;

  Future<UserCredential?> signInMethod(
   
    String userEmail,

    String userPassword,
  
  )
  async{
    try {
      EasyLoading.show(status: "Please Wait");
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email:userEmail, password: userPassword);
       EasyLoading.dismiss();
       return userCredential;
   
    }on FirebaseAuthException 
    catch (e) {
      Get.snackbar("Error", "$e",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppConstants.appSecondaryColor,
      colorText: AppConstants.appTextColor,
      );
    }
  }
}