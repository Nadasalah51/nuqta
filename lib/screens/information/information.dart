import 'package:flutter/material.dart';
import 'package:nuqta/constant.dart';
import 'package:nuqta/screens/information/home_screen.dart';
import 'package:nuqta/screens/information/more_screen.dart';
import 'package:nuqta/screens/information/search.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Center(child: HomeScreen()),
      Center(child: Search()),
      Center(child: MoreScreen()),
    ];
    return Scaffold(
      body: pages[selectedIndex],
      backgroundColor: background,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
