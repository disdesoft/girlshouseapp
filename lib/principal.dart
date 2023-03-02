import 'package:flutter/material.dart';

void main() => runApp(const Principal());

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
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
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Ingresar');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white.withOpacity(0.5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Ingresar',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(
                height: 140,
              ),
              const Text('Todos los derechos reservados'),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Admin');
                },
                child: const Text("Admin"),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
