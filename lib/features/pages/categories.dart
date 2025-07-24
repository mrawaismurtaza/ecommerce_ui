import 'package:ecommerce_ui/data/models/categories.dart';
import 'package:ecommerce_ui/data/repositories/categories_repository.dart';
import 'package:ecommerce_ui/features/widgets/catogories_list.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';
import 'home.dart';
import 'favourites.dart';
import 'profile.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _currentIndex = 1;
  List<Categories> _categories = [];
  bool _isLoading = true;
  String? _error;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final result = await CategoriesRepository().fetchCategories();
      setState(() {
        _categories = result;
        _isLoading = false;
      });
    } catch (e) {
      // Handle any errors that occur during loading
      print('Error loading categories: $e');
      setState(() {
        _isLoading = false;
        _error = 'Failed to load categories';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories', style: TextStyle(
          fontSize: 30,
        ),),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _error != null
                ? Text(_error!)
                : CategoriesList(categories: _categories),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
      ),
    );
  }
}