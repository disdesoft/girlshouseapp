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
      debugShowCheckedModeBanner: false,
      title: 'Ingresar',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: const Center(
          child: Text(
            'Admin',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
