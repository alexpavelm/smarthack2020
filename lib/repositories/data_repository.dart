import 'package:baseapp/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class DataRepository {
  FirebaseService firebaseService;

  DataRepository({this.firebaseService});

  Future<List<String>> getEvents() async {
    /*return (await firebaseService.getEvents())
        .map((documentSnapshot) => EventModel.fromSnapshot(documentSnapshot))
        .toList();*/
  }
}
