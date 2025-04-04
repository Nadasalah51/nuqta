import 'package:flutter/material.dart';
import 'package:nuqta/constant.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.pink.shade200, width: 8),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: -9,
                  child: Image.asset(
                    'assets/images/blood.png',
                    width: 90,
                    height: 90,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'homepage');
              },
              child: Text(
                'Blood Care',
                style: TextStyle(
                    fontSize: 36, color: blue, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
