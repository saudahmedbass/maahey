import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maahey/views/splash_screen/splash_screen.dart';

class CustomFirebase {
  final FirebaseAuth _firebaseAuth;
  FirebaseFirestore _firestore;

  CustomFirebase(this._firebaseAuth, this._firestore);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signUpWithEmailPassword(
      {required String email, required String password}) async {
    //
    print({email, password});
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("singed in ");
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print("singed in ");
      print(credential);

      if (authStateChanges != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  //read docs from firestore
  // void readPropertyDataFromFirestore(
  //     {String? collection, String? docId}) async {
  //   CollectionReference collectionReference =
  //       _firestore.collection(collection!);

  //   QuerySnapshot<Object?>? querySnapshot;
  //   DocumentSnapshot<Object?>? documentSnapshot;
  //   PropertyData? propertyData;

  //   docId == null
  //       ? querySnapshot = await collectionReference.get()
  //       : documentSnapshot = await collectionReference.doc(docId).get();

  //   // print(documentSnapshot!.data());

  //   // print(jsonEncode(documentSnapshot!.data()));

  //   propertyData = PropertyData.fromJson(documentSnapshot!.data());

  //   print(propertyData);
  // }

  //create docs on firestore

  //update docs on firestore

  //delete docs on firestore

  //upload files to firebase

  //download files from firebase

  //get user data from firebase

  //update user data on firebase

}
