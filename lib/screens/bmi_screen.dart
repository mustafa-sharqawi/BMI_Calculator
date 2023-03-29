import 'dart:math';

import 'package:bmi_calculotor/screens/bmi_results.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool checkMale = true;
  double heightSlider = 120.0;
  double age = 20;

  double weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
        title: const Text('BMI Screen'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        checkMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: checkMale ? Colors.white : Colors.grey[400]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/male-symbol.png',
                            height: 90,
                            width: 90,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Male',
                            style: (TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        checkMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: checkMale ? Colors.grey[400] : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/female.png',
                            height: 90,
                            width: 90,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Female',
                            style: (TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style:
                        (TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${heightSlider.round()}',
                        style: (const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w900)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'CM',
                        style: (TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  Slider(
                      thumbColor: Colors.teal,
                      inactiveColor: Colors.white,
                      secondaryActiveColor: Colors.teal,
                      activeColor: Colors.teal,
                      value: heightSlider,
                      max: 220,
                      min: 80,
                      onChanged: (value) {
                        setState(() {
                          heightSlider = value;
                        });
                      })
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: (TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          '${age.round()}',
                          style: (const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Colors.teal,
                              mini: true,
                              heroTag: 'minus age',
                              child: const Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Colors.teal,
                              mini: true,
                              heroTag: 'plus age',
                              child: const Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: (TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          '${weight.round()}',
                          style: (const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Colors.teal,
                              mini: true,
                              heroTag: 'minus weight',
                              child: const Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Colors.teal,
                              mini: true,
                              heroTag: 'plus weight',
                              child: const Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: MaterialButton(
              onPressed: () {
                var result = weight / pow(heightSlider / 100, 2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BmiResultScreen(
                              checkMale: checkMale,
                              age: age,
                              result: result.round(),
                            )));
              },
              height: 50,
              child: const Text(
                'Calculator',
                style:
                (TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
