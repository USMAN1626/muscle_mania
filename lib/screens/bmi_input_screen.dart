import 'package:fitness_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/workout_model.dart';
import 'BMICalculatorScreen.dart';
import 'home_screen.dart';

class BMIInputScreen extends StatefulWidget {
  @override
  _BMIInputScreenState createState() => _BMIInputScreenState();
}
class _BMIInputScreenState extends State<BMIInputScreen> {
  final _bmiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        title: Text('Body To Mass Index ', style: TextStyle(fontSize: 20, color: Colors.white , fontWeight: FontWeight.bold)),
    backgroundColor: Color.fromRGBO(3, 91, 109, 1.0),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(3, 91, 109, 1.0),
              Color.fromRGBO(0, 39, 47, 1.0),
              Color.fromRGBO(0, 9, 13, 1.0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "-- Plz Enter Your BMI --",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _bmiController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white), // Text color
                decoration: InputDecoration(
                  hintText: 'e.g., 22.5',
                  hintStyle: TextStyle(color: Colors.white), // Hint text color
                  filled: true,
                  fillColor: Color.fromRGBO(3, 91, 109, 1.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),

              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final bmi = double.tryParse(_bmiController.text);
                    if (bmi != null) {
                      Provider.of<WorkoutProvider>(context, listen: false).assignWorkouts(bmi);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a valid BMI value.')),
                      );
                    }
                  },
                  child: Text('Assign Workouts', style: TextStyle(fontSize: 18),),
                  style:   ElevatedButton.styleFrom(
                foregroundColor: Colors.teal.shade900, // Text color
                  backgroundColor: Colors.white, // Background color
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Don't know your BMI? Want to find out?",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BMICalculatorScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.teal.shade900, // Text color
                    backgroundColor: Colors.white, // Background color
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  child: Text('Go to BMI Calculator', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
