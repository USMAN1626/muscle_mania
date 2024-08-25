import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/workout_model.dart';
import 'bmi_input_screen.dart';
import 'workout_detail_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(3, 91, 109, 1.0),
        title: Text('Muscle Mania' ,style: TextStyle(color: Colors.white , ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BMIInputScreen()),
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
      body: Container(
        color: Color.fromRGBO(3, 91, 109, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<WorkoutProvider>(
            builder: (context, provider, child) {
              return ListView.builder(
                itemCount: provider.assignedWorkouts.length,
                itemBuilder: (context, index) {
                  return _buildWorkoutCard(context, provider.assignedWorkouts[index], index);
                },
              );
            },
          ),
        ),
      ),
    );
  }
  Widget _buildWorkoutCard(BuildContext context, Workout workout, int index) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Color.fromRGBO(0, 39, 47, 1.0),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(3, 91, 109, 1.0),
              Color.fromRGBO(0, 39, 47, 1.0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(12),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              workout.image,
              width: 80,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            workout.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            workout.duration,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          trailing: Icon(
            workout.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: workout.isCompleted ? Colors.greenAccent : Colors.white70,
            size: 30,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkoutDetailScreen(workout: workout, index: index),
              ),
            );
          },
        ),
      ),
    );
  }
}

