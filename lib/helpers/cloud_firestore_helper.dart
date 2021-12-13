import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference getCollectionRef(String path) {
  return FirebaseFirestore.instance.collection(path);
}

CollectionReference getCollection(userId, rest) {
  String path = 'api/$userId/$rest';
  final CollectionReference collection =
      FirebaseFirestore.instance.collection(path);
  return collection;
}

// ? validation 필요
Future<void> getData(path, setter) async {
  QuerySnapshot querySnapshot = await getCollectionRef(path).get();
  final response = querySnapshot.docs.map((doc) => doc.data()).toList();
  setter(response);
}

Future<void> getDataWithFilter(path, fillter, setter) async {
  QuerySnapshot querySnapshot = await getCollectionRef(path).get();
  final response = querySnapshot.docs.map((doc) => doc.data()).toList();
  final filteredResponse = fillter(response);
  setter(filteredResponse);
}
