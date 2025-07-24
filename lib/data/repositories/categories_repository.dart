import 'package:dio/dio.dart';
import 'package:ecommerce_ui/data/models/categories.dart';

class CategoriesRepository {
  late Categories categories;
  Future<List<Categories>> fetchCategories() async {
    final dio = Dio();
    final response = await dio.get('https://dummyjson.com/products/categories');
    if (response.statusCode == 200) {
      final categories = (response.data as List)
          .map((category) => Categories(
                slug: category.toString(),
                name: category.toString(),
                url: 'https://via.placeholder.com/100?text=${Uri.encodeComponent(category.toString())}',
              ))
          .toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}