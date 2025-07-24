import 'package:ecommerce_ui/data/models/product.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  List<Product> _products = [];
  final dio = Dio(); // Assuming Dio is used for HTTP requests

  Future<List<Product>> getProducts() async {
    // Simulate a network delay
    final response = await dio.get('https://dummyjson.com/products?limit=100');
    final productsJson = response.data['products'] as List;
    _products = productsJson
        .map((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();
    return _products;
  }
}