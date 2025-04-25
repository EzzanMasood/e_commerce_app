import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/controllers/get_device_token_controller.dart';
import 'package:ecom/models/user_models.dart';
import 'package:ecom/utilis/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final GetDeviceTokenController getDeviceTokenController=Get.put(GetDeviceTokenController());
  // For password visibilty
  var isPasswordVisible = false.obs;

  Future<UserCredential?> signUpMethod(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
    String userDeviceToken,
  )
  async{
    try {
      EasyLoading.show(status: "Please Wait");
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email:userEmail, password: userPassword);

    await  userCredential.user!.sendEmailVerification();

    UserModels userModels= UserModels(uId: userCredential.user!.uid, email: userEmail, username: userName, phone: userPhone, userImg:'', userDeviceToken: getDeviceTokenController.deviceToken.toString(), country:'', userAddress: '', street:'',city: userCity, isAdmin: false, isActive:true, createdOn: DateTime.now(),);

    //Add data to Firestore
    _firestore.collection('users')
    .doc(userCredential.user!.uid)
    .set(userModels.toMap());
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