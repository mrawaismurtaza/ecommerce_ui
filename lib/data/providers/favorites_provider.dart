import 'package:flutter/foundation.dart';
import '../models/product.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => List.unmodifiable(_favorites);

  bool isFavorite(Product product) {
    return _favorites.any((fav) => fav.id == product.id);
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product)) {
      _favorites.removeWhere((fav) => fav.id == product.id);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  void removeFavorite(Product product) {
    _favorites.removeWhere((fav) => fav.id == product.id);
    notifyListeners();
  }

  List<Product> searchFavorites(String query) {
    if (query.isEmpty) return _favorites;
    return _favorites.where((product) =>
      product.title.toLowerCase().contains(query.toLowerCase()) ||
      product.category.toLowerCase().contains(query.toLowerCase()) ||
      product.brand.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
}
