import 'package:ecommerce_ui/data/models/categories.dart';
import 'package:ecommerce_ui/data/repositories/categories_repository.dart';
import 'package:ecommerce_ui/features/widgets/catogories_list.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _currentIndex = 1;
  List<Categories> _allCategories = [];
  List<Categories> _filteredCategories = [];
  bool _isLoading = true;
  String? _error;
  final TextEditingController _searchController = TextEditingController();

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
        _allCategories = result;
        _filteredCategories = result;
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

  void _searchCategories(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCategories = _allCategories;
      } else {
        _filteredCategories = _allCategories
            .where((category) =>
                category.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CategoriesList(categories: _filteredCategories),
                ),
      bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex),
    );
  }
}