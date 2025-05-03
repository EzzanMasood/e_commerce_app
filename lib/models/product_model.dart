import 'package:flutter/material.dart';

class ProductModel {
  final String productId;
  final String categoryId;
  final String productName;
  final String categoryName;
  final String salePrice;
  final String fullPrice;
  final List productImages;
  final String deliveryTime;
  final bool isSale;
  final String productDiscription;
  final dynamic createdAt;
  final dynamic updatedAt;

  ProductModel({
    required this.productId,
    required this.categoryId,
    required this.productName,
    required this.categoryName,
    required this.salePrice,
    required this.fullPrice,
    required this.productImages,
    required this.deliveryTime,
    required this.isSale,
    required this.productDiscription,
    required this.createdAt,
    required this.updatedAt,
  });
  Map<String, dynamic> toMap() {
    return {
      "productId": productId,
      "categoryId": categoryId,
      "productName": productName,
      "categoryName": categoryName,
      "salePrice": salePrice,
      "fullPrice": fullPrice,
      "productImages": productImages,
      "deliveryTime": deliveryTime,
      "isSale": isSale,
      "productDiscription": productDiscription,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
        productId: json["productId"],
        categoryId: json["categoryId"],
        productName: json["prodouctName"],
        categoryName: json["categoryName"],
        salePrice: json["salePrice"],
        fullPrice: json["fullPrice"],
        productImages: json["productImages"],
        deliveryTime: json["deliveryTime"],
        createdAt: json["createdAt"],
        isSale: json["isSale"],
        productDiscription: json["productDiscription"],
        updatedAt: json["updatedAt"]);
  }
}
