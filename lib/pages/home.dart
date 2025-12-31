import 'package:flutter/material.dart';
import '../database/storage.dart';
import 'plan.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Map<String, dynamic>? activatedPlan;

  @override
  void initState() {
    super.initState();
    activatedPlan = WorkoutPlanStorage.activePlan; // โหลดแผนที่กำลังทำ
  }

  void openPlanDetail(Map<String, dynamic> plan) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PlanDetailPage(plan: plan)),
    );

    setState(() {
      activatedPlan = WorkoutPlanStorage.activePlan;
    });
  }

  @override
  Widget build(BuildContext context) {
    final plans = WorkoutPlanStorage.workoutPlans;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Workout Plans',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // -------------------------------------------------------
          // ACTIVATED PLAN SECTION
          // -------------------------------------------------------
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(16),
              ),

              child: activatedPlan == null
                  ? Column(
                      children: [
                        Text(
                          "No Plan Activated",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 12),
                        Text(
                          "Please Add Plan",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    )
                  // activated plan สามารถกดเข้าไปดูได้
                  : InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => openPlanDetail(activatedPlan!),
                      child: Column(
                        children: [
                          Text(
                            activatedPlan!["name"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 12),
                          Text(
                            "Activated",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "Plans",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // -------------------------------------------------------
          // PLAN LIST (horizontal)
          // -------------------------------------------------------
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: plans.length,
              itemBuilder: (context, i) {
                final plan = plans[i];

                return Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: EdgeInsets.only(right: 16),
                  child: Card(
                    color: Color(0xFF2C2C2C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => openPlanDetail(plan),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.fitness_center,
                              size: 40,
                              color: Colors.white,
                            ),

                            SizedBox(height: 8),
                            Text(
                              plan["name"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
