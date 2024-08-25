import 'package:fitness_app/screens/home_screen.dart';
import 'package:fitness_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/workout_model.dart';
import 'bmi_input_screen.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final Workout workout;
  final int index;

  WorkoutDetailScreen({required this.workout, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(3, 91, 109, 1.0),
        title: Text(
          'Muscle Mania',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.person , color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body:
      Container(
        width: double.infinity,
        color: Color.fromRGBO(3, 91, 109, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  workout.image,
                  height: 500,
                  width: 500,
                  fit: BoxFit.cover, // Ensures the image covers the space nicely
                ),
              ),
              SizedBox(height: 20),
              Text(
                workout.title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text color
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Duration: ${workout.duration}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // White text color
                ),
              ),
              SizedBox(height: 20),
              Text(
                workout.description,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // White text color
                ),
              ),
              SizedBox(height: 14),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Toggling the workout completion status
                    Provider.of<WorkoutProvider>(context, listen: false).toggleWorkoutCompletion(index);

                    // Showing a SnackBar with the appropriate message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          workout.isCompleted ? 'Workout marked as completed!' : 'Workout completed!',
                        ),
                      ),
                    );

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromRGBO(3, 91, 109, 1.0),
                    backgroundColor: Colors.white, // Text color
                  ),
                  child: Text(
                    workout.isCompleted ? 'Mark as Incomplete' : 'Mark as Completed',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
