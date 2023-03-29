import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
   const BmiResultScreen({Key? key, required this.result, required this.checkMale, required this.age}) : super(key: key);
final int result;
final bool checkMale;
final double age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.teal,
      appBar: AppBar(backgroundColor:Colors.teal,
        centerTitle: true,
        elevation: 0,
        title: const Text('Result BMI Calculator'),
      ),
      body: Center(
        child: Column(mainAxisAlignment:MainAxisAlignment.center,
          children:  [
           Text(
              "Gender : ${checkMale ? 'Male' : 'Female'}",
              style:  const TextStyle(color:Colors.black,fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:15,),
            Text(
              "Result : $result",
              style:  const TextStyle(color:Colors.black,fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:15,),
            Text(
              "Age : $age",
              style:  const TextStyle(color:Colors.black,fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
