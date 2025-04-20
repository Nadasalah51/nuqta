import 'package:flutter/material.dart';
import 'package:nuqta/constant.dart';
import 'package:nuqta/screens/profile_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        centerTitle: true,
        backgroundColor: background,
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              Get.to(ProfileScreen());
            },
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(ProfileScreen());
                  },
                  icon: Icon(Icons.person),
                ),
                Text('Edit your Profile info'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
