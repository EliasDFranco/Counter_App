import 'package:flutter/material.dart';

class PracticeOne extends StatelessWidget {
  const PracticeOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.0,
        height: 200.0,
        color: Colors.red,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5.0),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0),
              ),
            )),
      ),
    );
  }
}
