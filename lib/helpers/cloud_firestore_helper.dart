import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference getCollectionRef(String path) {
  return FirebaseFirestore.instance.collection(path);
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
