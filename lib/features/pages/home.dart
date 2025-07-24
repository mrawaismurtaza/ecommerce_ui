import 'package:ecommerce_ui/data/models/product.dart';
import 'package:ecommerce_ui/data/repositories/product_repository.dart';
import 'package:ecommerce_ui/features/widgets/product_list.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
      // Add navigation logic if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products', style: TextStyle(
          fontSize: 30,
        ),),
      ),
      body: Center(
        // child: FutureBuilder<List<Product>>(
        //   future: ProductRepository().getProducts(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const CircularProgressIndicator();
        //     } else if (snapshot.hasError) {
        //       return Text('Error: ${snapshot.error}');
        //     } else {
        //       return ProductList(products: snapshot.data ?? []);
        //     }
        //   },
        // ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}