import 'package:flutter/material.dart';
import '../main.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  var weightcontroller = TextEditingController();
  var feetcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.transparent, // Make AppBar background transparent
        elevation: 0, // Remove AppBar shadow
      ),
      extendBodyBehindAppBar: true, // Extend body behind the AppBar for full gradient
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 100), // Space for AppBar and give room for content
                  ClipOval(
                      child: Image.asset('assets/images/abc.png', width: 250, height: 250)),
                  SizedBox(height: 50),
                  TextField(
                    controller: weightcontroller,
                    decoration: InputDecoration(
                        label: Text("Enter your weight in kg", style: TextStyle(fontSize: 20, color: Colors.white)),
                        prefixIcon: Icon(Icons.line_weight, color: Colors.white)),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: feetcontroller,
                    decoration: InputDecoration(
                        label: Text("Enter your height in feet", style: TextStyle(fontSize: 20, color: Colors.white)),
                        prefixIcon: Icon(Icons.height, color: Colors.white)),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: inchcontroller,
                    decoration: InputDecoration(
                        label: Text("Enter your height in inches", style: TextStyle(fontSize: 20, color: Colors.white)),
                        prefixIcon: Icon(Icons.height, color: Colors.white)),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        var weight = weightcontroller.text;
                        var feet = feetcontroller.text;
                        var inches = inchcontroller.text;

                        if (weight.isNotEmpty && feet.isNotEmpty && inches.isNotEmpty) {
                          // BMI CALCULATION
                          var intweight = int.parse(weight);
                          var intfeet = int.parse(feet);
                          var intinches = int.parse(inches);

                          var totalinches = (intfeet * 12) + intinches;
                          var totalcm = totalinches * 2.54;
                          var totalmeters = totalcm / 100;
                          var bmi = intweight / (totalmeters * totalmeters);

                          var msg;
                          if (bmi > 25) {
                            msg = "You are overweight";
                            bgcolor = Colors.orange.shade300;
                          } else if (bmi < 18) {
                            msg = "You are underweight";
                            bgcolor = Colors.red.shade300;
                          } else {
                            msg = "You are healthy";
                            bgcolor = Colors.green.shade300;
                          }

                          setState(() {
                            result = "$msg\nYour BMI is ${bmi.toStringAsFixed(3)}";
                          });
                        } else {
                          setState(() {
                            result = 'Please fill all the required fields';
                          });
                        }
                      },
                      child: Text('Calculate', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: 26),
                  Text(
                    result,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
