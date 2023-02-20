import 'package:flutter/material.dart';

void main() => runApp(const Ingresar());

class Ingresar extends StatefulWidget {
  const Ingresar({super.key});

  @override
  State<Ingresar> createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ingresar',
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const Center(
                child: Text(
                'Girls House app',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ),
              const SizedBox(
                width: 70,
                height: 70,
              ),
              //avatar
              const SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/logogirl.png'),
                    backgroundColor: Color.fromARGB(255, 255, 210, 210),
                  )),
              const SizedBox(
                height: 120,
              ),
              //Goole Button
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Home');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white.withOpacity(0.5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Google',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              //Facebook Button
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Home');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white.withOpacity(0.5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Facebook',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              //correo Button
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/IngCorreo');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white.withOpacity(0.5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'e-mail',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              
            ],
          )),
        ),
      ),
    );
  }
}