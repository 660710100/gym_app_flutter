import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TDEEWidget extends StatefulWidget {
  const TDEEWidget({super.key});

  @override
  State<TDEEWidget> createState() => _TDEEWidgetState();
}

class _TDEEWidgetState extends State<TDEEWidget> {
  final formKey = GlobalKey<FormState>();
  String? gender = "male";
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double? tdee;
  double? bmr;

  String? selectedLevel;
  final List<String> activityLevels = [
    "Sedentary (little or no exercise)",
    "Lightly active (exercise 1–3 days/week)",
    "Moderately active (exercise 3–5 days/week)",
    "Very active (exercise 6–7 days/week)",
    "Extra active (physical job or intense training)",
  ];

  Future<void> postTDEE({
    required String gender,
    required int age,
    required double height,
    required double weight,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("https://health-calculator-api.p.rapidapi.com/bmr/post"),
        headers: {
          "X-Rapidapi-Key":
              "493b404891msh5356df915b2a88ep1a7ffbjsn8e4038019937",
          "X-Rapidapi-Host": "health-calculator-api.p.rapidapi.com",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "gender": gender,
          "age": age,
          "weight": weight,
          "height": height,
          "equation": "mifflin",
        }),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        debugPrint("$result");

        setState(() {
          String textBmr = result["bmr"].toString();
          bmr = double.parse(textBmr.split(' ')[0]);
        });
      } else {
        throw Exception("Failed to calculate BMR: ${response.body}");
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  double calculateTDEE(double bmr, String activityLevel) {
    double multiplier;

    switch (activityLevel) {
      case "Sedentary (little or no exercise)":
        multiplier = 1.2;
        break;
      case "Lightly active (exercise 1–3 days/week)":
        multiplier = 1.375;
        break;
      case "Moderately active (exercise 3–5 days/week)":
        multiplier = 1.55;
        break;
      case "Very active (exercise 6–7 days/week)":
        multiplier = 1.725;
        break;
      case "Extra active (physical job or intense training)":
        multiplier = 1.9;
        break;
      default:
        multiplier = 1.2;
    }

    return bmr * multiplier;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TDEE Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Enter your age' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(labelText: 'Height (cm)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Enter height' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: weightController,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Enter weight' : null,
              ),
              RadioGroup(
                groupValue: gender,
                onChanged: (value) {
                  setState(() => gender = value);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile(title: Text('Male'), value: 'male'),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Text('Female'),
                        value: 'female',
                      ),
                    ),
                  ],
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Activity Level',
                  labelStyle: const TextStyle(color: Colors.white60),
                ),
                dropdownColor: const Color(0xFF2A2A2A),
                style: const TextStyle(color: Colors.white),
                items: activityLevels
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLevel = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await postTDEE(
                          gender: gender!,
                          age: int.parse(ageController.text),
                          height: double.parse(heightController.text),
                          weight: double.parse(weightController.text),
                        );
                        if (bmr != null) {
                          tdee = calculateTDEE(bmr!, selectedLevel!);
                        }
                      }
                    },
                    child: const Text('Calculate TDEE'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ageController.clear();
                      heightController.clear();
                      weightController.clear();
                    },
                    child: Text('Clear'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (tdee != null)
                Text(
                  'Your TDEE: ${tdee!.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
