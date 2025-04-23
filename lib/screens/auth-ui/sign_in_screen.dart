import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../utilis/app_constants.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  cursorColor: AppConstants.appSecondaryColor,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.visibility_off),
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: AppConstants.appSecondaryColor,
                  fontWeight: FontWeight.bold,
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
                  onPressed: () {},
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: AppConstants.appTextColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an Account?",
                  style: TextStyle(color: AppConstants.appSecondaryColor),
                ),
                GestureDetector(
                  onTap: () => Get.offAll(() => SignUpScreen()),
                  child: Text(
                    " SignUp",
                    style: TextStyle(
                        color: AppConstants.appSecondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
