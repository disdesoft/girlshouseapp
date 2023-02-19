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
      "https://media.licdn.com/dms/image/C5603AQEdgNbuwGKaQQ/profile-displayphoto-shrink_800_800/0/1662670523071?e=2147483647&v=beta&t=k3bU93M4I_IWdTL9Z3tuzQgQUQr_P-nhQVEXR0rVkBk";
  
  List<String> imagePost = [
    'https://picsum.photos/333',
    'https://picsum.photos/332',
    'https://picsum.photos/331',
    'https://picsum.photos/330',
    'https://picsum.photos/329',
    'https://picsum.photos/328',
    'https://picsum.photos/367',
    'https://picsum.photos/366',
    'https://picsum.photos/365',
    'https://picsum.photos/364',
    'https://picsum.photos/363',
    'https://picsum.photos/362',
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
                radius: 56,
                backgroundImage: NetworkImage(imageProfile),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Karol Cruz',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
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
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '8',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Seguidores',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '275k',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Seguidos',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '100',
                        style: TextStyle(
                          fontSize: 14,
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
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Seguir',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shadowColor: Colors.white,
                    ),
                    child: const Text('Mensaje'),
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
                                image: NetworkImage(imagePost[index]))),
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
