import 'package:flutter/material.dart';
import 'package:news_app_with_api/view/category_screen/category_screen.dart';
import 'package:news_app_with_api/view/home_screen/home_screen.dart';
import 'package:news_app_with_api/view/search_screen/search_screen.dart';

class BottomNavController with ChangeNotifier{

  int selectedIndex = 1;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeScreen(),
    CAtegoryScreen(),
    SearchScreen()
  ];

}
