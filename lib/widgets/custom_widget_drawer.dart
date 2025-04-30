import 'package:ecom/screens/auth-ui/welcome_screen.dart';
import 'package:ecom/utilis/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerWdiget extends StatefulWidget {
  const DrawerWdiget({super.key});

  @override
  State<DrawerWdiget> createState() => _DrawerWdigetState();
}

class _DrawerWdigetState extends State<DrawerWdiget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height/25),
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )
        ),
               backgroundColor: AppConstants.appSecondaryColor,
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
              child: ListTile(
                titleAlignment:ListTileTitleAlignment.center,
                title: Text("Waris",style: TextStyle(color: AppConstants.appTextColor),),
                subtitle: Text("Version 1.0.1",style: TextStyle(color: AppConstants.appTextColor),),
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppConstants.appMainColor,
                  child: Text('W',style: TextStyle(color: AppConstants.appTextColor),),
                ),
              ),
            ),
            Divider(indent: 10.0,
            endIndent: 10.0,
            thickness: 1.5,
            color: Colors.grey,
            ),
 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment:ListTileTitleAlignment.center,
                title: Text("Home",style: TextStyle(color: AppConstants.appTextColor)),
               
                leading:Icon(Icons.home,color: AppConstants.appTextColor),
                trailing: Icon(Icons.arrow_forward,color: AppConstants.appTextColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment:ListTileTitleAlignment.center,
                title: Text("Products",style: TextStyle(color: AppConstants.appTextColor)),
               
                leading:Icon(Icons.production_quantity_limits,color: AppConstants.appTextColor),
                trailing: Icon(Icons.arrow_forward,color: AppConstants.appTextColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment:ListTileTitleAlignment.center,
                title: Text("Orders",style: TextStyle(color: AppConstants.appTextColor)),
               
                leading:Icon(Icons.shopping_bag,color: AppConstants.appTextColor),
                trailing: Icon(Icons.arrow_forward,color: AppConstants.appTextColor),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment:ListTileTitleAlignment.center,
                title: Text("Contact",style: TextStyle(color: AppConstants.appTextColor)),
               
                leading:Icon(Icons.help,color: AppConstants.appTextColor),
                trailing: Icon(Icons.arrow_forward,color: AppConstants.appTextColor),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: ()async{
              GoogleSignIn googleSignIn=GoogleSignIn();
              FirebaseAuth _auth=FirebaseAuth.instance;
              await _auth.signOut(); 
             await googleSignIn.signOut();
              Get.offAll(()=>WelcomeScreen());
            },
                titleAlignment:ListTileTitleAlignment.center,
                title: Text("logout",style: TextStyle(color: AppConstants.appTextColor)),
               
                leading:Icon(Icons.logout,color: AppConstants.appTextColor),
                trailing: Icon(Icons.arrow_forward,color: AppConstants.appTextColor),
              ),
            ),
          ],
        ),
 
      ),
    );
  }
}