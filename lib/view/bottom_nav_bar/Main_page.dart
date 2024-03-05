import 'package:flutter/material.dart';
import 'package:news_app_with_api/controller/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6A3DE8)),
          child: BottomNavigationBar(
              currentIndex:
                  Provider.of<BottomNavController>(context).selectedIndex,
              onTap: Provider.of<BottomNavController>(context, listen: false)
                  .onItemTap,
              elevation: 0,
              backgroundColor: const Color(0xff6A3DE8),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 25,
              ),
              unselectedIconTheme: const IconThemeData(
                size: 25,
              ),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: "Category"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search"),
              ]),
        ),
      ),
    );
  }
}
