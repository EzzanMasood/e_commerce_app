import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/utilis/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AllProductDetailsScreen extends StatefulWidget {
  ProductModel productModel; 
   AllProductDetailsScreen({super.key, required  this.productModel, });

  @override
  State<AllProductDetailsScreen> createState() => _AllProductDetailsScreenState();
}

class _AllProductDetailsScreenState extends State<AllProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppConstants.appTextColor,
        ),
        backgroundColor: AppConstants.appMainColor,
        title: Text("Product Details",
        style: TextStyle(color: AppConstants.appTextColor),
        ),
        centerTitle: true,
      ),
      body:Container(
        child: Column(
          children: [
            SizedBox(height: Get.height/60,),
            CarouselSlider(items: widget.productModel.productImages.map((imageUrl)=>
        ClipRRect(borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.cover,width: Get.width-10,
        placeholder: (context,url)=>ColoredBox(color: Colors.white,child: Center(child: 
        CupertinoActivityIndicator()
        ,),
        ),
        errorWidget: (context,url,error)=>Icon(Icons.error),
        ),
        ),
        ).toList(),
         options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            aspectRatio: 2.5,
            viewportFraction: 1,
         ),
         ),
         Padding(padding: EdgeInsets.all(8.0),
         child: Card(
          elevation: 5.0,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                    child:   Text(widget.productModel.productName)
                    ),
                    Icon(Icons.favorite_outline)
                  ],
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                child:   Text("Category: ${widget.productModel.categoryName}")
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,

                child:   Row(
                  children: [
             widget.productModel.isSale==true && widget.productModel.salePrice != ''?       
                    Text("Pkr: ${widget.productModel.salePrice}"):
                    Text("Pkr: ${widget.productModel.fullPrice}")
                  ],
                )
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                child:   Text("Product Details: ${widget.productModel.productDiscription}")
                ),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Material(
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                    width: Get.width/2.5,
                    height: Get.height/14,
                    decoration: BoxDecoration(
                      color: AppConstants.appSecondaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextButton(onPressed: (){ },
                       child : Text('Add to Cart',
                     style: TextStyle(color: AppConstants.appTextColor),
                     ),
                     ),
                                 ),
                               ),
                             ),
                                Material(
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                    width: Get.width/2.5,
                    height: Get.height/14,
                    decoration: BoxDecoration(
                      color: AppConstants.appSecondaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextButton(onPressed: (){ },
                       child : Text('Buy now',
                     style: TextStyle(color: AppConstants.appTextColor),
                     ),
                     ),
                                 ),
                               ),
                             ),
                 ],
               ),
            ],
          ),
         ),
         )
          ],
        ),
      ) ,
    );
  }
}