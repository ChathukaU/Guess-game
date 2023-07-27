import 'package:flutter/material.dart';
import 'home_page.dart';

class GameOverPage extends StatelessWidget {
  final int myNumber;
  const GameOverPage({Key? key, required this.myNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess Game'),
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sorry! Game Over !!!",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              const Text(
                "My secret number is : ",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 10),
              Text(
                "$myNumber ",
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  //button color
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    //go to home page(push replacement)
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: const Text(
                    "Start the Game Again",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
