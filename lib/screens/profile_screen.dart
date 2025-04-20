import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuqta/constant.dart';
import 'package:nuqta/screens/information/request.dart';
import 'package:nuqta/widget/buttom.dart';
import 'package:nuqta/widget/textformfeild.dart';
import '../widget/blood_group.dart';
import '../widget/location.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PageController pageController = PageController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController choiceController = TextEditingController();
  int currentPage = 0;
  String? stateValue;
  String? cityValue;
  String? selectedBloodGroup;
  String? selectedGender;
  String? selectedChoice;
  int? age;
  final List<String> genders = ['Male', 'Female'];
  final List<String> choices = ['Yes', 'No'];

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
        age = calculateAge(pickedDate);
      });
    }
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  List<String> get governorates => egyptGovernorates.keys.toList();
  List<String> get cities =>
      stateValue != null ? egyptGovernorates[stateValue!]! : [];
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(15, 250, 0, 20),
              radius: 40,
              child: Icon(
                Icons.person_2_outlined,
                size: 40,
                color: Color(0xFFF0A5A3),
              ),
            ),
            Text('Personal information'),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Name',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Textformfeild(text: 'Enter your name'),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Number',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Textformfeild(text: 'Enter your number'),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Group',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Textformfeild(
              text: 'Select Blood Group',
              readonly: true,
              controller: TextEditingController(text: selectedBloodGroup),
              icon: Icon(Icons.arrow_drop_down),
              items: bloodGroups,
              onItemTap: (value) {
                setState(() {
                  selectedBloodGroup = value;
                });
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your State',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Textformfeild(
              text: stateValue == null
                  ? 'Select Governorate'
                  : 'your state is $stateValue',
              readonly: true,
              icon: Icon(Icons.arrow_drop_down),
              items: governorates,
              onItemTap: (value) {
                setState(() {
                  stateValue = value;
                  cityValue = null;
                });
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your City',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Textformfeild(
              text:
                  cityValue == null ? 'Select City' : 'your city is $cityValue',
              readonly: true,
              icon: Icon(Icons.arrow_drop_down),
              items: cities,
              onItemTap: (value) {
                setState(() {
                  cityValue = value;
                });
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                  'Your location is ${cityValue != null ? '$stateValue , $cityValue' : ''}'),
            ),
          ],
        ),
      ), // Placeholder
      SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(15, 250, 0, 20),
              radius: 40,
              child: Icon(
                Icons.person_2,
                size: 40,
                color: pink,
              ),
            ),
            Text('Basic Info'),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select your birthday',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Textformfeild(
                text: 'select date',
                readonly: true,
                controller: dateController,
                icon: Icon(Icons.calendar_month),
                ontap: () {
                  selectDate(context);
                }),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Your age: ${age ?? ''}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Gender',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Textformfeild(
                text: 'Select your gender',
                controller: genderController,
                readonly: true,
                icon: Icon(Icons.arrow_drop_down),
                items: genders,
                onItemTap: (value) {
                  setState(() {
                    selectedGender = value;
                    genderController.text = value;
                  });
                }),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'I want to donate blood',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Textformfeild(
              text: 'you want to donate blood',
              controller: choiceController,
              readonly: true,
              icon: Icon(Icons.arrow_drop_down),
              items: choices,
              onItemTap: (value) {
                setState(() {
                  selectedChoice = value;
                  choiceController.text = value;
                });
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About yourself',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Textformfeild(
              text: 'type about yourself',
              height: 60,
              minlines: 2,
              maxlines: 5,
            ),
          ],
        ),
      ), // Placeholder// Placeholder
    ];
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'Profile Setup',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: currentPage > 0
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              )
            : null,
        backgroundColor: background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Expanded(
              child: PageView.builder(
                  itemBuilder: (context, index) => pages[index],
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  }),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Buttom(
                    ontap: () {
                      if (currentPage < pages.length - 1) {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Get.to(Request());
                      }
                    },
                    text: currentPage == pages.length - 1 ? 'Finish' : 'Next'))
          ],
        ),
      ),
    );
  }
}
