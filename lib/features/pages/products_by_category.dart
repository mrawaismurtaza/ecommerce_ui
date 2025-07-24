import 'package:flutter/material.dart';
import 'package:ecommerce_ui/data/models/product.dart';
import 'package:ecommerce_ui/data/repositories/product_repository.dart';
import 'package:ecommerce_ui/features/widgets/product_list.dart';
import '../widgets/bottom_navbar.dart';

class ProductsByCategoryPage extends StatefulWidget {
  final String categoryName;

  const ProductsByCategoryPage({super.key, required this.categoryName});

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
  int _currentIndex = 1;
  List<Product> _products = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final response = await ProductRepository().getProductsByCategory(widget.categoryName);
      setState(() {
        _products = response;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Failed to load products';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Format category name for display
    String displayName = widget.categoryName.split('-')
        .map((word) => word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
        .join(' ');
        
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('$displayName Products', style: const TextStyle(color: Colors.black)),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : ProductList(products: _products),
      bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex),
    );
  }
}
