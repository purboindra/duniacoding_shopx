import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_x/features/main/home/ui/home_screen.dart';
import 'package:shop_x/features/main/main_provider.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final List<Widget> _pages = [
    HomeScreen(), // index 0
    Center(child: Text("Cart Screen")), // index 1
    Center(child: Text("Profile Screen")), // index 2
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomIndex = ref.watch(bottomNavigationBarProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop X"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: _pages[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: (index) => ref
            .read(bottomNavigationBarProvider.notifier)
            .setBottomIndex(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
