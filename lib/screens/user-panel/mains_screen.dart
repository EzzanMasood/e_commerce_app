import 'package:ecom/widgets/baneer_widget.dart';
import 'package:ecom/widgets/custom_widget_drawer.dart';
import 'package:ecom/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utilis/app_constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstants.appTextColor),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstants.appSecondaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppConstants.appMainColor,
        title: Text(
          AppConstants.appMainName,
          style: TextStyle(color: AppConstants.appTextColor),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWdiget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: Get.height/90.0),
              BannerWidget(),
              HeadingWidget(headingTitle: "Categories",
               headingSubTitle:"according to your budget",
                buttonText: "see more >",
                 onTap:(){} )
            ],
          ),
        ),
      ),
    );
  }
}
