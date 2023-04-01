import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCards extends StatefulWidget {
  const ProductCards({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductCardsState createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  final List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    _getDataFromFirebase();
  }

  void _getDataFromFirebase() {
    FirebaseFirestore.instance.collection('mi_coleccion').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _dataList.add(doc.data());
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista horizontal con tarjetas y datos de Firebase'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _dataList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Image.network(_dataList[index]['imagen']),
                Text(_dataList[index]['titulo']),
                Text(_dataList[index]['descripcion']),
              ],
            ),
          );
        },
      ),
    );
  }
}
