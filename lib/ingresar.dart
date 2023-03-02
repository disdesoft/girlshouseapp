import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Ingresar extends StatefulWidget {
  @override
  _IngresarState createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isLoading = false;

  Future<UserCredential?> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        return userCredential;
      }
    } catch (e) {
      print('Error al autenticar con Google: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ingresar'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Center(
            child: _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      UserCredential? userCredential = await _signInWithGoogle();
                      if (userCredential != null) {
                        // El usuario ha iniciado sesión correctamente
                      }
                    },
                    child: const Text('Iniciar sesión con Google'),
                  ),
          ),
          OutlinedButton(onPressed: (){
            Navigator.pushNamed(context, '/Home');
          }, child: const Text('Ingresar como invitado', style: TextStyle(color: Colors.white),) )
        ],
      ),
    );
  }
}
