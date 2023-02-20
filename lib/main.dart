import 'package:flutter/material.dart';
import 'package:girls_house_app/admin.dart';
import 'package:girls_house_app/favoritas.dart';
import 'package:girls_house_app/home.dart';
import 'package:girls_house_app/ing_correo.dart';
import 'package:girls_house_app/ingresar.dart';
import 'package:girls_house_app/perfil_servidora.dart';
import 'package:girls_house_app/principal.dart';
import 'package:girls_house_app/rec_pass.dart';
import 'package:girls_house_app/registrarse.dart';

//importaciones firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Principal(),
        '/Ingresar': (context) => const Ingresar(),
        '/Registrarse': (context) => const Registrarse(),
        '/Admin': (context) => const Admin(),
        '/IngCorreo': (context) => const IngEmail(),
        '/Home': (context) => const Home(),
        '/RecPass': (context) => const RecPass(),
        '/PerfilServidora': (context) => const PerfilServidora(),
        '/Favoritas': (context) => const Favoritas(),
      },
    );
  }
}
