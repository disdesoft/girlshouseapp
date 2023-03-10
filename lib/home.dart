import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:girlshouse/bar.dart';
import 'package:girlshouse/catalogo.dart';
import 'package:girlshouse/favoritas.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Home._title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  bool showWillPopScope = true;

  static const List<Widget> _widgetOptions = <Widget>[
    Catalogo(),
    Favoritas(),
    Bar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    showWillPopScope = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //REVISAR
    // return WillPopScope(
    //   onWillPop: () async {
    //     return (await showDialog(
    //           context: context,
    //           builder: (context) => AlertDialog(
    //             backgroundColor:
    //                 const Color.fromARGB(255, 255, 210, 210).withOpacity(0.7),
    //             title: const Text(
    //               '¿Salir de la aplicación?',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //             content: const Text(
    //               '¿Estás seguro de que quieres salir de la aplicación?',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //             actions: <Widget>[
    //               OutlinedButton(
    //                 onPressed: () => Navigator.of(context).pop(false),
    //                 child: const Text(
    //                   'No',
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //               ),
    //               OutlinedButton(
    //                 onPressed: () => SystemNavigator.pop(),
    //                 child: const Text(
    //                   'Sí',
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         )) ??
    //         false;
    //   },
    // child:
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Girls House app',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 210, 210),
            fontSize: 16,
          ),
        ),
      ),
      body: Stack(children: [
        Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        unselectedItemColor: Colors.grey[800],
        iconSize: 16,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.girl),
            label: 'Favoritas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Bar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
    //   );
  }
}
