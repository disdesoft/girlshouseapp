import 'package:flutter/material.dart';

void main() => runApp(const Bar());

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Color.fromARGB(255, 255, 210, 210),],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          )),
            child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Center(
                child: Text('Bar', style: TextStyle(
                  color: Colors.white,
                ),),
              ))
            ],
          ),
          ),
      ),
    );
  }
}