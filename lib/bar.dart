import 'package:flutter/material.dart';
import 'package:girlshouse/productCards.dart';

import 'home.dart';

void main() => runApp(const Bar());

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/girlshouseapp.appspot.com/o/productos%2Fbotamarillo.jpg?alt=media&token=eea25e69-4aaa-4d38-b358-84db5c0077e8",
    "https://firebasestorage.googleapis.com/v0/b/girlshouseapp.appspot.com/o/productos%2Fbotantioqazul.jpg?alt=media&token=8cbbbdbb-426b-4015-83db-21274573a4fc",
    "https://firebasestorage.googleapis.com/v0/b/girlshouseapp.appspot.com/o/productos%2Fmedia-aguardiente-azul.png?alt=media&token=c4b63141-86db-49c6-bd0d-5a5f7d6abd3c",
  ];

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
          backgroundColor: Colors.black,
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
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ProductCards(),
                    ProductCards(),
                    ProductCards(),
                    ProductCards(),
                    ProductCards(),
                    ProductCards(),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                    controller: PageController(),
                    itemCount: images.length,
                    pageSnapping: true,
                    itemBuilder: (context, pagePosition) {
                      return SizedBox(
                        height: 10,
                        //margin: const EdgeInsets.all(80),
                        child: Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 2,
                          ),
                          semanticContainer: true,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 150,
                                width: 150,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 2,
                                ),
                                child: Card(
                                  elevation: 0,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                    vertical: 2,
                                  ),
                                  child: Image.network(
                                    images[pagePosition],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Text('prueba traer de firebase'),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Image.network('https://10619-2.s.cdn12.com/rests/original/319_401894795.jpg')),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                child: const Column(
                                  children: [
                                    Icon(Icons.gps_fixed, color: Colors.white,
                                    size: 20,),
                                    Text('ir', style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white),)
                                  ],
                                ),
                              )
                            ),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                child: const Column(
                                  children: [
                                    Icon(Icons.phone_android, color: Colors.white,
                                    size: 20,),
                                    Text('llamar', style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white),)
                                  ],
                                ),
                              )
                            ),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                child: const Column(
                                  children: [
                                    Icon(Icons.gps_fixed, color: Colors.white,
                                    size: 20,),
                                    Text('redes', style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white),)
                                  ],
                                ),
                              )
                            ),
                          ],
                        ),),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
