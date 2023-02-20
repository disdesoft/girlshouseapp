//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerfilServidora());

class PerfilServidora extends StatefulWidget {
  const PerfilServidora({super.key});

  @override
  State<PerfilServidora> createState() => _PerfilServidoraState();
}

class _PerfilServidoraState extends State<PerfilServidora> {
  final imageProfile =
      "assets/girls/bar.jpeg";
  
  List<String> imagePost = [
    'assets/girls/bar1.jpeg',
    'assets/girls/bar2.jpeg',
    'assets/girls/bar3.jpeg',
    'assets/girls/bar4.jpeg',
    'assets/girls/bar.jpeg',
    'assets/girls/bar6.jpeg',
    'assets/girls/bar7.jpeg',
    'assets/girls/bar8.jpeg',
    'assets/girls/bar9.jpeg',
    'assets/girls/bar10.jpeg',
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
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imageProfile),
                backgroundColor: const Color.fromARGB(255, 255, 210, 210),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Karol Cruz',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Publicaciones',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '8',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
                  Divider(
                    color: Colors.white,
                    thickness: 60,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Seguidores',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '275k',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
                  Divider(
                    color: Colors.white,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Seguidos',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '100',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shadowColor: Colors.white,
                    ),
                    child: const Icon(Icons.favorite, color: Color.fromARGB(255, 255, 210, 210),)
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shadowColor: Colors.white,
                    ),
                    child: const Icon(Icons.phone, color: Color.fromARGB(255, 255, 210, 210),),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Divider(
                  height: 10,
                  thickness: 0.8,
                  //color: Colors.white,
                ),
              ),
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
