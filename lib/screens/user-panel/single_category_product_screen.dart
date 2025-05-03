import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/models/categories_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/screens/user-panel/all_product_details_screen.dart';
import 'package:ecom/utilis/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class SingleCategoryProductScreen extends StatefulWidget {
  String categoryId;
  SingleCategoryProductScreen({super.key, required this.categoryId});

  @override
  State<SingleCategoryProductScreen> createState() =>
      _SingleCategoryProductScreenState();
}

class _SingleCategoryProductScreenState
    extends State<SingleCategoryProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appMainColor,
        title: Text(
          'Products',
          style: TextStyle(
            color: AppConstants.appTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("products")
            .where('categoryId', isEqualTo: widget.categoryId)
            .get(),
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
              final productData = snapshot.data!.docs[index];
              ProductModel productModel = ProductModel(
                  productId: productData["productId"],
                  categoryId: productData["categoryId"],
                  productName: productData["productName"],
                  categoryName: productData["categoryName"],
                  salePrice: productData["salePrice"],
                  fullPrice: productData["fullPrice"],
                  productImages: productData["productImages"],
                  deliveryTime: productData["deliveryTime"],
                  isSale: productData["isSale"],
                  productDiscription: productData["productDiscription"],
                  createdAt: productData["createdAt"],
                  updatedAt: productData["updatedAt"]);

              return GestureDetector(
                 onTap: ()=>Get.to(()=>AllProductDetailsScreen(productModel: productModel,)),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FillImageCard(
                    borderRadius: 20.0,
                    width: Get.width / 2.3,
                    heightImage: Get.height / 10,
                    imageProvider: CachedNetworkImageProvider(
                      productModel.productImages[0],
                    ),
                    title: Center(
                      child: Text(
                        productModel.productName,
                        overflow: TextOverflow.ellipsis,
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
