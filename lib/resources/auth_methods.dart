import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instragram_clone/resources/storage_method.dart';
import 'package:instragram_clone/models/user.dart' as model;

class AuthMethods
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // get user details
  Future<model.User> getUserDetails() async
  {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot = await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }


  //signup user

  Future<String> signUpUser({required String email, required String password, String? bio, required Uint8List file, required String username}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file, false);

        // add user to our database

        model.User user = model.User
          (
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio ?? '',
          followers: [],
          following: [],
          photoUrl: photoUrl ,
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());

        // await _firestore.collection('users').add({
        //   'username' : username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': [],
        // });
        res = "Success";
      }
    } catch (err) {
      res = err.toString();
      print(res);
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({required String email, required String password,}) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty)
      {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(email: email, password: password,);
        res = "Success";
      }
      else
      {
        res = "Please enter all the fields";
      }
    }
    catch (err)
    {
      return err.toString();
    }
    return res;
  }
}
