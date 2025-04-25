import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/screens/auth-ui/sign_in_screen.dart';
import 'package:ecom/utilis/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // For password visibilty
  var isPasswordVisible = false.obs;

  Future<void> forgetPasswordMethod(
    String userEmail,
  ) async {
    try {
      EasyLoading.show(status: "Please Wait");
      await _auth.sendPasswordResetEmail(
        email: userEmail,
      );
      Get.snackbar(
        "Request sent Successfully",
        "Reset link has bessn sent to $userEmail",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstants.appSecondaryColor,
        colorText: AppConstants.appTextColor,
      );
      Get.offAll(()=>SignInScreen());
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstants.appSecondaryColor,
        colorText: AppConstants.appTextColor,
      );
    }
  }
}
