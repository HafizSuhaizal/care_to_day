import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/user.dart';

class UserController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _firestore.collection("users").doc(user.email).set(user.toMap());
  }

}
