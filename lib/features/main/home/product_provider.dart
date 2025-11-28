import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shop_x/model/category_model.dart';
import 'package:shop_x/model/product_model.dart';
import 'package:shop_x/utils/constants.dart';

final fetchProductById = FutureProvider.family<ProductModel?, int>((
  ref,
  productId,
) async {
  final response = await http.get(Uri.parse("$baseUrl/products/$productId"));
  if (response.statusCode == 200) {
    final decode = jsonDecode(response.body);
    final product = ProductModel.fromMap(decode);
    return product;
  }

  return null;
});

final fetchProductsProvider = FutureProvider((ref) async {
  final response = await http.get(Uri.parse("$baseUrl/products"));

  final decode = jsonDecode(response.body);

  if (response.statusCode == 200) {
    final rawProducts = decode["products"];
    List<ProductModel> products = [];
    for (final element in List.from(rawProducts)) {
      products.add(ProductModel.fromMap(element));
    }
    return products;
  }

  throw Exception("Failed to fetch product");
});

final fetchCategoryProductProvider = FutureProvider((ref) async {
  final response = await http.get(Uri.parse("$baseUrl/products/categories"));

  /// Decode, convert dari String ke Object
  /// Encode, convert dari Object ke String
  final decode = jsonDecode(response.body);
  List<CategoryModel> categories = [];

  for (final element in List.from(decode)) {
    categories.add(CategoryModel.fromMap(element));
  }
  return categories;
});
