import 'package:flutter/material.dart';
import 'package:girlshouse/ingresar.dart';
import 'package:girlshouse/reg.dart';

void main() => runApp(const Principal());

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.dark(),
      home: WillPopScope(
        onWillPop: () async {
          return (await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor:
                      const Color.fromARGB(255, 255, 210, 210).withOpacity(0.3),
                  title: const Text('¿Salir de la aplicación?'),
                  content: const Text(
                      '¿Estás seguro de que quieres salir de la aplicación?'),
                  actions: <Widget>[
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text(
                        'Sí',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )) ??
              false;
        },

//onPressed: () => Navigator.of(context).pop(true),

        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const Text(
              'Girls House app',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: NetworkImage(
                //     'https://firebasestorage.googleapis.com/v0/b/girlshouseapp.appspot.com/o/girl8%2Fgirl8%20(4).jpeg?alt=media&token=4ab51878-0e3f-4900-8243-1989f891f97e'),
                //     fit: BoxFit.cover,
                //     ),
                gradient: LinearGradient(
              colors: [
                Colors.black,
                Color.fromARGB(255, 255, 210, 210),
              ],
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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Ingresar(),
                      ));
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.white.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ));
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.white.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 100,
                  ),
                  const Text('Todos los derechos reservados'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/Home');
                    },
                    child: const Text(
                      "Fabian Valero",
                      style: TextStyle(
                        fontSize: 8,
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
        ),
      ),
    );
  }
}
