import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gess_game/pages/right_gess_page.dart';
import 'package:gess_game/pages/wrong_gess_page.dart';
import 'game_over_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myNumber = 0;
  int counter = 0;

  final mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess Game'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/guess.jpg',
                  height: 300,
                  width: 250,
                ),
                const Text(
                  "I have a secret number in my mind (1-10) \nYou have 3 chances to guess it. \n  Can you guess it?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30),
                Text(
                  "$counter of 3 chances are taken",
                  style: const TextStyle(fontSize: 20),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: mycontroller,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    counter++;
                    if (counter == 3) {
                      //Reset the Counter
                      //go to game over screen(pushreplacement)
                      counter = 0;
                      if (mycontroller.text.toString() == myNumber.toString()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RightGessPage(myNumber: myNumber)));
                      } else {
                        mycontroller.clear();
                        setState(() {});
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GameOverPage(myNumber: myNumber)));
                      }
                    } else {
                      //get input from user and convert it to int
                      //if input is equal to myNumber, go to right page(pushreplacement)
                      //if input is not equal to myNumber, go to wrong page(push )

                      if (mycontroller.text.toString() == myNumber.toString()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RightGessPage(myNumber: myNumber)));
                      } else {
                        //controller will clear
                        mycontroller.clear();
                        //*important
                        //setState keep the counter without resettings
                        setState(() {});
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WrongGessPage()));
                      }
                    }
                  },
                  child: const Text(
                    "Guess",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("I have a second number in my mind, can you guess it? (1-10)"),
          const TextField(),
          ElevatedButton(onPressed: () {
            //Increase the counter by 1
            counter++;

            if (counter > 3) {
              //reset the counter
              //Go to Game Over Page
            }

            //Get the input from the user and convert it to int

            //If myNumber == gessNumber
              //Go to Right Gess Page

            //If myNumber != gessNumber
              //Go to Wrong Gess Page

          }, child: const Text("Gess")),
        ],
      )
    );
  }*/

  @override
  void initState() {
    int randomNumber = Random().nextInt(10) + 1;
    myNumber = randomNumber;
    super.initState();
  }
}
