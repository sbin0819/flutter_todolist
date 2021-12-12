import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference getCollectionRef(String path) {
  return FirebaseFirestore.instance.collection(path);
}

Future<void> getData(path, callback) async {
  QuerySnapshot querySnapshot = await getCollectionRef(path).get();
  final response = querySnapshot.docs.map((doc) => doc.data()).toList();
  callback(response);
}

Future<void> getDataWithFilter(path, fillter, callback) async {
  QuerySnapshot querySnapshot = await getCollectionRef(path).get();
  final response = querySnapshot.docs.map((doc) => doc.data()).toList();
  final filteredResponse = fillter;
  callback(response);
}
