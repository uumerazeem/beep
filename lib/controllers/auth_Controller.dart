import 'dart:developer';

import 'package:asignment/screens/auth/verification_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AuthController extends GetxController {
  FirebaseFirestore instance = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  var signUpLoading = false.obs;
  String collection = "users";

  verifyPhone(String phone) {
    auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (_) {

      },
      verificationFailed: (e) {
        log("error" + e.toString());
        Get.snackbar("Error", "Can't sign up right now");
        signUpLoading(false);
      },
      codeSent: (verificationId, token) {
        // Get.to(VerifyScreen(
        //     verificationId: verificationId, token: token.toString()));
        log("done "+ token.toString());
        signUpLoading(false);
      },
      codeAutoRetrievalTimeout: (w) {
        Get.snackbar("Error", "Can't sign up right now");
      },
    );
  }

  signUp(String phone, String name, String pass) async {
    try {
      signUpLoading(true);
      var uid = Uuid().v4();

      await instance.collection(collection).doc().set({
        "phone": phone,
        "uid": uid,
        "password": pass,
        "verified": false
      }).then((value) {
        verifyPhone(phone);
      }).onError((error, stackTrace) {
        Get.snackbar("Error", "Can't sign up right now");
      });
    } finally {
      signUpLoading(false);
    }
  }
  
}
