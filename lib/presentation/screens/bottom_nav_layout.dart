import 'package:ecommerce/presentation/controllers/bottom_nav_bar_controller.dart';
import 'package:ecommerce/presentation/screens/cart_screen.dart';
import 'package:ecommerce/presentation/screens/categories_screen.dart';
import 'package:ecommerce/presentation/screens/home_screen.dart';
import 'package:ecommerce/presentation/screens/wish_list_screen.dart';
import 'package:ecommerce/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavLayout extends StatelessWidget {
  BottomNavLayout({super.key});
  final BottomNavBarController _bottomNavBarController=Get.find<BottomNavBarController>();

  final List<Widget> _screens=const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavBarController>(
        builder: (_) {
          return _screens[_bottomNavBarController.selectedNavBarItem];
        }
      ),
      bottomNavigationBar: GetBuilder<BottomNavBarController>(
        builder: (_) {
          return BottomNavigationBar(
            onTap: (int index){
              _bottomNavBarController.changeSelectedItem(index);
            },
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.black54,
            currentIndex: _bottomNavBarController.selectedNavBarItem,
            elevation: 1,
            enableFeedback: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                label: 'Categories'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined),
                label: 'Cart'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Wishlist'
              ),
            ],
          );
        }
      ),
    );
  }
}