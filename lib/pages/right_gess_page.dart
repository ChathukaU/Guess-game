import 'package:flutter/material.dart';
import 'home_page.dart';

class RightGessPage extends StatelessWidget {
  final int myNumber;
  const RightGessPage({Key? key, required this.myNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Congratulations! You've guessed it correctly\nMy secret number is",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Text(
              "$myNumber",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  //push replacement
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text(
                  "Start Again",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
