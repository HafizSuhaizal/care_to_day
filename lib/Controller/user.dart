import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/user.dart';

class UserController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _firestore.collection("users").doc(user.email).set(user.toMap());
  }

  Future<UserModel?> getUser(String useremail) async{

    QuerySnapshot querySnapshot = await _firestore.collection("users").where("email", isEqualTo: useremail).get();

    if (querySnapshot.docs.isNotEmpty) {
      
      var userDoc = querySnapshot.docs.first;
      
      return UserModel(
        address: userDoc['address'],
        email: userDoc['email'],
        name: userDoc['name'],
        phoneNo: userDoc['phoneNo'],
        role: userDoc['role']
      );
      
    } else {
      return null;
    }

  }

}

