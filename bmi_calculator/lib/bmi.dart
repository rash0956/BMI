import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'result.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int height = 100;
  int weight = 50;
  late String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Bmi calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              color: Color.fromARGB(255, 27, 28, 29),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Height",
                    style: TextStyle(
                        color: Color.fromARGB(255, 253, 246, 246),
                        fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "cm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    min: 70,
                    max: 230,
                    value: height.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ],
              ),
            )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(255, 27, 28, 29),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 27, 28, 29),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Waight",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: Icon(Icons.add)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            )),
            MaterialButton(
              height: 60,
              color: Color.fromARGB(255, 31, 32, 33),
              minWidth: double.infinity,
              onPressed: () {
                double bmi = weight / pow(height / 100, 2);
                if (bmi.round() < 16) {
                  result = "Severely undernourishment";
                } else if (bmi.round() > 16 && bmi.round() < 16.9) {
                  result = "Medium undernourishment";
                } else if (bmi.round() > 17 && bmi.round() < 18.4) {
                  result = "Slight undernourishment";
                } else if (bmi.round() > 18 && bmi.round() < 24.9) {
                  result = "Normal naturition state";
                } else if (bmi.round() > 25 && bmi.round() < 29.9) {
                  result = "Overweight";
                } else if (bmi.round() > 30 && bmi.round() < 39.9) {
                  result = "Obesity";
                } else {
                  result = "pathological obesity";
                }

                Get.to(() => Result(
                      height: height,
                      weight: weight,
                      result: result,
                    ));
              },
              textColor: Colors.white,
              child: const Text("calculate"),
            )
          ],
        ),
      ),
    );
  }
}
