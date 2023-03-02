import 'package:flutter/material.dart';

//import 'package:girls_house_app/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:girls_house_app/ProfileDetailsScreen.dart';

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
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('profiles').snapshots(),
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
                                imageUrl: profile['imageUrl'])));
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: 
                    Image.network(
                      profile['imageUrl'],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
