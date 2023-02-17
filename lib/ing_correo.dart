import 'package:flutter/material.dart';

void main() => runApp(const IngEmail());

class IngEmail extends StatefulWidget {
  const IngEmail({super.key});

  @override
  State<IngEmail> createState() => _IngEmailState();
}

class _IngEmailState extends State<IngEmail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ingresar con correo',
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
                width: 70,
                height: 70,
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
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'contraseña',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Home');
                },
                child: const Text('Ingresar'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/RecPass');
                },
                child: const Text(
                  "Olvide mi contraseña",
                  style: TextStyle(color: Color.fromARGB(255, 6, 27, 255)),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
