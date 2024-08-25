import 'package:flutter/foundation.dart';

class Workout {
  final String title;
  final String description;
  final String image;
  final String duration;
  bool isCompleted;

  Workout({
    required this.title,
    required this.description,
    required this.image,
    required this.duration,
    this.isCompleted = false,
  });
}

class WorkoutProvider with ChangeNotifier {
  List<Workout> _underweightWorkouts = [
    Workout(
      title: 'Strength Training',
      description: 'A workout focused on building muscle mass.',
      image: 'assets/images/22.png',
      duration: '45 mins',
    ),
    Workout(
      title: 'High-Calorie Yoga',
      description: 'Yoga exercises to help with weight gain.',
      image: 'assets/images/aa.jpg',
      duration: '30 mins',
    ),
  ];

  List<Workout> _healthyWorkouts = [
    Workout(
      title: 'Full Body Workout',
      description: 'A balanced workout targeting all muscle groups.',
      image: 'assets/images/fb.jpg',
      duration: '30 mins',
    ),
    Workout(
      title: 'Inclined Dumbell Curl',
      description: 'A mix of cardio and strength exercises.',
      image: 'assets/images/dumbell.png',
      duration: '40 mins',
    ),
  ];

  List<Workout> _overweightWorkouts = [
    Workout(
      title: 'Cardio Blast',
      description: 'A high-intensity cardio workout for weight loss.',
      image: 'assets/images/cardio.jpg',
      duration: '30 mins',
    ),
    Workout(
      title: 'Squats ',
      description: 'Yoga exercises focused on flexibility and belly fat  loss.',
      image: 'assets/images/squats.jpeg',
      duration: '45 mins',
    ),
  ];

  List<Workout> _assignedWorkouts = [];

  List<Workout> get assignedWorkouts => _assignedWorkouts;

  void assignWorkouts(double bmi) {
    if (bmi < 18.5) {
      _assignedWorkouts = _underweightWorkouts;
    } else if (bmi >= 18.5 && bmi < 25.0) {
      _assignedWorkouts = _healthyWorkouts;
    } else {
      _assignedWorkouts = _overweightWorkouts;
    }
    notifyListeners();
  }

  void toggleWorkoutCompletion(int index) {
    _assignedWorkouts[index].isCompleted = !_assignedWorkouts[index].isCompleted;
    notifyListeners();
  }
}
