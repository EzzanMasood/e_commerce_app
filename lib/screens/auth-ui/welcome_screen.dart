
import 'package:ecom/screens/auth-ui/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/google_sign_in_cotntroller.dart';
import '../../utilis/app_constants.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
 

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
   final GoogleSignInController _googleSignInController = Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appSecondaryColor,
        elevation: 0,
        title: Text("Welcome to my App",style: TextStyle(color: AppConstants.appTextColor),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: AppConstants.appSecondaryColor,
            child: Lottie.asset("assets/images/splash_icon.json"),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text("Happy Shopping",
            style: TextStyle(fontSize: 16.0,
            fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: Get.height/20,
          ),
          Material(
            child: Container(
              width: Get.width/1.2,
              height: Get.height/12,
              decoration: BoxDecoration(
                color: AppConstants.appSecondaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton.icon(onPressed: (){
           _googleSignInController.signInWithGoogle();
              },
              icon: Image.asset('assets/images/google_icon.png',
              height: Get.height/12,
              width: Get.width/12,
              ),
               label: Text('Sign in with Google',
               style: TextStyle(color: AppConstants.appTextColor),
               ),
               ),
            ),
          ),
          SizedBox(
            height: Get.height/25,
          ),
            Material(
            child: Container(
              width: Get.width/1.2,
              height: Get.height/12,
              decoration: BoxDecoration(
                color: AppConstants.appSecondaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton.icon(onPressed: (){
         Get.to(()=>SignInScreen());       
              },
              icon: Image.asset('assets/images/gmail_icon.png',
              height: Get.height/12,
              width: Get.width/12,
              ),
               label: Text('Sign in with email',
               style: TextStyle(color: AppConstants.appTextColor),
               ),
               ),
            ),
          ),
        ],
      ),
    );
  }
}