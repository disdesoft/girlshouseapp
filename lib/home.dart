import 'package:flutter/material.dart';
import 'package:girlshouse/bar.dart';
import 'package:girlshouse/catalogo.dart';
import 'package:girlshouse/favoritas.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({super.key});

  static const String _title = 'GHapp';

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
    ProductCards(),
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

  final int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          //boton tiktok
          GestureDetector(
              onTap: () {
                // ignore: deprecated_member_use
                launch("https://tiktok.com/@fabianvalerocm");
              },
              child: const Icon(Icons.tiktok_outlined)),
          const SizedBox(
            width: 10,
          ),
          //boton llamar
          GestureDetector(
              onTap: () {
                // ignore: deprecated_member_use
                launch("tel:3102503532");
              },
              child: const Icon(Icons.local_phone)),
          const SizedBox(
            width: 20,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Girls House app',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: Stack(children: [
        Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ]),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              accountName: Text('Fabian Valero'),
              accountEmail: Text('disdesoft@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://fabianvalero.000webhostapp.com/images/avatar.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                'Inicio',
                style: TextStyle(color: Colors.white),
              ),
              selected: _currentIndex == 0,
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: const Text(
                'Favoritas',
                style: TextStyle(color: Colors.white),
              ),
              selected: _currentIndex == 1,
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              title: const Text(
                'Bar',
                style: TextStyle(color: Colors.white),
              ),
              selected: _currentIndex == 2,
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Ajustes',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    // ignore: prefer_const_constructors
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
          ],
        ),
      ),
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

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Ajustes',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
        body: const Center(
          child: Text(
            'Ajustes de cuenta',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
