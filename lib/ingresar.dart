import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Ingresar extends StatefulWidget {
  const Ingresar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IngresarState createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Iniciar sesión'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.black,
            Color.fromARGB(255, 255, 210, 210),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/logogirl.png'),
                      backgroundColor: Color.fromARGB(255, 255, 210, 210),
                    )),
                const SizedBox(
                  height: 80,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: 'Correo electrónico'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingrese correo';
                          }
                          if (!RegExp(
                                  r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                              .hasMatch(value)) {
                            return 'Por favor, ingresa un correo electrónico válido';
                          }
                          return null;
                        },
                        onSaved: (input) => _email = input!,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Contraseña'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingrese contraseña';
                          } else if (value.length < 8) {
                            return 'La contraseña debe tener al menos 8 caracteres';
                          }
                          return null;
                        },
                        onSaved: (input) => _password = input!,
                        obscureText: true,
                      ),
                      const SizedBox(height: 32),
                      OutlinedButton(
                        onPressed: signIn,
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/Home');
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';
        if (e.code == 'user-not-found') {
          errorMessage =
              'No se encontró un usuario con este correo electrónico.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Contraseña incorrecta.';
        } else {
          errorMessage =
              'Ocurrió un error al iniciar sesión. Por favor, inténtelo de nuevo más tarde.';
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 255, 210, 210).withOpacity(0.3),
              title: const Text('Error de inicio de sesión'),
              content: Text(errorMessage),
              actions: [
                OutlinedButton(
                  child: const Text('OK', style: TextStyle(
                    color: Colors.white
                  ),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }
}
