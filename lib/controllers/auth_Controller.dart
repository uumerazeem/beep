import 'dart:developer';
import 'package:asignment/screens/auth/verification_screen.dart';
import 'package:asignment/screens/landing.dart';
import 'package:asignment/utils/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AuthController extends GetxController {
  FirebaseFirestore instance = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  var signUpLoading = false.obs;
  var signInLoading = false.obs;
  var verifyLoading = false.obs;
  String collection = "users";

  sendNumber(String phone, bool allowNavigation) {
    auth.verifyPhoneNumber(
      phoneNumber: "+92 $phone",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (_) {},
      verificationFailed: (e) {
        log("error" + e.toString());
        Get.snackbar("Error", "Can't sign up right now");
        signUpLoading(false);
      },
      codeSent: (verificationId, token) {
        if (allowNavigation == true) {
          Get.to(VerifyScreen(
            verificationId: verificationId,
            token: token.toString(),
            phoneN: phone,
          ));
        } else {}

        log("done " + token.toString());
        signUpLoading(false);
      },
      codeAutoRetrievalTimeout: (w) {
        Get.snackbar("Error", "Can't sign up right now");
      },
    );
  }

  Future<bool> userExists(String phone) async => (await instance
          .collection("users")
          .where("phone", isEqualTo: phone)
          .get())
      .docs
      .isNotEmpty;

  signUp(String phone, String name, String pass) async {
    try {
      signUpLoading(true);
      bool checkUser = await userExists(phone);
      if (checkUser == false) {
        var uid = Uuid().v4();

        await instance.collection(collection).doc().set({
          "name": name,
          "phone": phone,
          "uid": uid,
          "password": pass,
          "verified": false
        }).then((value) {
          sendNumber(phone, true);
        }).onError((error, stackTrace) {
          Get.snackbar("Error", "Can't sign up right now");
        });
      } else {
        Get.snackbar("Sign Up", "User already exist");
      }
    } finally {
      signUpLoading(false);
    }
  }

  login(String phone, String pass) async {
    try {
      signInLoading(true);
      bool checkUser = await userExists(phone);
      if (checkUser == true) {
        await instance
            .collection(collection)
            .where("phone", isEqualTo: phone)
            .where("password", isEqualTo: pass)
            .get()
            .then((
          value,
        ) {
          Map<String, dynamic> data = value.docs.first.data();

          if (data["verified"].toString() == "true") {
            PreferencesService.saveUserName(data["name"].toString());
          } else {
            sendNumber(phone, true);
          }
        });
      } else {
        Get.snackbar("Log In", "User doesn't exist");
      }
    } finally {
      signInLoading(false);
    }
  }

  verifyUser(String verificationId, String code) async {
    try {
      verifyLoading(true);
      final credentials = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);

      await auth.signInWithCredential(credentials).then((value) {
        Get.off(LandingScreen());
      }).onError((error, stackTrace) {
        Get.snackbar("Error", "Resend code again");
      });
    } finally {
      verifyLoading(false);
    }
  }
}
