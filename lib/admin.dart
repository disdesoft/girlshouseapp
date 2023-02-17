import 'package:flutter/material.dart';

void main() => runApp(const Admin());

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ingresar',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
        ),
        body: const Center(
          child: Text('Admin'),
        ),
      ),
    );
  }
}
