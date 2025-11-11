import 'dart:io';

import 'package:fruite_app/core/entities/product_entity.dart';
import 'package:fruite_app/core/helper/functions/get_average_rating.dart';
import 'package:fruite_app/core/models/review_product_model.dart';

class ProductModel {
  final String name;
  final String description;
  final double price;
  final String code;
  final bool isFutureProduct;
  final File? image;
  String? imagePath;
  final int expireDate;
  final bool isOrganic;
  final int calories;
  final int unitAmount;
  final double avgRating;
  final num sellingCount;
  final int totalRating;
  final List<ReviewProductModel> reviews;

  ProductModel({
    required this.code,
    required this.image,
    required this.isFutureProduct,
    required this.name,
    required this.description,
    required this.price,
    this.imagePath,
    required this.expireDate,
    required this.isOrganic,
    required this.calories,
    required this.unitAmount,
    required this.avgRating,
    required this.sellingCount,
    required this.totalRating,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviews = json['reviews'] != null
        ? (json['reviews'] as List)
            .map((x) => ReviewProductModel.fromJson(x))
            .toList()
        : <ReviewProductModel>[];
        
    return ProductModel(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      code: json['code'],
      isFutureProduct: json['isFutureProduct'],
      image: json['image'],
      imagePath: json['imagePath'],
      expireDate: json['expireDate'],
      isOrganic: json['isOrganic'],
      calories: json['calories'],
      unitAmount: json['unitAmount'],
      avgRating: reviews.isNotEmpty ? getAvgRating(reviews) : 0.0,
      sellingCount: json['sellingCount'],
      totalRating: json['totalRating'],
      reviews: reviews,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      description: description,
      price: price,
      code: code,
      isFutureProduct: isFutureProduct,
      image: image,
      imagePath: imagePath,
      expireDate: expireDate,
      isOrganic: isOrganic,
      calories: calories,
      unitAmount: unitAmount,
      avgRating: avgRating,
      totalRating: totalRating,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'isFutureProduct': isFutureProduct,
      'imagePath': imagePath,
      'expireDate': expireDate,
      'isOrganic': isOrganic,
      'calories': calories,
      'unitAmount': unitAmount,
      'avgRating': avgRating,
      'sellingCount': sellingCount,
      'totalRating': totalRating,
      'reviews': reviews.map((e) => e.toMap()).toList(),
    };
  }
}
