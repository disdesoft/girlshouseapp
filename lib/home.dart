import 'package:flutter/material.dart';
import 'package:girls_house_app/catalogo.dart';


import 'package:girls_house_app/favoritas.dart';

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
  static const TextStyle optionStyle =
      TextStyle(
        fontSize: 20,
        fontWeight:
        FontWeight.bold,
        color: Colors.white,
        );
  static const List<Widget> _widgetOptions = <Widget>[
    Catalogo(),
    Favoritas(),
    Text(
      'Bar',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Girls House app', 
        style: TextStyle(color: Color.fromARGB(255, 255, 210, 210),
        fontSize: 16,
        ),),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
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
  }
}
