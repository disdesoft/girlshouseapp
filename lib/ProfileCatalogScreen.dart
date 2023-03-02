import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileCatalogScreen extends StatefulWidget {
  const ProfileCatalogScreen({super.key});

  @override
  State<ProfileCatalogScreen> createState() => _ProfileCatalogScreenState();
}

class _ProfileCatalogScreenState extends State<ProfileCatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de perfiles'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('profiles').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final profiles = snapshot.data!.docs;
          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              final profile = profiles[index];
              return ListTile(
                title: Text(profile['name']),
                subtitle: Text(profile['description']),
              );
            },
          );
        },
      ),
    );
  }
}