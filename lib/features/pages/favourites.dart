import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';
import 'home.dart';
import 'categories.dart';
import 'profile.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  int _currentIndex = 2;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: const Center(
        child: Text('No favourites yet!'),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
      ),
    );
  }
}