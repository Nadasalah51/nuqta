import 'package:flutter/material.dart';
import 'package:nuqta/constant.dart';
import 'package:nuqta/screens/information/donate.dart';
import 'package:nuqta/screens/information/organization.dart';
import 'package:nuqta/screens/information/request.dart';
import 'package:nuqta/screens/information/setting.dart';
import 'package:nuqta/widget/create_more.dart';
import 'package:get/get.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
        centerTitle: true,
      ),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
        child: Column(
          children: [
            CreateMore(
              icon: Icons.report,
              text: 'Create a blood request',
              ontap: () {
                Get.to(Request());
              },
            ),
            CreateMore(
              icon: Icons.volunteer_activism,
              text: 'Create a blood donation request',
              ontap: () {
                Get.to(Donate());
              },
            ),
            CreateMore(
              icon: Icons.bloodtype,
              text: 'Blood Donate Organization',
              ontap: () {
                Get.to(Organization());
              },
            ),
            CreateMore(
              icon: Icons.settings,
              text: 'Setting',
              ontap: () {
                Get.to(Setteing());
              },
            ),
          ],
        ),
      ),
    );
  }
}
