import 'package:flutter/material.dart';

void main() => runApp(const Registrarse());

class Registrarse extends StatefulWidget {
  const Registrarse({super.key});

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registrarse',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Registrarse'),
        ),
        body: const Center(
          child: Text(
            'Registrarse',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
