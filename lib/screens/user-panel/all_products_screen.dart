import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/screens/user-panel/all_product_details_screen.dart';
import 'package:ecom/utilis/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppConstants.appTextColor
        ),
        backgroundColor: AppConstants.appMainColor,
        title: Text("All Products",
        style: TextStyle(color: AppConstants.appTextColor),
        ),
        centerTitle: true,
      ),
      body:  FutureBuilder(
      future: FirebaseFirestore.instance
          .collection("products")
          .where('isSale', isEqualTo: false)
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error loading products"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text("No products available"),
          );
        }

        return GridView.builder(
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8, // Adjusted for better product card proportions
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
              productImages: List<String>.from(productData["productImages"]),
              deliveryTime: productData["deliveryTime"],
              isSale: productData["isSale"],
              productDiscription: productData["productDiscription"],
              createdAt: productData["createdAt"],
              updatedAt: productData["updatedAt"],
            );

            // Ensure productImages is not empty before accessing index 0
            String imageUrl = productModel.productImages.isNotEmpty
                ? productModel.productImages[0]
                : 'https://via.placeholder.com/150'; // Fallback image URL

            return GestureDetector(
              onTap: ()=>Get.to(()=>AllProductDetailsScreen(productModel: productModel,)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: FillImageCard(
                  borderRadius: 20.0,
                  width: Get.width / 2.3,
                  heightImage: Get.height / 6, // Increased height for better visibility
                  imageProvider: CachedNetworkImageProvider(
                    imageUrl,
                  ),
                  title: Center(
                    child: Text(
                      productModel.productName,
                      style: TextStyle(
                        fontSize: 14,
                       
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  footer: Center(
                    child: Text(
                      "\Pkr: ${productModel.fullPrice.toString()}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
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