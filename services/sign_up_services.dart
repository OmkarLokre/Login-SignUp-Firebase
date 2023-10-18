import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example_proj1/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Update the function signature to accept a BuildContext parameter
SignUp(BuildContext context, String username, String email, String phone, String password) async {
  User? userId = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection("users").doc(userId!.uid).set(
      {
        'username': username,
        'phone': phone,
        'E-email': email,
        'createdAt': DateTime.now(),
        'UserId': userId!.uid,
      },
    ).then((value) {
      FirebaseAuth.instance.signOut();
      // Use the provided context to navigate to HomePage
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  } on FirebaseAuthException catch (e) {
    print("Omkar Error: $e");
  }
}
