import 'package:codeme_project/features/browspage/view/browser_screen.dart';
import 'package:codeme_project/features/cartpage/view/cart_screen.dart';
import 'package:codeme_project/features/favouratepage/view/favourate_screen.dart';
import 'package:codeme_project/features/homescreenpage/view/home_screen.dart';
import 'package:codeme_project/utils/colorutils.dart';
import 'package:flutter/material.dart';

class BottomnavigationScreen extends StatefulWidget {
  const BottomnavigationScreen({super.key});

  @override
  State<BottomnavigationScreen> createState() => _BottomnavigationScreenState();
}

class _BottomnavigationScreenState extends State<BottomnavigationScreen> {
  int bottomnavintex = 0;
  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    BrowserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[bottomnavintex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 10,
        selectedItemColor: Colorutils.buttoncolor,
        unselectedItemColor: Colors.grey.shade400,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        currentIndex: bottomnavintex,
        onTap: (value) {
          setState(() {
            bottomnavintex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Discover",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorites",
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
            activeIcon: Icon(Icons.shopping_bag),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: "Brows",
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
