import 'package:flutter/material.dart';
import 'package:project/services/exercise_service.dart';

class ExercisesWidget extends StatefulWidget {
  const ExercisesWidget({super.key});

  @override
  State<ExercisesWidget> createState() => _ExercisesWidgetState();
}

class _ExercisesWidgetState extends State<ExercisesWidget> {
  List<dynamic> exercises = [];
  final List<String> parts = ["back", "chest", "thighs"];
  String? selectedPart;

  Future<void> fetchExercises() async {
    try {
      final result = await ExerciseService.fetchExercises(
        bodyPart: selectedPart,
      );

      setState(() {
        exercises = result;
      });
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Body Part',
                labelStyle: TextStyle(color: Colors.white60),
              ),
              dropdownColor: Color(0xFF2A2A2A),
              style: TextStyle(color: Colors.white),
              initialValue: selectedPart,
              items: parts
                  .map(
                    (part) => DropdownMenuItem(
                      value: part,
                      child: Text(part.toUpperCase()),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() => selectedPart = value);
                fetchExercises();
              },
            ),
          ),
          Expanded(
            child: exercises.isEmpty
                ? Center(
                    child: CircularProgressIndicator(color: Color(0xFF8A9A5B)),
                  )
                : ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = exercises[index];
                      return Card(
                        color: Color(0xFF2C2C2C),
                        margin: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        child: ListTile(
                          leading: Image.network(
                            exercise.imageUrl,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(exercise.name),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
