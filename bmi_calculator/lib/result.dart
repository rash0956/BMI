import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int height;
  final int weight;
  final String result;
  const Result(
      {super.key,
      required this.height,
      required this.weight,
      required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Bmi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Result",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 235, 233, 233),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  result,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 61, 160, 242),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
