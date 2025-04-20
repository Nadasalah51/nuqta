import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuqta/constant.dart';
import 'package:nuqta/widget/buttom.dart';
import 'package:nuqta/widget/buttomicon.dart';
import 'package:nuqta/widget/textformfeild.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              Text(
                'Create your account and fill in the form below to get start',
                style: TextStyle(fontSize: 20),
              ),
              Text('Name'),
              Textformfeild(text: 'enter your name'),
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
              Text('Confirm Password'),
              Textformfeild(
                text: 'enter your password',
                icon: Icon(
                  isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
                ontap: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
                obscure: !isConfirmPasswordVisible,
              ),
              SizedBox(height: 30),
              Buttom(
                  ontap: () {
                    Navigator.pushNamed(context, 'verifyscreen');
                  },
                  text: 'Sign up'),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                // crossAxisAlignment: CrossAxisAlignment.spaceEvenly,
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
                    'already have an account?',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
