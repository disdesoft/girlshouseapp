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
                        'https://picsum.photos/333'),
                    backgroundColor: Colors.red,
                  )),
              const SizedBox(
                width: 100,
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Ingresar');
                },
                child: const Text('Ingresar'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Registrarse');
                  },
                  child: const Text('Registrarse')),
              const SizedBox(
                width: 100,
                height: 100,
              ),
              const Text('Todos los derechos reservados'),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Admin');
                },
                child: const Text("Admin"),
              )
            ],
          )),
        ),
      ),
    );
  }
}
