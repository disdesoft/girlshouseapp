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
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                width: 100,
                height: 100,
              ),
              const SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/seed/picsum/200/300'),
                    backgroundColor: Colors.red,
                  )),
              const SizedBox(
                width: 100,
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Home');
                },
                child: const Text('Google'),
              ),
              ElevatedButton(
                  onPressed: () {
                     Navigator.pushNamed(context, '/Home');
                  },
                  child: const Text('Facebook')),
                  ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/IngCorreo');
                },
                child: const Text('Correo electrónico'),
              ),
              const SizedBox(
                width: 100,
                height: 100,
              ),
              const Text('Todos los derechos reservados'),
              
            ],
          )),
        ),
      ),
    );
  }
}