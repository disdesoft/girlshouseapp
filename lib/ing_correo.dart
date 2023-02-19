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
      debugShowCheckedModeBanner: false,
      title: 'Ingresar con correo',
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
                width: 50,
                height: 50,
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
                
                height: 60,
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
                  'Ingresar',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/RecPass');
                },
                child: const Text(
                  "Olvide mi contraseña",
                  style: TextStyle(color: Color.fromARGB(255, 167, 185, 255)),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
