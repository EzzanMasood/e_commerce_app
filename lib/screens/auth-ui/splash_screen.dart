import 'dart:async';
import 'package:ecom/screens/auth-ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../utilis/app_constants.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
void initState(){
  super.initState();
Timer(Duration(seconds: 3), (){
Get.offAll(()=>WelcomeScreen());
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appSecondaryColor,
        elevation: 0,
      ),
       backgroundColor: AppConstants.appSecondaryColor,
       // ignore: avoid_unnecessary_containers
       body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: Get.width,
                child: Lottie.asset('assets/images/splash_icon.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0  ),
              alignment: Alignment.center,
              width: Get.width,
              child: Text(AppConstants.appPoweredBy,style: 
              TextStyle(color: AppConstants.appTextColor,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              ),
              ),
            )
          ],
        ),
       ),
    );
  }
}