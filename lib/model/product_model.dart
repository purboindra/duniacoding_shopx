// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shop_x/model/review_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ReviewModel> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final int? quantity;
  final double? discountedTotal;
  final List<String> images;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.images,
    required this.thumbnail,
    required this.quantity,
    required this.discountedTotal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((x) => x.toMap()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'images': images,
      'thumbnail': thumbnail,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    try {
      return ProductModel(
        id: map['id'] as int,
        title: map['title'] as String,
        description: (map['description'] ?? "") as String,
        category: (map['category'] ?? "") as String,
        price: map['price'] ?? 0.0,
        discountPercentage: double.parse(
          (map['discountPercentage'] ?? 0.0).toString(),
        ),
        rating: map['rating'] ?? 0.0,
        stock: map['stock'] ?? 0,
        tags: List<String>.from((map['tags'] ?? [])),
        brand: map['brand'] ?? "",
        sku: map['sku'] ?? "",
        weight: map['weight'] ?? 0,
        warrantyInformation: map['warrantyInformation'] ?? "",
        shippingInformation: map['shippingInformation'] ?? "",
        availabilityStatus: map['availabilityStatus'] ?? "",
        reviews: List<ReviewModel>.from(
          (map['reviews'] ?? []).map<ReviewModel>(
            (x) => ReviewModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        returnPolicy: map['returnPolicy'] ?? "",
        minimumOrderQuantity: map['minimumOrderQuantity'] ?? 0,
        images: List<String>.from((map['images'] ?? [])),
        thumbnail: map['thumbnail'] ?? "",
        quantity: map['quantity'] as int?,
        discountedTotal: map['discountedTotal'] != null
            ? double.tryParse(map['discountedTotal'].toString())
            : null,
      );
    } catch (e, st) {
      print("Error parsing ProductModel: $e");
      print("StackTrace: $st");
      throw Exception('Error parsing ProductModel: $e');
    }
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
