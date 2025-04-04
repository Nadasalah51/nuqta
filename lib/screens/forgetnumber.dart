import 'package:flutter/material.dart';
import 'package:nuqta/widget/textformfeild.dart';
import 'package:nuqta/widget/buttom.dart';

class Forgetnumber extends StatelessWidget {
  const Forgetnumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Forget Password',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your mobile number and we will send you a OTP code to reset your password',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Spacer(flex: 2),
            Text(
              'mobile number',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Spacer(flex: 1),
            Textformfeild(text: 'enter your number'),
            Spacer(flex: 50),
            Buttom(ontap: () {}, text: 'send'),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
