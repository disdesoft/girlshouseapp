import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final String phone;

  const ProfileDetailsScreen({
    Key? key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 51,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: const Color.fromARGB(255, 255, 210, 210),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'Servicio',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '100k',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
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
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shadowColor: Colors.white,
                      side: const BorderSide(width: 1, color: Color.fromARGB(255, 255, 210, 210)),
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 255, 210, 210),
                      size: 18,
                    )),
                const SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                  onPressed: () {
                    _makePhoneCall(phone);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shadowColor: Colors.white,
                    side: const BorderSide(width: 1, color: Colors.green),
                  ),
                  child: const Icon(
                    Icons.phone,
                    color: Colors.green,
                    size: 18,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(1.0),
              child: Divider(
                height: 5,
                thickness: 0.6,
                //color: Colors.white,
              ),
            ),
            Expanded(
                child: Center(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('profiles')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final profiles = snapshot.data!.docs;
                    return GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    builder: (_) => FullScreenImage(
                                        imageUrl: profile['imageUrl']),
                                  ));
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
                              child: Image.network(
                                profile['imageUrl'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        });
                  }),
            ))
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
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Column(
              children: [
                Image.network(imageUrl),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Atras',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_makePhoneCall(String phone) async {
  String url = phone;
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'No se puede hacer la llamada a $url';
  }
}
