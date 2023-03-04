import 'package:flutter/material.dart';

//import 'package:girls_house_app/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:girlshouse/ProfileDetailsScreen.dart';

void main() => runApp(const Catalogo());

class Catalogo extends StatefulWidget {
  const Catalogo({super.key});

  @override
  State<Catalogo> createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
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
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('profiles').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final profiles = snapshot.data!.docs;
              return GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  final profile = profiles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileDetailsScreen(
                            name: profile['name'],
                            phone: profile['phone'],
                            description: profile['description'],
                            imageUrl: profile['imageUrl'],
                            price: profile['price'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Stack(
                          alignment: Alignment.bottomRight,
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              profile['imageUrl'],
                              fit: BoxFit.cover,
                            ),
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 60),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: Text(profile['name']),
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Color.fromARGB(255, 255, 210, 210),
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
