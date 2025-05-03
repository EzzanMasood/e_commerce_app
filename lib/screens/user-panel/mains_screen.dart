import 'package:ecom/screens/user-panel/all_categories_screen.dart';
import 'package:ecom/screens/user-panel/all_flash_sale_products.dart';
import 'package:ecom/screens/user-panel/all_products_screen.dart';
import 'package:ecom/widgets/all_products_widget.dart';
import 'package:ecom/widgets/baneer_widget.dart';
import 'package:ecom/widgets/category_widget.dart';
import 'package:ecom/widgets/custom_widget_drawer.dart';
import 'package:ecom/widgets/flash_sale_widget.dart';
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
              SizedBox(height: Get.height / 90.0),
              BannerWidget(),
              HeadingWidget(
                  headingTitle: "Categories",
                  headingSubTitle: "according to your budget",
                  buttonText: "see more >",
                  onTap: () {Get.to(()=>AllCategoriesScreen());}
                  ),
              CategoryWidget(),
              HeadingWidget(
                  headingTitle: "Flash Sales",
                  headingSubTitle: "according to your budget",
                  buttonText: "see more >",
                  onTap: () {
                    Get.to(()=>AllFlashSaleProducts());
                  }),
              FlashSaleWidget(),
              HeadingWidget(
                  headingTitle: "All Products",
                  headingSubTitle: "according to your budget",
                  buttonText: "see more >",
                  onTap: () {
                    Get.to(()=>AllProductsScreen());
                  }),
                  AllProductsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
