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
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Recuperar Contraseña',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const Text(
                    'Recuperar contraseña',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
              const SizedBox(
                width: 100,
                height: 100,
              ),
              const SizedBox(
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/seed/picsum/200/300'),
                    backgroundColor: Colors.red,
                  )),
                  const SizedBox(
                    height: 50,
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
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        iconColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
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
                  'Enviar',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
