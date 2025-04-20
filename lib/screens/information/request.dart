import 'package:flutter/material.dart';
import 'package:nuqta/constant.dart';
import 'package:nuqta/widget/buttom.dart';
import 'package:nuqta/widget/textformfeild.dart';
import '../../widget/blood_group.dart';
import '../../widget/location.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  TextEditingController dateController = TextEditingController();
  String? stateValue;
  String? cityValue;
  String? selectedBloodGroup;
  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  List<String> get governorates => egyptGovernorates.keys.toList();
  List<String> get cities =>
      stateValue != null ? egyptGovernorates[stateValue!]! : [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Create Blood Request'),
        centerTitle: true,
        backgroundColor: background,
        surfaceTintColor: background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            children: [
              Text(
                'Blood Request Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'post title',
                ),
              ),
              Textformfeild(text: 'Type title'),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'select group',
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
                  'Amount of request blood',
                ),
              ),
              Textformfeild(text: 'Type how much blood you want'),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date',
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
              Text(
                'Hospital Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hospital name',
                ),
              ),
              Textformfeild(text: 'type hospital name'),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Why do you need blood',
                ),
              ),
              Textformfeild(
                text: 'type reason of blood request',
                height: 70,
                minlines: 2,
                maxlines: 5,
              ),
              Text(
                'Personal Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Contact name',
                ),
              ),
              Textformfeild(text: 'type name'),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Contact number',
                ),
              ),
              Textformfeild(text: 'type number'),
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
                icon: Icon(Icons.location_city),
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
                text: cityValue == null
                    ? 'Select City'
                    : 'your city is $cityValue',
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
              Buttom(ontap: () {}, text: 'Create request'),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
