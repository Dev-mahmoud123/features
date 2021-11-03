import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasky/presentation_layer/screens/custom_bottom_navigation_bar_screen/bottom_navy_bar.dart';
import 'package:tasky/presentation_layer/widgets/url_launcher_widget.dart';

import 'bottom_navy_bar_item.dart';

class CustomBottomNavigationBarScreen extends StatefulWidget {
  const CustomBottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarScreenState createState() =>
      _CustomBottomNavigationBarScreenState();
}

class _CustomBottomNavigationBarScreenState
    extends State<CustomBottomNavigationBarScreen> {
  late int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Bottom Navigation Bar'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          const UrlLauncherWidget(),
          Container(color: Colors.red),
          Container(color: Colors.pink),
          Container(color: Colors.purpleAccent),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        onItemSelected: (int index) {
          setState(() {
            currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            inActiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Apps'),
              activeColor: Colors.red,
              inActiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              activeColor: Colors.pink,
              inActiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
              activeColor: Colors.purpleAccent,
              inActiveColor: Colors.grey),
        ],
      ),
    );
  }
}
