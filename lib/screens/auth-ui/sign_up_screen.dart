import 'package:ecom/controllers/sign_up_controller.dart';
import 'package:ecom/screens/auth-ui/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import '../../utilis/app_constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _signUpController = Get.put(SignUpController());
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userCity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.appSecondaryColor,
          title: Text(
            "Sign Up",
            style: TextStyle(color: AppConstants.appTextColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Welcome to my app",
                  style: TextStyle(
                    color: AppConstants.appSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userName,
                    cursorColor: AppConstants.appSecondaryColor,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      prefixIcon: Icon(Icons.person),
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userPhone,
                    cursorColor: AppConstants.appSecondaryColor,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      prefixIcon: Icon(Icons.phone),
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
                    controller: userCity,
                    cursorColor: AppConstants.appSecondaryColor,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'City',
                      prefixIcon: Icon(Icons.phone),
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
                    child: Obx(
                      () => TextFormField(
                        controller: userPassword,
                        cursorColor: AppConstants.appSecondaryColor,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _signUpController.isPasswordVisible.value,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _signUpController.isPasswordVisible.toggle();
                              },
                              child: _signUpController.isPasswordVisible.value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppConstants.appSecondaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppConstants.appSecondaryColor),
                          ),
                        ),
                      ),
                    )),
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
                    onPressed: ()async {
                String name=userName.text.trim(); 
                String email=userEmail.text.trim();      
                String phone=userPhone.text.trim(); 
                String city=userCity.text.trim(); 
                String password=userPassword.text.trim(); 
                String userDeviceToken="";
                if (name.isEmpty||email.isEmpty||phone.isEmpty||city.isEmpty||password.isEmpty){
                  Get.snackbar("Error", "Please Fill all details",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: AppConstants.appTextColor,
                  backgroundColor: AppConstants.appSecondaryColor,
                  );
                }
                else {
                  UserCredential? userCredential = await _signUpController.signUpMethod
                  (name,
                   email, 
                  phone,
                   city,
                   password,
                   userDeviceToken
                   );
                   if(userCredential!=null){
                    Get.snackbar("verification email send", "Please check your email",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: AppConstants.appTextColor,
                  backgroundColor: AppConstants.appSecondaryColor,
                  );
                  FirebaseAuth.instance.signOut();
                  Get.offAll(()=>SignInScreen());
                   }
                }
                    },
                    child: Text(
                      'Sign Up',
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
                    "Already have an Account?",
                    style: TextStyle(color: AppConstants.appSecondaryColor),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => SignInScreen()),
                    child: Text(
                      "  SignIn",
                      style: TextStyle(
                          color: AppConstants.appSecondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
