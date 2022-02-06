import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String getUserId() {
    return _firebaseAuth.currentUser.uid;
  }

  final CollectionReference productsRef = FirebaseFirestore
      .instance
      .collection("Products");

  final CollectionReference workerRef = FirebaseFirestore
      .instance
      .collection("Workers");

  final CollectionReference usersRef = FirebaseFirestore
      .instance
      .collection("Users");
  final CollectionReference userRef = FirebaseFirestore
      .instance
      .collection("Worker");

}