import 'package:flutter/material.dart';
import 'package:nuqta/widget/buttom.dart';
import 'package:nuqta/widget/more_row.dart';

import '../../constant.dart';

class Donate extends StatefulWidget {
  const Donate({super.key});

  @override
  State<Donate> createState() => _DonateState();
}

bool sure = false;

class _DonateState extends State<Donate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Donate Request'),
        centerTitle: true,
        backgroundColor: background,
        surfaceTintColor: background,
      ),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Are you sure willing to donate blood with below information?',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    maxLines: 3,
                  ),
                ),
                Switch(
                  value: sure,
                  onChanged: (value) => setState(() => sure = value),
                  activeColor: red,
                )
              ],
            ),
            Text(
              "(The below information is based on your profile)",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    MoreRow(icon: Icons.person, text: "Name", value: "Nada"),
                    Divider(),
                    MoreRow(
                        icon: Icons.bloodtype,
                        text: "Blood Group",
                        value: "O+"),
                    Divider(),
                    MoreRow(icon: Icons.cake, text: "Age", value: "30"),
                    Divider(),
                    MoreRow(icon: Icons.male, text: "Gender", value: "female"),
                    Divider(),
                    MoreRow(
                        icon: Icons.location_city,
                        text: "State",
                        value: "Qalyubia"),
                    Divider(),
                    MoreRow(
                        icon: Icons.location_on_outlined,
                        text: "City",
                        value: "Shubra El Kheima"),
                    Divider(),
                    MoreRow(
                        icon: Icons.phone,
                        text: "Mobile",
                        value: "01061796868"),
                  ],
                ),
              ),
            ),
            Buttom(ontap: () {}, text: 'Confirm Donate')
          ],
        ),
      ),
    );
  }
}
