import 'package:ecom/controllers/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../utilis/app_constants.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordController _forgetPasswordController=Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.appSecondaryColor,
          title: Text(
            "Sign In",
            style: TextStyle(color: AppConstants.appTextColor),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            isKeyboardVisible
                ? SizedBox.shrink()
                : Container(
                    color: AppConstants.appSecondaryColor,
                    child: Column(
                      children: [
                        Lottie.asset("assets/images/splash_icon.json"),
                      ],
                    ),
                  ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: userEmail,
                  cursorColor: AppConstants.appSecondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppConstants.appSecondaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppConstants.appSecondaryColor),
                    ),
                  ),
                ),
              ),
            ),
          
            SizedBox(
              height: Get.height / 25,
            ),
            Material(
              child: Container(
                width: Get.width / 2,
                height: Get.height / 18,
                decoration: BoxDecoration(
                  color: AppConstants.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton(
                  onPressed: () async{
                    String email=userEmail.text.trim();
                    if(email.isEmpty){
                      Get.snackbar("Error", "Please enter the email",
                      backgroundColor: AppConstants.appSecondaryColor,
                      colorText: AppConstants.appTextColor,
                      snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                else{
    String email=userEmail.text.trim();
    _forgetPasswordController.forgetPasswordMethod(email);
                }
                  },
                  child: Text(
                    'Forget',
                    style: TextStyle(color: AppConstants.appTextColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 25,
            ),
          ],
        ),
      );
    });
  }
  }