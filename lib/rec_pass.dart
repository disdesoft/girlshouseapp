import 'package:flutter/material.dart';

void main() => runApp(const RecPass());

class RecPass extends StatefulWidget {
  const RecPass({super.key});

  @override
  State<RecPass> createState() => _RecPassState();
}

class _RecPassState extends State<RecPass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recuperar Contraseña',
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
                    height: 50,
                  ),
              const Text(
                    'Recuperar contraseña',
                    style: TextStyle(fontSize: 30),
                  ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'correo electronico',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/IngCorreo');
                },
                child: const Text('Enviar'),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
