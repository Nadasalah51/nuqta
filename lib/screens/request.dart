import 'package:flutter/material.dart';
import 'package:nuqta/widget/buttom.dart';
import 'package:nuqta/widget/textformfeild.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  TextEditingController dateController = TextEditingController();
  List<String> countries = [];
  String? selectedCountry;

  List<String> cities = [];
  String? selectedCity;

  bool isLoadingCountries = true;
  bool isLoadingCities = false;

  List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String? selectedBloodGroup;
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

  Future<List<String>> getCountries() async {
    final response = await http.get(
        Uri.parse('https://countriesnow.space/api/v0.1/countries/positions'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List countries = data['data'];
      return countries
          .map<String>((country) => country['name'].toString())
          .toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<List<String>> getCities(String country) async {
    final response = await http.post(
      Uri.parse('https://countriesnow.space/api/v0.1/countries/cities'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"country": country}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<String>.from(data['data']);
    } else {
      throw Exception('Failed to load cities');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  void fetchCountries() async {
    try {
      List<String> countryList = await getCountries();
      setState(() {
        countries = countryList;
        isLoadingCountries = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('error...try again'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void fetchCities(String country) async {
    try {
      setState(() {
        isLoadingCities = true;
        cities = [];
      });
      List<String> cityList = await getCities(country);
      setState(() {
        cities = cityList;
        isLoadingCities = false;
      });
    } catch (e) {
      setState(() {
        isLoadingCities = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching cities. Please try again.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Request'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
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
                child: Text('Country'),
              ),
              isLoadingCountries
                  ? CircularProgressIndicator()
                  : Textformfeild(
                      text: 'Select Country',
                      readonly: true,
                      controller: TextEditingController(text: selectedCountry),
                      icon: Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                      ),
                      ontap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Select Country'),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: countries
                                      .map(
                                        (country) => ListTile(
                                          title: Text(country),
                                          onTap: () {
                                            setState(() {
                                              selectedCountry = country;
                                            });
                                            Navigator.of(context).pop();
                                            fetchCities(country);
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('City'),
              ),
              isLoadingCities
                  ? CircularProgressIndicator()
                  : Textformfeild(
                      text: 'Select City',
                      readonly: true,
                      controller: TextEditingController(text: selectedCity),
                      icon: Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                      ),
                      ontap: () {
                        if (selectedCountry != null) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Select City'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: cities
                                        .map((city) => ListTile(
                                              title: Text(city),
                                              onTap: () {
                                                setState(() {
                                                  selectedCity = city;
                                                });
                                                Navigator.of(context).pop();
                                              },
                                            ))
                                        .toList(),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
              Buttom(ontap: () {}, text: 'Create request')
            ],
          ),
        ),
      ),
    );
  }
}
