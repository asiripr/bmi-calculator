import 'package:flutter/material.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? selectedGender;
  int height = 0;
  int weight = 1;
  // double bmi = height.toDouble()/(weight.toDouble()*weight.toDouble());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Expanded(
        child: Column(
          children: [
            const Text("Height", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
            SizedBox(
              child: Slider(
                value: height.toDouble(),
                min: 0,
                max: 240,
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue.round();
                  });
                },
              ),
            ),

            Row(
              children: [
                Text(height.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                const Text("cm", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20,),
            const Text("Weight", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
            SizedBox(
              child: Slider(
                value: weight.toDouble(),
                min: 0,
                max: 100,
                onChanged: (double newValue) {
                  setState(() {
                    weight = newValue.round();
                  });
                },
              ),
            ),

            Row(
              children: [
                Text(weight.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                const Text("kg", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
