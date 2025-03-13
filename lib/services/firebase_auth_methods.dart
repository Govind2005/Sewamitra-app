import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sewamitra/utils/showOTPDialog.dart';
import 'package:sewamitra/utils/showSnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  User get user => _auth.currentUser!;

  // State Persistence
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  //   Email verification
  Future<void>sendEmailVerification(BuildContext context) async  {
    try{
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    }
    on FirebaseAuthException catch(e) {
      showSnackBar(context, e.message!);
    }
  }

//  Email sign up
Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
}) async {
  try {
    await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    await sendEmailVerification(context);
  }on FirebaseAuthException catch (e) {
    showSnackBar(context, e.message!);
  }
}
//   Email Login
  Future<void>loginWithEmail({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch(e) {
      showSnackBar(context, e.message!);
    }
  }
//   Google Sign In
  Future<void> signInWithGoogle(BuildContext context) async {
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken
        );
        UserCredential userCredential = await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {}
        }
      }
    }
    on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//   Phone Sign In
  Future<void> phoneSignIn(
      BuildContext context,
      String phoneNumber,
      ) async {
    TextEditingController codeController = TextEditingController();
  //   For Android, Ios
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showSnackBar(context, e.message!);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          showOTPDialog(
            codeController: codeController,
            context: context,
            onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: codeController.text.trim(),
              );
              await _auth.signInWithCredential(credential);
              Navigator.of(context).pop();
            }
          );
        }),
        codeAutoRetrievalTimeout: (String verificationid) {
        // Aut-resolution timed out...
        }
    );
  }
}