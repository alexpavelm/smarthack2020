import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _fireStore;

  FirebaseService({FirebaseAuth firebaseAuth, FirebaseFirestore fireStore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _fireStore = fireStore ?? FirebaseFirestore.instance;

}
