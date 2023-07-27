import 'package:flutter/material.dart';
import 'home_page.dart';

class WrongGessPage extends StatelessWidget {
  const WrongGessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess Game'),
      ),
      body: Container(
        color: Colors.red.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sorry! Wrong guess.Try again!",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  //button color
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade700,
                  ),
                  onPressed: () {
                    //go back to home page
                    //find the code to go back
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: const Text(
                    "Try Again",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
