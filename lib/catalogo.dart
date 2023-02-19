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
    'https://picsum.photos/434',
    'https://picsum.photos/435',
    'https://picsum.photos/436',
    'https://picsum.photos/437',
    'https://picsum.photos/438',
    'https://picsum.photos/439',
    'https://picsum.photos/440',
    'https://picsum.photos/441',
    'https://picsum.photos/442',
    'https://picsum.photos/443',
    'https://picsum.photos/444',
    'https://picsum.photos/445',
    'https://picsum.photos/534',
    'https://picsum.photos/535',
    'https://picsum.photos/536',
    'https://picsum.photos/537',
    'https://picsum.photos/538',
    'https://picsum.photos/539',
    'https://picsum.photos/540',
    'https://picsum.photos/541',
    'https://picsum.photos/542',
    'https://picsum.photos/543',
    'https://picsum.photos/544',
    'https://picsum.photos/545',
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
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: imagePost.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                                image: NetworkImage(imagePost[index]))),
                      );
                    }),
              ))
            ],
          ),
        ),
      ),);
  }
}