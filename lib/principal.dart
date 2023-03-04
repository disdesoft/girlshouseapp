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
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text('Girls House app',
          style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Color.fromARGB(255, 255, 210, 210),],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          )),
          child: SingleChildScrollView(
            child: Center(
                child: Column(
              children: [
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
                  height: 100,
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
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Registrarse');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white.withOpacity(0.5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
        
                const SizedBox(
                  height: 200,
                ),
                const Text('Todos los derechos reservados'),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Home');
                  },
                  child: const Text("Fabian Valero", style: TextStyle(
                    fontSize: 8,
                  ),),
                ),
                const SizedBox(
                  height: 150,
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
