import 'package:flutter/material.dart';
import 'package:nuqta/widget/buttom.dart';
import 'package:nuqta/widget/textformfeild.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  TextEditingController dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  String? selectedCountry;
  String? selectedCity;
  final List<String> countries = ['Egypt', 'USA', 'UK'];
  final List<String> cities = ['Cairo', 'Alexandria', 'London'];

  DropdownButton<String> buildDropdown(
      List<String> items, String? selectedItem, Function(String?) onChanged) {
    return DropdownButton<String>(
      value: selectedItem,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void showCountryPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Country'),
          content: DropdownButton<String>(
            value: selectedCountry,
            onChanged: (String? newCountry) {
              setState(() {
                selectedCountry = newCountry;
              });
              Navigator.of(context).pop();
            },
            items: countries.map<DropdownMenuItem<String>>((String country) {
              return DropdownMenuItem<String>(
                value: country,
                child: Text(country),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Request'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Textformfeild(text: 'blood group'),
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
                  'Country',
                ),
              ),
              Textformfeild(
                text: 'Select Country',
                readonly: true,
                //controller: s,
                icon: Icon(Icons.location_on),
                ontap: () {
                  showCountryPicker(context);
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'City',
                ),
              ),
              Textformfeild(text: 'select city'),
              Buttom(ontap: () {}, text: 'Create request')
            ],
          ),
        ),
      ),
    );
  }
}
