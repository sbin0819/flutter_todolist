import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class FutureScreen extends StatelessWidget {
  static const routeName = '/future-test';
  const FutureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('api/user1/todos');

    Future<void> getData() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await _collectionRef.get();

      print(querySnapshot);
      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      print(allData);
    }

    getData();
    return Scaffold(
      body: Center(
        child: Text('future test'),
      ),
    );
  }
}
