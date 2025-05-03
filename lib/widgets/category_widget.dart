import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/models/categories_model.dart';
import 'package:ecom/screens/user-panel/single_category_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("categories").get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error"),
          );
        }
        if (snapshot == ConnectionState.waiting) {
          return Container(
            height: Get.height / 5,
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text("No Categories found"),
          );
        }
        if (snapshot.data != null) {
          return Container(
            height: Get.height / 6,
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  CategoriesModel categoriesModel=CategoriesModel(
                    categoryId: snapshot.data!.docs[index]["categoryId"],
                     categoryImg: snapshot.data!.docs[index]["categoryImg"],
                      categoryName: snapshot.data!.docs[index]["categoryName"],
                       createdAt: snapshot.data!.docs[index]["createdAt"],
                        updatedAt: snapshot.data!.docs[index]["updatedAt"]
                        );
                  return Row(
                    children: [
                      GestureDetector(
                   onTap: () => Get.to(()=>SingleCategoryProductScreen(
                    categoryId: categoriesModel.categoryId)),     
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            child: FillImageCard(
                              borderRadius: 20.0,
                              width: Get.width/4.0,
                              heightImage: Get.height/ 12,
                              imageProvider: CachedNetworkImageProvider(
                                categoriesModel.categoryImg,
                              ),
                              title: Center(
                                child: Text(categoriesModel.categoryName,
                                style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          );
        }
        return Container();
      },
    );
  }
}
