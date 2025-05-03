import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/models/categories_model.dart';
import 'package:ecom/screens/user-panel/single_category_product_screen.dart';
import 'package:ecom/utilis/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
color: AppConstants.appTextColor
        ),
        backgroundColor: AppConstants.appMainColor,
        title: Text(
          "All Categories",
          style: TextStyle(
            color: AppConstants.appTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("categories").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No categories found"),
            );
          }
          
          return GridView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              CategoriesModel categoriesModel = CategoriesModel(
                categoryId: snapshot.data!.docs[index]["categoryId"],
                categoryImg: snapshot.data!.docs[index]["categoryImg"],
                categoryName: snapshot.data!.docs[index]["categoryName"],
                createdAt: snapshot.data!.docs[index]["createdAt"],
                updatedAt: snapshot.data!.docs[index]["updatedAt"],
              );
              
              return GestureDetector(
                onTap: () => Get.to(SingleCategoryProductScreen(
 categoryId:categoriesModel.categoryId
                )),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FillImageCard(
                    borderRadius: 20.0,
                    width: Get.width / 2.3,
                    heightImage: Get.height / 10,
                    imageProvider: CachedNetworkImageProvider(
                      categoriesModel.categoryImg,
                    ),
                    title: Center(
                      child: Text(
                        categoriesModel.categoryName,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}