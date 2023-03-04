import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _claveFormulario = GlobalKey<FormState>();

  Future<void> _registerWithEmail() async {
    if (!_claveFormulario.currentState!.validate()) {
      return;
    }

    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final User? user = userCredential.user;

      if (user != null) {
        // Redirige al usuario a la vista Home después de la autenticación
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/Home');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('La contraseña es demasiado débil.');
      } else if (e.code == 'email-already-in-use') {
        print('Ya existe una cuenta con este correo electrónico.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _registerWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // Redirige al usuario a la vista Home después de la autenticación
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/Home');
      }
      if (user == null) {
        const AlertDialog(
          title: Text('Error de autenticación'),
          content: Text(
              'El usuario o  la contraseña no coinciden, o el usuario no existe'),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Ingresar'),
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
                  key: _claveFormulario,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          // pendiente revisar la validación
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
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Correo electrónico',
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          // pendiente revisar la validación
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Por favor ingrese contraseña';
                            } else if (value.length < 8) {
                              return 'La contraseña debe tener al menos 8 caracteres';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Contraseña',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),
                OutlinedButton(
                  onPressed: _registerWithEmail,
                  child: const Text(
                    'Registrarse con correo electrónico',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 200),
                // OutlinedButton(onPressed: (){
                //   Navigator.pushReplacementNamed(context, '/Home');
                // }, child: const Text('Entrar como invitado', style: TextStyle(
                //   color: Colors.white,
                // ),),)
                // ElevatedButton(
                //   onPressed: _registerWithGoogle,
                //   child: const Text('Registrarse con Google'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
