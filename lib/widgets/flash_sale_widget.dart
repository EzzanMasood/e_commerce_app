import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/models/categories_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/screens/user-panel/all_product_details_screen.dart';
import 'package:ecom/utilis/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class FlashSaleWidget extends StatefulWidget {
  const FlashSaleWidget({super.key});

  @override
  State<FlashSaleWidget> createState() => _FlashSaleWidgetState();
}

class _FlashSaleWidgetState extends State<FlashSaleWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("products")
      .where('isSale', isEqualTo: true).get(),
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
            child: Text("No Products found"),
          );
        }
        if (snapshot.data != null) {
          return Container(
            height: Get.height / 5,
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final productData = snapshot.data!.docs[index];
                ProductModel productModel=ProductModel(
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

                  return Row(
                    children: [
                      GestureDetector(
               onTap: ()=>Get.to(()=>AllProductDetailsScreen(productModel: productModel,)),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            child: FillImageCard(
                              borderRadius: 20.0,
                              width: Get.width/4.0,
                              heightImage: Get.height/ 12,
                              imageProvider: CachedNetworkImageProvider(
                                productModel.productImages[0],
                              ),
                              title: Center(
                                child: Text(productModel.productName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                                ),
                              ),
                              footer: Row(
                                children: [
                                  Text("Rs ${productModel.salePrice}",style:
                                  TextStyle(fontSize: 10)
                                  ,),
                                  SizedBox(width: 2.0,),
                                  Text(" ${productModel.fullPrice}",style:
                                  TextStyle(fontSize: 10,
                                  color: AppConstants.appSecondaryColor,
                                  decoration: TextDecoration.lineThrough,
                                  )
                                  ,),
                                ],
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
