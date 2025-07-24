import 'package:dio/dio.dart';
import 'package:ecommerce_ui/data/models/categories.dart';

class CategoriesRepository {
  Future<List<Categories>> fetchCategories() async {
    final dio = Dio();
    final response = await dio.get('https://dummyjson.com/products/categories');
    if (response.statusCode == 200) {
      final categoriesData = response.data as List;
      final categories = categoriesData
          .map((categoryData) {
            // Handle both string and object formats
            String categoryName;
            if (categoryData is String) {
              categoryName = categoryData;
            } else if (categoryData is Map<String, dynamic>) {
              categoryName = categoryData['name'] ?? categoryData.toString();
            } else {
              categoryName = categoryData.toString();
            }
            return Categories.fromString(categoryName);
          })
          .toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}