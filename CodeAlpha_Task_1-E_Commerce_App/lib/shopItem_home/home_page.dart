import 'package:flutter/material.dart';
import 'package:shopitem/explore_page/explore_page.dart';
import 'package:shopitem/dashboard/dashboard_page.dart';
import 'package:shopitem/order_page/order_page.dart';
import 'package:shopitem/profile_page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    DashboardPage(),
    ExplorePage(),
    OrderPage(),
    ProfilePage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "EXPLORE"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "ORDERS",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "PROFILE"),
        ],
      ),
    );
  }
}
