import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<UserCredential> signInAnonymously() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      return userCredential;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> registerUser({String email, String password}) async {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  String getUserId() {
    return _firebaseAuth.currentUser.uid;
  }

  String getUserEmail() {
    return _firebaseAuth.currentUser.email;
  }

  Future<void> signInWithCredentials({String email, String password}) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  bool isSignedIn(){
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  Future<void> setUserFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("firstTime", false);
  }

  Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("firstTime") ?? true;
  }
}