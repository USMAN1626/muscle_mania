import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/workout_model.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final completedWorkouts = Provider.of<WorkoutProvider>(context)
        .assignedWorkouts
        .where((workout) => workout.isCompleted)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile' , style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(3, 91, 109, 1.0),
      ),
      body: Container(
        width: 500,
        color: Color.fromRGBO(0, 39, 47, 1.0), // Background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/1.png'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name: Muhammad Usman',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Age: 22',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Fitness Goals: Build muscle, lose weight',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sweat, Sacrifice, Success',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Completed Workouts:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            completedWorkouts.isEmpty
                ? Text(
              'No workouts completed yet.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: completedWorkouts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      completedWorkouts[index].title,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      completedWorkouts[index].duration,
                      style: TextStyle(color: Colors.white70),
                    ),
                    tileColor: Color.fromRGBO(0, 9, 13, 1.0),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Color.fromRGBO(3, 91, 109, 1.0)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
