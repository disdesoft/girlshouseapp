import 'package:flutter/material.dart';
//import 'package:girls_house_app/services/firebase_service.dart';

void main() => runApp(const Catalogo());

class Catalogo extends StatefulWidget {
  const Catalogo({super.key});

  @override
  State<Catalogo> createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  List<String> imagePost = [
    'assets/girls/muj1.jpg',
    'assets/girls/muj2.jpg',
    'assets/girls/muj3.jpeg',
    'assets/girls/muj4.jpg',
    'assets/girls/muj5.jpg',
    'assets/girls/muj6.jpg',
    'assets/girls/muj7.jpg',
    'assets/girls/muj8.jpg',
    'assets/girls/muj9.jpg',
    'assets/girls/muj10.jpg',
    'assets/girls/muj11.jpg',
    'assets/girls/muj12.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Center(
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: imagePost.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                                image: AssetImage(imagePost[index]),
                                fit: BoxFit.cover,
                                ),
                                ),
                      );
                    }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
