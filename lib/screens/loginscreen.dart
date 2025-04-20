import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuqta/constant.dart';
import 'package:nuqta/screens/profile_screen.dart';
import 'package:nuqta/screens/signupscreen.dart';
import 'package:nuqta/widget/buttomicon.dart';
import 'package:nuqta/widget/textformfeild.dart';
import 'package:nuqta/widget/buttom.dart';
import 'forgetnumber.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool isPasswordVisible = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          spacing: 11.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to blood care',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'Enter your email address and password to login',
              style: TextStyle(fontSize: 20),
            ),
            Text('Mobile'),
            Textformfeild(text: 'enter your number'),
            Text('Password'),
            Textformfeild(
              text: 'enter your password',
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              ontap: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              obscure: !isPasswordVisible,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.to(Forgetnumber());
                },
                child: Text(
                  'forget password?',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            SizedBox(height: 30),
            Buttom(
                ontap: () {
                  Get.to(ProfileScreen());
                },
                text: 'login'),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Or login with",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Spacer(flex: 1),
                Buttomicon(
                  ontap: () {},
                  text: 'facebook',
                  icon: Icons.facebook,
                  color: Colors.blue,
                ),
                Spacer(flex: 1),
                Buttomicon(
                  ontap: () {},
                  text: 'google',
                  icon: Icons.g_mobiledata,
                  color: red,
                ),
                Spacer(flex: 1),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(Signupscreen());
                    },
                    child: Text('Sign up',
                        style: TextStyle(fontSize: 20, color: Colors.red)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
