import 'package:flutter/material.dart';
import 'package:girlshouse/admin.dart';
import 'package:girlshouse/favoritas.dart';
import 'package:girlshouse/home.dart';
import 'package:girlshouse/ingresar.dart';
import 'package:girlshouse/principal.dart';
import 'package:girlshouse/rec_pass.dart';
import 'package:flutter/services.dart';

//importaciones firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:girlshouse/reg.dart';
import 'firebase_options.dart';

void main() async {
//inicializamos firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//evita que la aplicacion gire
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(const MyApp());
  });
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
        '/Registrarse': (context) => const RegisterPage(),
        '/Admin': (context) => const Admin(),
        '/Home': (context) => const Home(),
        '/RecPass': (context) => const RecPass(),
        '/Favoritas': (context) => const Favoritas(),
      },
    );
  }
}
