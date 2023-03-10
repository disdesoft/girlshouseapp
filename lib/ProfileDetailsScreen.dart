import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final String phone;
  final String price;
  final String foto1;
  final String foto2;
  final String foto3;
  final String foto4;
  final String foto5;
  final String foto6;
  final String foto7;
  final String foto8;
  final String foto9;
  final String foto10;

  const ProfileDetailsScreen({
    Key? key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.phone,
    required this.price,
    required this.foto1,
    required this.foto2,
    required this.foto3,
    required this.foto4,
    required this.foto5,
    required this.foto6,
    required this.foto7,
    required this.foto8,
    required this.foto9,
    required this.foto10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> fotos = [
      foto1,
      foto2,
      foto3,
      foto4,
      foto5,
      foto6,
      foto7,
      foto8,
      foto9,
      foto10,
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Color.fromARGB(255, 255, 210, 210),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => FullScreenImage(imageUrl: imageUrl),
                          ));
                        },
                        child: CircleAvatar(
                          radius: 51,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(imageUrl),
                            backgroundColor:
                                const Color.fromARGB(255, 255, 210, 210),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 210, 210),
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              const Text(
                                'Servicio',
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '\$$price',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 20,
                            child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  shadowColor: Colors.white,
                                  side: const BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 255, 210, 210)),
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Color.fromARGB(255, 255, 210, 210),
                                  size: 12,
                                )),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 20,
                            width: 60,
                            child: OutlinedButton(
                              onPressed: () {
                                // ignore: deprecated_member_use
                                launch("https://wa.link/pzpw5r");
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                shadowColor: Colors.white,
                                side: const BorderSide(
                                    width: 1, color: Colors.green),
                              ),
                              child: const Icon(
                                Icons.message_outlined,
                                color: Colors.green,
                                size: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Divider(
                          height: 5,
                          thickness: 0.6,
                          //color: Colors.white,
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('profiles')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            // final profiles = snapshot.data!.docs;
                            return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: fotos.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (_) => FullScreenImage(
                                            imageUrl: fotos[index]),
                                      ));
                                    },
                                    child: Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 2),
                                      semanticContainer: true,
                                      clipBehavior:
                                          Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 5,
                                      child: Image.network(
                                        fotos[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                });
                          })
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(fit: StackFit.expand, children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    ));
  }
}
