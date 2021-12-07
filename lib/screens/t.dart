import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubScreen extends StatefulWidget {
  static const routeName = '/sub';
  const SubScreen({Key? key}) : super(key: key);

  @override
  State<SubScreen> createState() => _SubScreenState();
}

class _SubScreenState extends State<SubScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference<Map<String, dynamic>> todolist =
      FirebaseFirestore.instance.collection('api/user1/todos').doc('todo1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'cloud_store test page',
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: todolist.get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            print('d');
            print(data);
            return Center(
                // child: Text(
                //   // "Todo: ${data['content']}",
                // ),
                );
          }

          return Text("loading");
        },
      ),
    );
  }
}
