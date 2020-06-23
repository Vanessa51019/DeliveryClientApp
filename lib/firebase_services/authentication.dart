import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/firebase_services/basic_firebase.dart';
import 'package:delivery_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);
  Future<User> getUserInfo(String userId);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<User> getUserInfo(String uid) async {
    QuerySnapshot docSnapShot = await db
        .collection('clients')
        .where('uid', isEqualTo: uid)
        .getDocuments();
    if (docSnapShot == null || docSnapShot.documents.length == 0) {
      return null;
    }
    return User.fromJson(docSnapShot.documents[0].data);
  }
}
