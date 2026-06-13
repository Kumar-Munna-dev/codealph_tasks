import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get emailcontroller => _emailController;
  TextEditingController get passwordcontroller => _passwordController;
  TextEditingController get namecontroller => _nameController;

  Future<User?> createUserWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
      User? user = userCredential.user;
      if (user != null) {
        // 2. Update Display Name
        await user.updateDisplayName(_nameController.text.trim());

        // 3. Store additional data (Phone) in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
          'phoneNumber': '9334254991',
          'createdAt': FieldValue.serverTimestamp(),
        });

        await user.reload();
        return FirebaseAuth.instance.currentUser;
      }

      //print(userCredential.user?.uid);
    } on FirebaseException catch (e) {
      //print(e.message);
    }
    return null;
  }

  Future<void> loginUserWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
      // print(userCredential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    notifyListeners();
  }

  /*Future<void> uploadData()async{
  try{
    FirebaseFirestore.instance.collection('task').add({'title':"","description":'','date':''}})
  }on FirebaseException catch(e){

  }
}*/
}
