import 'package:flutter/material.dart';
import '../database/storage.dart';

class PlanDetailPage extends StatelessWidget {
  final Map<String, dynamic> plan;

  const PlanDetailPage({super.key, required this.plan});

  void startPlan(BuildContext context) {
    WorkoutPlanStorage.setActivePlan(plan);
    Navigator.pop(context);
  }

  void endPlan(BuildContext context) {
    WorkoutPlanStorage.activePlan = null;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final days = plan["days"] as List;

    final currentActive = WorkoutPlanStorage.activePlan;

    return Scaffold(
      appBar: AppBar(title: Text(plan["name"])),

      body: ListView.builder(
        itemCount: days.length,
        itemBuilder: (_, i) {
          final day = days[i];
          final exercises = day["exercises"] as List;

          return Card(
            color: const Color(0xFF2C2C2C),
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day["day"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...exercises.map(
                    (ex) => ListTile(
                      leading: Image.network(
                        ex["imageUrl"],
                        width: 40,
                        height: 40,
                      ),
                      title: Text(ex["name"]),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: currentActive == null
          ? FloatingActionButton.extended(
              onPressed: () => startPlan(context),
              label: const Text("Start Plan"),
              icon: const Icon(Icons.play_arrow),
            )
          : currentActive["id"] == plan["id"]
          ? FloatingActionButton.extended(
              onPressed: () => endPlan(context),
              label: const Text("End Plan"),
              icon: const Icon(Icons.stop),
            )
          : null,
    );
  }
}
