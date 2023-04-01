import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';

class ProductCards extends StatefulWidget {
  const ProductCards({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductCardsState createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  final List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    _getDataFromFirebase();
  }

  void _getDataFromFirebase() {
    FirebaseFirestore.instance
        .collection('productos')
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        _dataList.add(doc.data());
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Home()),
              (Route<dynamic> route) => false);
          return false;
        },
        child: Scaffold(
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  //lista de licores
                  const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Licores',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.transparent,
                          child: SizedBox(
                            height: 150,
                            width: 400,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _dataList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Container(
                                        color: Colors.white,
                                        margin: const EdgeInsets.all(10),
                                        child: Image.network(
                                          _dataList[index]['imageUrl'],
                                        )),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Lista 2
                  const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Licores',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.transparent,
                          child: SizedBox(
                            height: 150,
                            width: 400,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _dataList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Container(
                                        color: Colors.white,
                                        margin: const EdgeInsets.all(10),
                                        child: Image.network(
                                          _dataList[index]['imageUrl'],
                                        )),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Lista 2
                  const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Licores',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.transparent,
                          child: SizedBox(
                            height: 150,
                            width: 400,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _dataList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Container(
                                        color: Colors.white,
                                        margin: const EdgeInsets.all(10),
                                        child: Image.network(
                                          _dataList[index]['imageUrl'],
                                        )),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Lista 3
                  const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Licores',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.transparent,
                          child: SizedBox(
                            height: 150,
                            width: 400,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _dataList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Container(
                                        color: Colors.white,
                                        margin: const EdgeInsets.all(10),
                                        child: Image.network(
                                          _dataList[index]['imageUrl'],
                                        )),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
