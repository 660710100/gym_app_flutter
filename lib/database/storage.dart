class WorkoutPlanStorage {
  static Map<String, dynamic>? activePlan;

  static void setActivePlan(Map<String, dynamic> plan) {
    activePlan = plan;
  }

  static final List<Map<String, dynamic>> workoutPlans = [
    {
      "id": "strength",
      "name": "Strength Plan",
      "days": [
        {
          "day": "Upper Strength",
          "exercises": [
            {
              "name": "Bridge - Mountain Climber",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/I88s2KW/41n2ha5iPFpN3hEJ__Bridge---Mountain-Climber-(Cross-Body)-(female)_Waist.png",
            },
            {
              "name": "Triceps Dip",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/1e6EUNM/41n2hadQgEEX8wDN__Triceps-Dip_Upper-Arms.png",
            },
            {
              "name": "Seated Row with Towel",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/XZdUjUY/41n2hcFJpBvAkXCP__Seated-Row-with-Towel_Back_720.png",
            },
          ],
        },
        {
          "day": "Lower Strength",
          "exercises": [
            {
              "name": "Side Lunge",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/LPzfTTJ/41n2haAabPyN5t8y__Side-Lunge_Thighs.png",
            },
            {
              "name": "Jump Squat",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/xJMWf8O/41n2hbdZww1thMKz__Jump-Squat-II_Thighs.png",
            },
            {
              "name": "Dumbbell Stiff Leg Deadlift",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/ep9ZHO7/41n2hcw2FN534HcA__Dumbbell-Stiff-Leg-Deadlift_Waist.png",
            },
          ],
        },
      ],
    },
    {
      "id": "gain_muscle",
      "name": "Gain Muscle Plan",
      "days": [
        {
          "day": "Chest / Triceps",
          "exercises": [
            {
              "name": "Diamond Press",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/ocXAZeF/41n2hdCBvmbCPaVE__Diamond-Press_Back.png",
            },
            {
              "name": "Dumbbell Incline One Arm Hammer Press",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/iFeKp3f/41n2haNJ3NA8yCE2__Dumbbell-Incline-One-Arm-Hammer-Press_Upper-Arms.png",
            },
          ],
        },
        {
          "day": "Back / Biceps",
          "exercises": [
            {
              "name": "Chin-ups",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/MSgUDiH/41n2hd6SThQhAdnZ__Chin-ups-(narrow-parallel-grip)_Back.png",
            },
            {
              "name": "Suspended Row",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/moTFBCp/41n2hdkBpqwoDmVq__Suspended-Row_back.png",
            },
          ],
        },
        {
          "day": "Leg Day",
          "exercises": [
            {
              "name": "Single Leg Squat",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/motvNua/41n2hd78zujKUEWK__Single-Leg-Squat-(pistol)-male_Thighs.png",
            },
            {
              "name": "Calf Raise from Deficit with Chair Supported",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/Z0kJQui/41n2hcm5HH6H684G__Calf-Raise-from-Deficit-with-Chair-Supported_Calves.png",
            },
          ],
        },
        {
          "day": "Shoulders + Core",
          "exercises": [
            {
              "name": "Right Cross. Boxing",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/BTHVvSb/41n2hdo2vCtq4F3E__Boxing-Right-Cross.png",
            },
            {
              "name": "Alternate Punching",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/aVlvQ57/41n2hezAZ6CdkAcM__Alternate-Punching-(female)_Cardio_720.png",
            },
          ],
        },
      ],
    },
    {
      "id": "lose_weight",
      "name": "Lose Weight Plan",
      "days": [
        {
          "day": "Cardio",
          "exercises": [
            {
              "name": "Elliptical Machine Walk",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/tu1yTRr/41n2hfa11fPnk8y9__Elliptical-Machine-Walk_Cardio.png",
            },
          ],
        },
        {
          "day": "Full Body",
          "exercises": [
            {
              "name": "Bridge - Mountain Climber",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/I88s2KW/41n2ha5iPFpN3hEJ__Bridge---Mountain-Climber-(Cross-Body)-(female)_Waist.png",
            },
            {
              "name": "Side Lunge",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/LPzfTTJ/41n2haAabPyN5t8y__Side-Lunge_Thighs.png",
            },
          ],
        },
        {
          "day": "HIIT",
          "exercises": [
            {
              "name": "Jump Squat",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/xJMWf8O/41n2hbdZww1thMKz__Jump-Squat-II_Thighs.png",
            },
            {
              "name": "Dumbbell Stiff Leg Deadlift",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/ep9ZHO7/41n2hcw2FN534HcA__Dumbbell-Stiff-Leg-Deadlift_Waist.png",
            },
          ],
        },
        {
          "day": "Core + Cardio",
          "exercises": [
            {
              "name": "Bridge - Mountain Climber",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/I88s2KW/41n2ha5iPFpN3hEJ__Bridge---Mountain-Climber-(Cross-Body)-(female)_Waist.png",
            },
            {
              "name": "Triceps Dip",
              "imageUrl":
                  "https://cdn.exercisedb.dev/w/images/1e6EUNM/41n2hadQgEEX8wDN__Triceps-Dip_Upper-Arms.png",
            },
          ],
        },
      ],
    },
  ];
}
