import 'package:flutter/material.dart';
import "dart:math";

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Center(child: Text("Dicee")),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int imageNum = 1;
  String imageUrl = "images/dice1.png";

  int imageNum2 = 1;
  String imageUrl2 = "images/dice1.png";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    int result = Random().nextInt(6) + 1;
                    while(result == imageNum) {
                      result = Random().nextInt(6) + 1;
                    }
                    setState(
                      () {
                        imageNum = result;
                      },
                    );
                  },
                  child: Image.asset("images/dice${imageNum.toString()}.png"),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      imageNum2 = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset("images/dice${imageNum2.toString()}.png"),
                ),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                setState(() {
                  imageNum = Random().nextInt(6) + 1;
                  imageNum2 = Random().nextInt(6) + 1;
                });
              },
              child: const Text(
                "Throw both dices!",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
