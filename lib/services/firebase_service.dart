import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsuarios() async {
  List usuarios = [];
  CollectionReference collectionReferenceUsuarios =
      db.collection('usuarios');

  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

  // ignore: avoid_function_literals_in_foreach_calls
  queryUsuarios.docs.forEach((documento) {
    usuarios.add(documento.data());
  });

  return usuarios;
}
