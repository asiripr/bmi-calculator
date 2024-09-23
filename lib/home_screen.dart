import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? selectedGender;
  double height = 100;
  double weight = 1;
  double bmiVal = 1;
  String comment = '';
  // double bmi = height.toDouble()/(weight.toDouble()*weight.toDouble());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true , title: const Text("BMI Calculator"),),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text("Height", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
              SizedBox(
                child: Slider(
                  value: height,
                  min: 100,
                  max: 240,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.truncateToDouble();
                    });
                  },
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Text(height.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    const Text("cm", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Weight", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
              SizedBox(
                child: Slider(
                  value: weight.toDouble(),
                  min: 1,
                  max: 100,
                  onChanged: (double newValue) {
                    setState(() {
                      weight = newValue.truncateToDouble();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Text(weight.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    const Text("kg", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Padding(
              padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Text("BMI value is", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(calculateBmi(weight, height).truncateToDouble().toStringAsFixed(2), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
              padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Text("You are in ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(bmiSuggestion(calculateBmi(weight, height)), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple)),
                    const Text(" range.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
  
  double calculateBmi(double weight, double height) {
    double newBmi = (10000*weight)/(height*height);
    return newBmi;
  }
  
  String bmiSuggestion(double calculateBmi) {
    if (calculateBmi<18.5) {
      return "Underweight";
    } 
    else if(calculateBmi>18.5 && calculateBmi<25){
      return "Normal";
    }
    else{
      return "Overweight";
    }
  }
}
